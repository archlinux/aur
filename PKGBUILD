# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=BourgeoisLab
_pkgname=GPXLab
_branch=master
pkgname=${_pkgname,,}-git
pkgver=0.4.0.r17.6c69ea7
pkgrel=1
pkgdesc='Program to show and manipulate GPS tracks'
arch=('i686' 'x86_64')
url="https://bourgeoislab.wordpress.com/gpxlab/"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
source=("${_pkgname}-${_branch}::git://github.com/${_orgname}/${_pkgname}.git#branch=${_branch}"
        "gpxlab.desktop"
        "gpxlab.xml")
sha256sums=('SKIP'
            'df674c3baa689b5441c81447fa999f418029c1edc5ac1933cdb26202049d2b58'
            '5e35029c0cf26cbe82c3fbe1f839688f99406c2e054b1311e7912d0468df7c38')

pkgver() {
  cd ${_pkgname}-${_branch}

  RELEASE="$(git describe --tags $(git rev-list --tags --max-count=1))"
  REVISION="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "%s.r%s" "${RELEASE#?}" "${REVISION}"
}

build() {
  cd ${_pkgname}-${_branch}

  qmake GPXLab.pro
  make
}

package() {
  cd ${_pkgname}-${_branch}

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share/applications
  install -d 755 ${pkgdir}/usr/share/pixmaps
  install -d 755 ${pkgdir}/usr/share/mime/packages

  install -m 755 bin/GPXLab ${pkgdir}/usr/bin/${pkgname//-git}
  install -m 644 doc/gpxlab.png ${pkgdir}/usr/share/pixmaps/${pkgname//-git}.png
  install -m 644 ../gpxlab.desktop ${pkgdir}/usr/share/applications/${pkgname//-git}.desktop
  install -m 644 ../gpxlab.xml ${pkgdir}/usr/share/mime/packages/${pkgname//-git}.xml
}
