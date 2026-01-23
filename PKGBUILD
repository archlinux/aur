# Maintainer: Sasha Marie te Rehorst <sasha.marieterehorst@gmail.com>
# Contributor: BingBong
# Contributor: Alberto Salvia Novella (es20490446e.wordpress.com)
# Contributor: Bryan Malyn <bim9262@gmail.com>
# Contributor: Spider Mario <spidermario@free.fr>
# Contributor: Taras Shpot <mrshpot@gmail.com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: userwithuid <userwithuid@gmail.com>

pkgbase=rust-git
pkgname=( rust-git rust-musl-git rust-wasm-git rust-src-git )
pkgname_x86_64=( lib32-rust-libs-git rust-aarch64-gnu-git rust-aarch64-musl-git )
pkgver=1.95.0.r316094.g1655912
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency (GIT VERSION)"
url="https://www.rust-lang.org"
arch=(aarch64 x86_64)
license=("Apache-2.0 OR MIT")

depends=(
  bash
  compiler-rt
  curl
  gcc
  gcc-libs
  glibc
  libssh2
  lld
  llvm-libs
  openssl
  zlib
)

makedepends=(
  clang
  cmake
  git
  libffi
  llvm
  musl
  ninja
  perl
  python
  wasi-libc
  wasm-component-ld
)

makedepends_x86_64=(
  aarch64-linux-gnu-gcc
  aarch64-linux-gnu-glibc
  lib32-gcc-libs
  lib32-glibc
  musl-aarch64
)

checkdepends=( gdb procps-ng )

source_aarch64=(bootstrap.aarch64.toml)
source_x86_64=(bootstrap.x86_64.toml)
source=(
  "git+https://github.com/rust-lang/rust.git"
  "0001-bootstrap-Change-libexec-dir.patch"
  "0002-bootstrap-Change-bash-completion-dir.patch"
  "0003-bootstrap-Workaround-for-system-stage0.patch"
  "0004-compiler-Change-LLVM-targets.patch"
  "0005-compiler-Use-ld.lld-by-default.patch"
  "0006-compiler-Use-aarch64-linux-gnu-gcc-to-link-aarch64-t.patch"
  "0007-compiler-Swap-primary-and-secondary-lib-dirs.patch"
)

b2sums=('SKIP'
        '5f42356ef9dc8071df9284d5adcce2cba37072684431c1dad8bbbe4b1b3d31f3bdd18b48252fc44e9d0aa39e33342936be3821106509d99183d88e0f53b4645f'
        '06e3054314c80743c533f70b1d04ba47f9d4e04f94cf800b119bf33a6611b87c0732407328c390057973a3509ca0a0dbbfcecd9bc6d227968c33b18e8840b23c'
        '9e0139640c87ca3c3a550ce95e80a36368e101b124b99cb2a30b7b594b60e921350d65556784e801500ea59135f79cb4faf07a091223032092173ec6eae3397b'
        'effaaae130594ba2138aa150b7c509705a72aab8a4ab27ebc594ceee80ee790d6654d8cd3b7cd2ed28d2e69fb449928fff95538c9af007ec81869980e71b49f1'
        'f122bd84206ef82b72a6a9af6210a661fe8a6705b353f6bafefe409aebaa3a9bb90b6533867ac44748faf502b5363f59b1e835cb5143f9a546bbc5af5f97c558'
        '40e14ccc8b5dfff5d87f43a8763d1d2a49435c7a76633a920648a43dd25df0ab056107722ccdc574d9d603322699c6f3990878e19ab25d5e0117689d8f6b99b8'
        'd80b9cfc4cbba2ad6800606bdf14183de990db33954b9ec63d393493ab77c82714a2069e20495a55c13c778d8ea052ccfbaa7d5b79716c494281c6b34e990137')
b2sums_aarch64=('f5b57f6b87ee8ba10df21f77e1ad28d15a5a3178fd28d281fb8926e2a625c512baefcbc31af562784d23c60cd81fd2cf4e435be6107efe57851b4c183c1ca445')
b2sums_x86_64=('8c3795e993beb7c6e586e78e4ae82114bf85b349438c2b94e0ad8f809cc50a2bbe987ee8dff37aebb54dc39d9707d4ad54592004bcb1a66a3fff9163df89a3fa')

COMPRESSZST+=(--long)

