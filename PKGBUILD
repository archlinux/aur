# Contributor: Raffaele Zamorano
# Contributor: Jose Riha <jose1711 gmail com>
# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=tumic0
_pkgname=gpxsee
_branch=master
pkgname=${_pkgname}-git
pkgver=5.6.r905.f64e882
pkgrel=1
pkgdesc='GPX viewer and analyzer'
arch=('i686' 'x86_64')
url="http://www.gpxsee.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
optdepends=('qt5-imageformats: Support for TIFF')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
source=("${_pkgname}-${_branch}::git+http://github.com/${_orgname}/${_pkgname}.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}-${_branch}

  RELEASE="$(git describe --tags $(git rev-list --tags --max-count=1))"
  REVISION="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "%s.r%s" "${RELEASE}" "${REVISION}"
}

build() {
  cd ${_pkgname}-${_branch}

  lrelease-qt5 gpxsee.pro
  qmake gpxsee.pro
  make
}

package() {
  cd ${_pkgname}-${_branch}

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share/applications
  install -d 755 ${pkgdir}/usr/share/pixmaps
  install -d 755 ${pkgdir}/usr/share/mime/packages
  install -d 755 ${pkgdir}/usr/share/${_pkgname}
  install -d 755 ${pkgdir}/usr/share/${_pkgname}/maps
  install -d 755 ${pkgdir}/usr/share/${_pkgname}/csv
  install -d 755 ${pkgdir}/usr/share/${_pkgname}/translations

  install -m 755 GPXSee ${pkgdir}/usr/bin/${_pkgname}
  install -m 644 pkg/maps/* ${pkgdir}/usr/share/${_pkgname}/maps
  install -m 644 pkg/csv/* ${pkgdir}/usr/share/${_pkgname}/csv
  install -m 644 lang/*.qm ${pkgdir}/usr/share/${_pkgname}/translations
  install -m 644 icons/gpxsee.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  install -m 644 pkg/gpxsee.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -m 644 pkg/gpxsee.xml ${pkgdir}/usr/share/mime/packages/${_pkgname}.xml
}
