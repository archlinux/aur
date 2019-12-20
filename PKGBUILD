# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=openstreetmap
_pkgname=osmembrane
pkgname=${_pkgname}
pkgver=1.2.0
pkgrel=3
pkgdesc='OSMembrane is a frontend to the Osmosis data processing tool'
arch=(any)
url='https://github.com/openstreetmap/OSMembrane'
license=('GPL3')
depends=('java-runtime' 'osmosis')
optdepends=('josm')
makedepends=('gendesk')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('38d2414152a97b26fa60008d3190c42330af86b3ba221bbba12b373af2df2973')

prepare() {
  cd ${pkgname}-${pkgver}

  cat << EOF > ${pkgname}
#!/bin/sh
exec java -jar '/usr/share/java/${pkgname}/OSMembrane.jar' "\$@"
EOF

  gendesk -f -n --pkgname="$pkgname" --pkgdesc="$pkgdesc" --categories=Geoscience

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

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 build/libs/OSMembrane.jar ${pkgdir}/usr/share/java/${pkgname}/OSMembrane.jar
  install -Dm644 manual/manual.pdf ${pkgdir}/usr/share/${pkgname}/resources/pdf/manual.pdf
  install -Dm644 osmembrane.desktop ${pkgdir}/usr/share/applications/osmembrane.desktop
}
