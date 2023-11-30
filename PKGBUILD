# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Astor"
pkgname=${_name,,}
pkgver=7.5.5
_jarfile="${_name}-${pkgver}-jar-with-dependencies.jar"
pkgrel=1
pkgdesc="A graphical Tango control system administration tool"
arch=('any')
url="https://gitlab.com/tango-controls/${_name}"
license=('GPL3')
depends=('java-runtime=8' jdk8-openjdk sh)
makedepends=(maven jdk8-openjdk)
source=(
  https://gitlab.com/tango-controls/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz
  launcher pom.patch
)
sha256sums=(
  'cef55954f7657d6a6f28a191a5956205c99e3e25067a0b1f89abacdd2d71720a'
  '25cc409561647519ad0bb2ffc00abb9cd923626f978f49c03b1f72b1fcd47d0b'
  'c4edd3d51c0d2163fbb33a224c78384f794e20b4e4e6e429cf708e6a724805f2'
)

prepare() {
  sed -i "s/jar_file/$_jarfile/" launcher
  patch --directory="$_name-$pkgver" --forward --strip=1 --input="${srcdir}/pom.patch"
}

build() {
  cd ${_name}-${pkgver}
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk mvn package
}

package() {
  cd ${srcdir}
  install -D -m755 ${srcdir}/${_name}-${pkgver}/target/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
}
