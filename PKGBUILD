# Maintainer: AscendLiu <ascendliu@qq.com>
# Contributor: ...

pkgname=cangjie-nightly-bin
pkgver=1.2.0_alpha.20260707020028
pkgrel=1
pkgdesc='Cangjie programming language toolchain - Nightly channel (binary distribution)'
arch=('x86_64' 'aarch64')
url='https://cangjie-lang.cn'
license=('Apache-2.0')
options=('!strip' '!debug' '!emptydirs')
depends=(
  'glibc>=2.22'
  'gcc-libs'
  'openssl>=3.0.7'
  'zlib'
)
makedepends=('curl')
optdepends=(
  'clang: for Cangjie-C interop'
  'lldb: for cjdb debugger'
)
provides=('cangjie')
conflicts=('cangjie')
install=cangjie-nightly-bin.install

source_x86_64=("cangjie-sdk-linux-x64-${pkgver}.tar.gz::https://gitcode.com/Cangjie/nightly_build/releases/download/${pkgver//_/-}/cangjie-sdk-linux-x64-${pkgver//_/-}.tar.gz")
source_aarch64=("cangjie-sdk-linux-aarch64-${pkgver}.tar.gz::https://gitcode.com/Cangjie/nightly_build/releases/download/${pkgver//_/-}/cangjie-sdk-linux-aarch64-${pkgver//_/-}.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
  curl -sL 'https://api.gitcode.com/api/v5/repos/Cangjie/nightly_build/releases/latest' \
    | python3 -c "import sys,json;print(json.load(sys.stdin)['tag_name'].replace('-','_'))"
}

build() {
  cd "$srcdir/cangjie"

  # Remove non-Linux, non-current-arch runtime libraries
  if [[ -d runtime/lib ]]; then
    for _d in runtime/lib/*/; do
      [[ -d "$_d" ]] || continue
      _base="${_d%/}"; _base="${_base##*/}"
      [[ "$_base" == linux_${CARCH}_* ]] && continue
      rm -rf "$_d"
    done
  fi

  # Remove non-Linux, non-current-arch compiler libraries
  if [[ -d lib ]]; then
    for _d in lib/*/; do
      [[ -d "$_d" ]] || continue
      _base="${_d%/}"; _base="${_base##*/}"
      [[ "$_base" == linux_${CARCH}_* ]] && continue
      rm -rf "$_d"
    done
  fi

  # Remove non-Linux, non-current-arch modules
  if [[ -d modules ]]; then
    for _d in modules/*/; do
      [[ -d "$_d" ]] || continue
      _base="${_d%/}"; _base="${_base##*/}"
      [[ "$_base" == linux_${CARCH}_* ]] && continue
      rm -rf "$_d"
    done
  fi
}

package() {
  cd "$srcdir/cangjie"

  # 1. Install SDK to /opt/cangjie-nightly
  install -d "$pkgdir/opt/cangjie-nightly"
  cp -ar . "$pkgdir/opt/cangjie-nightly/"

  # 2. Symlink all executables to /usr/bin/ for immediate PATH access
  install -d "$pkgdir/usr/bin"
  while IFS= read -r -d '' _bin; do
    _rel="${_bin#$pkgdir/}"
    ln -s "/$_rel" "$pkgdir/usr/bin/${_bin##*/}"
  done < <(find "$pkgdir/opt/cangjie-nightly/bin" "$pkgdir/opt/cangjie-nightly/tools/bin" -type f -executable -print0 2>/dev/null; :)

  # 3. Register runtime libraries with ldconfig
  install -d "$pkgdir/etc/ld.so.conf.d"
  while IFS= read -r -d '' _libdir; do
    _rel="${_libdir#$pkgdir/}"
    echo "/$_rel" >> "$pkgdir/etc/ld.so.conf.d/cangjie-nightly.conf"
  done < <(find "$pkgdir/opt/cangjie-nightly/runtime/lib" -maxdepth 1 -type d -name 'linux_*' -print0 2>/dev/null; :)

  # 4. Profile.d script for interactive-shell environment variables
  install -d "$pkgdir/etc/profile.d"
  cat > "$pkgdir/etc/profile.d/cangjie-nightly.sh" << 'PROFEOF'
# /etc/profile.d/cangjie-nightly.sh — Cangjie Nightly environment

CANGJIE_HOME=/opt/cangjie-nightly
export CANGJIE_HOME

case ":${PATH}:" in
  *:"${CANGJIE_HOME}/bin":*)  ;;
  *) PATH="${CANGJIE_HOME}/bin:${PATH}" ;;
esac

case ":${PATH}:" in
  *:"${CANGJIE_HOME}/tools/bin":*)  ;;
  *) PATH="${CANGJIE_HOME}/tools/bin:${PATH}" ;;
esac
PROFEOF
  chmod 644 "$pkgdir/etc/profile.d/cangjie-nightly.sh"

  # 5. Install license
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
