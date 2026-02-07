# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Xiang Chen <iflygo@outlook.com>

_zig=0.14
pkgname=zigup
pkgver=2025_05_24
pkgrel=1
pkgdesc="Download and manage Zig compilers"
arch=(
  'x86_64'
)
url="https://github.com/marler8997/${pkgname}"
license=(
  'MIT-0'
)
depends=(
  'tar'
)
makedepends=(
  "zig${_zig}-bin"
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('591049b72a891d027f7991c07f8d48687b1f712db466dee6830c2939e9a0da2f7a741b03f016b33bd53b9135ea7c9c9bae0a2e9a9de88fcc497c3265b2707b93')

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
    # -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig${_zig}" build "${zig_options[@]}"
}

# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     # --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.42
#     -Dcpu=baseline
#     # -Doptimize=ReleaseSafe
#   )

#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" "zig${_zig}" build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
