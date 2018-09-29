# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='buck'
pkgver='2018.09.24.01'
pkgrel=1
pkgdesc='A fast build system that encourages the creation of small, reusable modules over a variety of platforms and languages.'
arch=('any')
depends=('python2')
makedepends=('java-environment=8' 'apache-ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url='https://buckbuild.com'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a946028f6f68673b8804598a76e6971fa69598f684b9c6b74666f3d8d6560034')

build() {
  cd ${pkgname}-${pkgver}
  ant
  ./bin/buck build buck
}

prepare() {
  _java_version=$(archlinux-java get|cut -d- -f2)
  if [[ ${_java_version} != 8 ]]; then
    msg "activate java 8 before building"
    exit 1
  fi
  sed -i 's+executable="python"+executable="python2"+g' ${pkgname}-${pkgver}/build.xml
}

package() {
  cd ${pkgname}-${pkgver}
  BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
  install -Dm 755 "${BINPATH}" "${pkgdir}"/usr/bin/buck
}
