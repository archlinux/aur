# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# curl "https://releases.zigtools.org/v1/zls/select-version?zig_version=$(zig-mach version | tr -d '\n' | jq -sRr @uri)&compatibility=full" | jq

_basename="zls"
_suffix="-mach"
pkgname="${_basename}${_suffix}"
pkgver=0.16.0dev.300+f391142c
_pkgver="${pkgver//dev/-dev}"
pkgrel=1
pkgdesc="A language server for Zig"
arch=(
  'aarch64'     # 'aarch64'
  'armv7h'      # 'arm'
  'loong64'     # 'loongarch64'
  # 'powerpc64le' # 'powerpc64le'
  'riscv64'     # 'riscv64'
  # 's390x'       # 's390x'
  'i686'        # 'x86'
  'x86_64'      # 'x86_64'
)
url="https://zigtools.org/zls"
_url="https://github.com/zigtools/${_basename}"
license=(
  'MIT'
)
depends=(
  'sh'
  "zig${_suffix}"
)
makedepends=(
  'git'
)
_zigdepends=(
  # zls
  "known-folders-175f5596b3d2ee3c658282bb07885580895a0e73.tar.gz::https://github.com/ziglibs/known-folders/archive/175f5596b3d2ee3c658282bb07885580895a0e73.tar.gz"
  "diffz-d93d5737d2c19a2fb279c8dcaa80a4ce35529a3b.tar.gz::https://github.com/ziglibs/diffz/archive/d93d5737d2c19a2fb279c8dcaa80a4ce35529a3b.tar.gz"
  "lsp-kit-ec325a3c33d1da7708cf513355208f74d9560580.tar.gz::https://github.com/zigtools/lsp-kit/archive/ec325a3c33d1da7708cf513355208f74d9560580.tar.gz"
  "tracy-0.13.1.tar.gz::https://github.com/wolfpld/tracy/archive/refs/tags/v0.13.1.tar.gz"
)
_pkgsrc="${_url##*/}"
source=(
  "${_basename}-versioned.sh"
  "${_pkgsrc}::git+${_url}.git#commit=${pkgver##*+}"
  # "${_zigdepends[@]}"
)
# noextract=(
#   "${_zigdepends[@]%%::*}"
# )
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            '9d420af9bed20385f7bfd99a0221423011f7a75a3bb749684d3565bcb703d613')

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_suffix}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"

  # cd "${_pkgsrc}"
  # for _zigdepend in "${_zigdepends[@]}"; do
  #   "zig${_suffix}" fetch --global-cache-dir "${srcdir}/zig-global-cache" "${srcdir}/${_zigdepend%%::*}"
  # done
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dpie=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig${_suffix}" build "${zig_options[@]}"
}

check() {
  export PATH="/opt/zig${_suffix}:$PATH"
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dpie=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" "zig${_suffix}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "build/usr/bin"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${pkgname}/${_basename}"
}
