# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: thecashewtrader <thecashewtrader at protonmail dot com>

_zig=anyzig
pkgname="ziggy"
pkgver=0.3.0
pkgrel=1
pkgdesc="A data serialization language for expressing clear API messages, config files, etc"
arch=(
  'aarch64'
  'x86_64'
)
url="https://ziggy-lang.io"
_url="https://github.com/kristoff-it/${pkgname}"
license=(
  'MIT'
)
makedepends=(
  "anyzig"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('d15433e0356b36cde6b24ca2613463a9bbdbf85ac8a52996b8e714de43745eac53b3a4b5dfcb53b4f1c0e5d0bccda1fd65960b588c29ded60bcb801327c0989b')
           
build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "${_zig}" build "${zig_options[@]}"
  find "build" -type f -name '*.zig' -delete
}

# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     # --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.42
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#   )

#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" "${_zig}" build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
