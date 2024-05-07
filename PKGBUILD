# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Pogo"
pkgname=tango-${_name,,}
pkgver=9.9.0
_jarfile="${_name}-${pkgver}.jar"
pkgrel=1
pkgdesc="The TANGO code generator. It allows to define a TANGO class model"
arch=('any')
url="https://gitlab.com/tango-controls/${_name}"
license=('GPL-3.0-or-later')
depends=('java-runtime=17' sh)
makedepends=('java-environment=17' maven)
source=(
  https://gitlab.com/tango-controls/${_name,,}/-/archive/${pkgver}/${_name,,}-${pkgver}.tar.gz
  launcher
)
sha256sums=(
  'dad9ec461d97737588fb0e9eebc91ac953bdf308d55de0b6b4dada208dd4456d'
  'ac00d9dd4e3ed83af078296585b3201f03b0c0a2c0b23fe1705ce3abe648a713'
)

prepare() {
  sed -i "s/jar_file/$_jarfile/" launcher
  sed -i "s/package_name/$pkgname/" launcher
  sed -i "s/9.8.5-SNAPSHOT/$pkgver/" ${_name,,}-${pkgver}/pom.xml
  sed -i "s/9.8.5-SNAPSHOT/$pkgver/" ${_name,,}-${pkgver}/org.tango.pogo/pom.xml
  sed -i "s/9.8.5-SNAPSHOT/$pkgver/" ${_name,,}-${pkgver}/org.tango.pogo.gui/pom.xml
}

build() {
  cd ${_name,,}-${pkgver}
  mvn package
}

package() {
  install -D -m755 ${srcdir}/${_name,,}-${pkgver}/org.tango.pogo.gui/target/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
}
