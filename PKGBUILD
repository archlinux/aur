# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=edytornc-git
_pkgname=edytornc
pkgver=r186.db8b784
pkgrel=1
pkgdesc="Text editor for CNC programmers"
arch=('x86_64')
url='https://github.com/u-235/edytornc'
license=('LGPL-3.0')
provides=('edytornc')
depends=('qt5-base')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake PREFIX="/usr"
  make
}

package() {
  # make DESTDIR="${pkgdir}" install doesn't work, hence the manual install.
  install -Dm755 "${srcdir}/${_pkgname}"/bin/release/edytornc -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_pkgname}"/lang/*.qm -t "${pkgdir}/usr/share/edytornc/lang"
  install -Dm644 "${srcdir}/${_pkgname}"/install/linux/application-x-g-code.xml -t \
   "${pkgdir}/usr/share/mime"
  install -Dm644 "${srcdir}/${_pkgname}"/install/linux/edytornc.desktop -t \
   "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/${_pkgname}"/install/linux/images/hicolor/48x48/apps/edytornc.png -t \
   "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
  install -Dm644 "${srcdir}/${_pkgname}"/install/linux/images/hicolor/32x32/mimetypes/application-x-g-code.png -t \
   "${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes"
  install -Dm644 "${srcdir}/${_pkgname}"/examples/* -t \
   "${pkgdir}/usr/share/edytornc/examples"
  install -Dm644 "${srcdir}/${_pkgname}"/README.md -t \
   "${pkgdir}/usr/share/doc/edytornc"
}