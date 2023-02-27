# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Astor"
pkgname=${_name,,}
pkgver=7.5.2
_jarfile="${_name}-${pkgver}-jar-with-dependencies.jar"
pkgrel=1
pkgdesc="A graphical Tango control system administration tool"
arch=('any')
url="https://gitlab.com/tango-controls/${_name}"
license=('GPL3')
depends=('java-runtime=8' jdk8-openjdk sh)
makedepends=(maven)
source=(
  https://gitlab.com/tango-controls/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz
  launcher plugin.patch
)
sha256sums=(
  'd1d1e3a756da2dbc8f8a19878acb584079c4f1590f3538324638e27172179f5c'
  '25cc409561647519ad0bb2ffc00abb9cd923626f978f49c03b1f72b1fcd47d0b'
  '5dff2f81654c0f036af0db2deb28b8d2333af57c3122831ed23dbd643dc47b99'

)

prepare() {
  sed -i "s/jar_file/$_jarfile/" launcher
  patch --directory="$_name-$pkgver" --forward --strip=1 --input="${srcdir}/plugin.patch"
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
