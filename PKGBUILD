# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=zig
pkgname="anyzig"
pkgver=2026_10_20
pkgrel=1
pkgdesc="One zig to rule them all"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://github.com/marler8997/${pkgname}"
license=(
  'MIT'
)
makedepends=(
  "zig>=0.17"
  # "zig${_zig}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('90fd49f7b67c2e5c2c06841b089cef45b24e2f3962fb5eafc3d92f029cac43b65e530678dd5d3b90abfa6f4ce0a4ba13f5473e85fa467fd3b3a2c71b994bad0d')

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    # --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "${_zig}" build "${zig_options[@]}"
}

# tests require an internet connection and download huge files
# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr#
#     # --global-cache-dir "${srcdir}/zig-global-cache"
#     # --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.42
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" "${_zig}" build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "build/usr/bin"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${pkgname}"
}
