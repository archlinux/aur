# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Jive"
pkgname=${_name,,}
pkgver=7.41
_jarfile="${_name}-${pkgver}-jar-with-dependencies.jar"
pkgrel=1
pkgdesc="A standalone JAVA application designed to browse and edit the static TANGO database"
arch=("any")
url="https://gitlab.com/tango-controls/${_name}"
license=("GPL3")
depends=(jre17-openjdk sh)
makedepends=(jre17-openjdk maven)
source=(
  https://gitlab.com/tango-controls/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
  launcher
  jive.desktop
)
sha256sums=(
  "c25907e0887ba3ca96084d049ae797e184a638d2c57a6bda43e093782e4f8603"
  "49f16c646996c55fa65f66b8eb8c948950834a93e9a75c71c9fd1b110d401eee"
  "1b0d8707be20236241e2d84575227f809c93d239783f14b626c896480927d500"
)

prepare() {
  sed -i "s/jar_file/$_jarfile/" launcher
  sed -i "s/package_name/$pkgname/" launcher
  sed -i 's/\[5\.10, 6\.0)/[6.0, )/g' ${pkgname}-${pkgver}/pom.xml
}

build() {
  cd ${pkgname}-${pkgver}
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  mvn clean package
}

package() {
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/target/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  install -D -m755 ${srcdir}/jive.desktop ${pkgdir}/usr/share/applications/jive.desktop
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/src/main/resources/jive/jive.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/jive.png
}
