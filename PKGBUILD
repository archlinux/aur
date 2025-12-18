# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Pogo"
pkgname=tango-${_name,,}
pkgver=9.10.6
_jarfile="${_name}-${pkgver}.jar"
pkgrel=1
pkgdesc="The TANGO code generator. It allows to define a TANGO class model"
arch=("any")
url="https://gitlab.com/tango-controls/${_name}"
license=("GPL-3.0-or-later")
depends=("java-runtime=17" sh)
makedepends=("java-environment=17" maven)
source=(
  https://gitlab.com/tango-controls/${_name,,}/-/archive/${pkgver}/${_name,,}-${pkgver}.tar.gz
  launcher
)
sha256sums=(
  "68a55e291b56eeb2c0338f20d670be29c76be097f98e4c0b611b26df942fce0d"
  "49f16c646996c55fa65f66b8eb8c948950834a93e9a75c71c9fd1b110d401eee"
)

prepare() {
  sed -i "s/jar_file/${_jarfile}/" launcher
  sed -i "s/package_name/${pkgname}/" launcher
  sed -i "s/9.10.6-SNAPSHOT/${pkgver}/" ${_name,,}-${pkgver}/pom.xml
  sed -i "s/9.10.6-SNAPSHOT/${pkgver}/" ${_name,,}-${pkgver}/org.tango.pogo/pom.xml
  sed -i "s/9.10.6-SNAPSHOT/${pkgver}/" ${_name,,}-${pkgver}/org.tango.pogo.gui/pom.xml
}

build() {
  cd ${_name,,}-${pkgver}
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  mvn clean package
}

package() {
  install -D -m755 ${srcdir}/${_name,,}-${pkgver}/org.tango.pogo.gui/target/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
}
