# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=anyzig
pkgname="zine"
pkgver=0.14.0
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
b2sums=('6025cd420991dd05db995143e4fb26ea2e79c52a9952fffc210e768be7f9192bb8a61be6640f488cfcfc06c10565ee4328fe1deb093e8fe726fb64f8e700db55')

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
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

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
