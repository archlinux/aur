# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_pkgname=appmenu-qt5
pkgname=${_pkgname}-git
pkgver=r4.ac0a789
pkgrel=1
pkgdesc="Qt5-compatible approach of the existing appmenu-qt."
arch=('i686' 'x86_64')
url='https://github.com/gustawho/appmenu-qt5'
license=('GPL')
depends=('libdbusmenu-qt5' 'gtk2')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bzr")
source=("git+https://github.com/gustawho/appmenu-qt5.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${_pkgname}
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}"/${_pkgname}
  mkdir -p build
}

build() {
  cd "${srcdir}"/${_pkgname}/build
  qmake ../appmenu-qt5.pro
  make
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/build/plugins/platformthemes/libappmenu-qt5.so" "${pkgdir}/usr/lib/qt/plugins/platformthemes/libappmenu-qt5.so"
  install -Dm755 "${srcdir}/${_pkgname}/appmenu-qt5.sh" "${pkgdir}/etc/profile.d/appmenu-qt5.sh"
  install -dm755 "${pkgdir}/usr/include/dbusmenu-qt5"
  cp "${srcdir}/${_pkgname}/"*.h "${pkgdir}/usr/include/dbusmenu-qt5"
}
