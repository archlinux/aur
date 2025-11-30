# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Astor"
pkgname=${_name,,}
pkgver=7.6.2
_jarfile="${_name}-${pkgver}-jar-with-dependencies.jar"
pkgrel=1
pkgdesc="A graphical Tango control system administration tool"
arch=("any")
url="https://gitlab.com/tango-controls/${_name}"
license=("GPL-3.0-or-later")
depends=(java-runtime=17 sh hicolor-icon-theme)
makedepends=(maven jre17-openjdk)
source=(
  https://gitlab.com/tango-controls/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz
  launcher astor.desktop
)
sha256sums=(
  "20c946cd4203a913d5cd798ec449b8ec3fd666bf618bde1f14adb0d3f9818fb2"
  "49f16c646996c55fa65f66b8eb8c948950834a93e9a75c71c9fd1b110d401eee"
  "af5373fa86149fe10becc1effe6f82df250f8d48b71135412319c8701b304bb3"
)

prepare() {
  sed -i "s/jar_file/${_jarfile}/" launcher
  sed -i "s/package_name/${pkgname}/" launcher
}

build() {
  cd ${_name}-${pkgver}
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  mvn clean package --quiet
}

package() {
  cd ${srcdir}
  install -D -m755 ${srcdir}/${_name}-${pkgver}/target/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
  install -D -m755 ${srcdir}/astor.desktop ${pkgdir}/usr/share/applications/astor.desktop
  install -D -m755 ${srcdir}/${_name}-${pkgver}/src/main/resources/admin/astor/images/astor.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/astor.png
}
