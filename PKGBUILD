# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Astor"
pkgname=${_name,,}
pkgver=7.5.5
_jarfile="${_name}-${pkgver}-jar-with-dependencies.jar"
pkgrel=2
pkgdesc="A graphical Tango control system administration tool"
arch=("any")
url="https://gitlab.com/tango-controls/${_name}"
license=("GPL-3.0-or-later")
depends=(java-runtime=17 sh hicolor-icon-theme)
makedepends=(maven jre17-openjdk)
source=(
  https://gitlab.com/tango-controls/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz
  launcher pom.patch astor.desktop
)
sha256sums=(
  "cef55954f7657d6a6f28a191a5956205c99e3e25067a0b1f89abacdd2d71720a"
  "49f16c646996c55fa65f66b8eb8c948950834a93e9a75c71c9fd1b110d401eee"
  "575e7060925b22234cea03b5327f4410d26b5886f4f9cb7ae04f0e6ae0eee834"
  "af5373fa86149fe10becc1effe6f82df250f8d48b71135412319c8701b304bb3"
)

prepare() {
  sed -i "s/jar_file/${_jarfile}/" launcher
  sed -i "s/package_name/${pkgname}/" launcher
  patch --directory="${_name}-${pkgver}" --forward --strip=1 --input="${srcdir}/pom.patch"
}

build() {
  cd ${_name}-${pkgver}
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  mvn clean package
}

package() {
  cd ${srcdir}
  install -D -m755 ${srcdir}/${_name}-${pkgver}/target/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
  install -D -m755 ${srcdir}/astor.desktop ${pkgdir}/usr/share/applications/astor.desktop
  install -D -m755 ${srcdir}/${_name}-${pkgver}/src/main/resources/admin/astor/images/astor.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/astor.png
}
