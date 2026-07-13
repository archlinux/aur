# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=anyzig
pkgname="zine"
pkgver=0.12.0
pkgrel=1
pkgdesc="Fast, Scalable, Flexible Static Site Generator (SSG)"
arch=(
  'aarch64'
  'x86_64'
)
url="https://zine-ssg.io"
_url="https://github.com/kristoff-it/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
makedepends=(
  'anyzig'
  'git'
  # 'zig'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
)
b2sums=('7564cade446b264e33fba4de00399e8abb060851d4d3f9902aa24cc3cf68d0a0de416a996dcd1de86b57eec3ba8110b566c66d41789d8ce4232f11f269753f7e')

build() {
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
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     # --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.41
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#   )

#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" "${_zig}" build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
