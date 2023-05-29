# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Astor"
pkgname=${_name,,}
pkgver=7.5.3
_jarfile="${_name}-${pkgver}-jar-with-dependencies.jar"
pkgrel=2
pkgdesc="A graphical Tango control system administration tool"
arch=('any')
url="https://gitlab.com/tango-controls/${_name}"
license=('GPL3')
depends=('java-runtime=8' jdk8-openjdk sh)
makedepends=(maven)
source=(
  https://gitlab.com/tango-controls/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz
  launcher pom.patch
)
sha256sums=(
  'd575c5be3212a458ff06ce5a9bb8fefc1ef09d13531992a5f4f3827c4f89aff4'
  '25cc409561647519ad0bb2ffc00abb9cd923626f978f49c03b1f72b1fcd47d0b'
  'adceed8e9e90b87e2c9b90e29b9fb254b96746658d642d959facdb50f5531999'

)

prepare() {
  sed -i "s/jar_file/$_jarfile/" launcher
  patch --directory="$_name-$pkgver" --forward --strip=1 --input="${srcdir}/pom.patch"
}

build() {
  cd ${_name}-${pkgver}
  mvn package
}

package() {
  cd ${srcdir}
  install -D -m755 ${srcdir}/${_name}-${pkgver}/target/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
}
