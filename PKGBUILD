# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="TermGL"
_name="${_Name,,}"
_pkgname="lib${_name}"
pkgname="${_pkgname}-git"
pkgver=1.5.0.r1.g70954e6
pkgrel=1
pkgdesc="2D & 3D graphics engine in the terminal"
arch=('x86_64')
url="https://github.com/wojciech-graj/${_Name}"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}" "${_pkgname}.so")
conflicts=("${_pkgname}")
_pkgsrc="${_Name}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {
#   cd "${srcdir}/${_pkgsrc}"
#   sed -i 's|/usr/local|'"${pkgdir}/usr|g" Makefile
# }

build() {
  cd "${srcdir}/${_pkgsrc}"
  make shared
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # mkdir -p "${pkgdir}/usr/lib" "${pkgdir}/usr/include"
  # make DESTDIR="${pkgdir}" install

  install -vDm644 "${_pkgname}.so" "${pkgdir}/usr/lib/${_pkgname}.so.${pkgver%%.r*}"
  install -vDm644 "${_name}.h"    "${pkgdir}/usr/include/${_name}.h"

  cd "${pkgdir}/usr/lib"
  ln -vs "${_pkgname}.so.${pkgver%%.r*}" "${_pkgname}.so.${pkgver%%.*}"
  ln -vs "${_pkgname}.so.${pkgver%%.r*}" "${_pkgname}.so"
}
