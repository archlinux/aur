# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=openstreetmap
_pkgname=osmembrane
pkgname=${_pkgname}
pkgver=1.2.0
pkgrel=2
pkgdesc='OSMembrane is a frontend to the Osmosis data processing tool'
arch=(any)
url="http://osmembrane.de"
license=('GPL3')
depends=('java-runtime' 'osmosis')
optdepends=('josm')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('38d2414152a97b26fa60008d3190c42330af86b3ba221bbba12b373af2df2973')

prepare() {
  cd ${pkgname}-${pkgver}

  cd src/main/java/de/osmembrane/resources
  sed -i "s#\"resources/pdf/manual.pdf\"#\"/usr/share/${pkgname}/resources/pdf/manual.pdf\"#" Constants.java
  sed -i "s#\"osmosis\"#\"/usr/bin/osmosis\"#" Constants.java
  sed -i "s#\"josm\"#\"/usr/bin/josm\"#" Constants.java
}

build() {
  cd ${pkgname}-${pkgver}

  make
}

package() {
  cd ${pkgname}-${pkgver}

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share
  install -d 755 ${pkgdir}/usr/share/java
  install -d 755 ${pkgdir}/usr/share/java/${pkgname}
  install -d 755 ${pkgdir}/usr/share/${pkgname}
  install -d 755 ${pkgdir}/usr/share/${pkgname}/resources
  install -d 755 ${pkgdir}/usr/share/${pkgname}/resources/pdf

  install -m 755 ../../${pkgname} ${pkgdir}/usr/bin
  install -m 644 build/libs/OSMembrane.jar ${pkgdir}/usr/share/java/${pkgname}
  install -m 644 manual/manual.pdf ${pkgdir}/usr/share/${pkgname}/resources/pdf
}