pkgver() {
  cd rust
  local _ver="$(cat src/version)"
  _ver="$(echo $_ver | tr -d '[:space:]')"
  printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd rust

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    patch -Np1 < "../$src"
  done

  cp "../bootstrap.${CARCH}.toml" config.toml

  sed -i 's/vendor = true/vendor = false/g' config.toml
  sed -i 's/locked-deps = true/locked-deps = false/g' config.toml
  sed -i 's/channel = "stable"/channel = "nightly"/g' config.toml
  sed -i 's/lto = "fat"/lto = "off"/g' config.toml
  sed -i '/rustc = "\/usr\/bin\/rustc"/d' config.toml
  sed -i '/cargo = "\/usr\/bin\/cargo"/d' config.toml

  local clangdir
  clangdir="$(clang -print-resource-dir)"
  sed -i "s|%description%|Arch Linux $pkgbase $epoch:$pkgver-$pkgrel|g" config.toml
  sed -i "s|%clangdir%|$clangdir|g" config.toml
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  cd rust

  export RUST_BACKTRACE=1
  unset CFLAGS CXXFLAGS LDFLAGS

  DESTDIR="$srcdir/dest-rust" python ./x.py install -j "$(nproc)"

  cd ../dest-rust

  rm -vf etc/target-spec-json-schema.json
  rm -vf usr/lib/rustlib/{components,install.log,rust-installer-version,uninstall.sh}
  rm -vf usr/lib/rustlib/manifest-*

  local ldir="usr/share/licenses/rust-git" f d
  mkdir -p "$ldir"
  for f in usr/share/doc/*/{COPYRIGHT,LICENSE}*; do
    d="$(dirname "$f")"
    case $f in
      */LICENSE-APACHE) rm -v "$f" ;;
      *) mv -v "$f" "$ldir/${f##*/}.${d##*/}" ;;
    esac
    rmdir -p --ignore-fail-on-non-empty "$d"
  done

  ln -srvft usr/lib usr/lib/rustlib/${CARCH}-unknown-linux-gnu/lib/*.so

  mkdir -pv usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin/gcc-ld
  ln -srvf  usr/bin/lld          usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin/rust-lld
  ln -srvf  usr/bin/llvm-objcopy usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin/rust-objcopy
  ln -srvft usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin/gcc-ld usr/bin/{ld.lld,ld64.lld,lld-link,wasm-ld}

  _pick dest-musl usr/lib/rustlib/${CARCH}-unknown-linux-musl
  _pick dest-wasm usr/lib/rustlib/wasm32{,v1}-*
  _pick dest-src  usr/lib/rustlib/src

  if [[ $CARCH == x86_64 ]]; then
    _pick dest-i686 usr/lib/rustlib/i686-unknown-linux-gnu
    _pick dest-aarch64-gnu usr/lib/rustlib/aarch64-unknown-linux-gnu
    _pick dest-aarch64-musl usr/lib/rustlib/aarch64-unknown-linux-musl
  fi
}

_install_licenses() {
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 \
    "$srcdir/rust"/{COPYRIGHT,LICENSE-MIT}
}

package_rust-git() {
  optdepends=(
    'gdb: rust-gdb script'
    'lldb: rust-lldb script'
  )
  
  provides=(
    cargo
    "rust=${pkgver}" 
    rustfmt
  )
  
  conflicts=(
    cargo
    rust
    rustfmt
  )
  
  replaces=(
    cargo
    rustfmt
  )

  cp -a dest-rust/* "$pkgdir"
}

package_lib32-rust-libs-git() {
  pkgdesc="32-bit target and libraries for Rust (GIT VERSION)"
  depends=(
    lib32-gcc-libs
    lib32-glibc
    rust-git
  )
  provides=(lib32-rust)
  conflicts=(lib32-rust)
  replaces=(lib32-rust)

  cp -a dest-i686/* "$pkgdir"
  _install_licenses

  cd "$pkgdir"
  mkdir -pv usr/lib32
  ln -srvft usr/lib32 usr/lib/rustlib/i686-unknown-linux-gnu/lib/*.so
}

package_rust-musl-git() {
  pkgdesc="Musl target for Rust (GIT VERSION)"
  depends=(rust-git)
  provides=(rust-musl)
  conflicts=(rust-musl)

  cp -a dest-musl/* "$pkgdir"
  _install_licenses
}

package_rust-aarch64-gnu-git() {
  pkgdesc="AArch64 GNU target for Rust (GIT VERSION)"
  depends=(
    aarch64-linux-gnu-gcc
    aarch64-linux-gnu-glibc
    rust-git
  )
  provides=(rust-aarch64-gnu)
  conflicts=(rust-aarch64-gnu)

  cp -a dest-aarch64-gnu/* "$pkgdir"
  _install_licenses
}

package_rust-aarch64-musl-git() {
  pkgdesc="AArch64 Musl target for Rust (GIT VERSION)"
  depends=(
    aarch64-linux-gnu-gcc
    rust-git
  )
  provides=(rust-aarch64-musl)
  conflicts=(rust-aarch64-musl)

  cp -a dest-aarch64-musl/* "$pkgdir"
  _install_licenses
}

package_rust-wasm-git() {
  pkgdesc="WebAssembly targets for Rust (GIT VERSION)"
  depends=(
    rust-git
    wasm-component-ld
  )
  provides=(rust-wasm)
  conflicts=(rust-wasm)

  cp -a dest-wasm/* "$pkgdir"
  _install_licenses
}

package_rust-src-git() {
  pkgdesc="Source code for the Rust standard library (GIT VERSION)"
  depends=(rust-git)
  provides=("rust-src=${pkgver}")
  conflicts=(rust-src)

  cp -a dest-src/* "$pkgdir"
  _install_licenses
}
