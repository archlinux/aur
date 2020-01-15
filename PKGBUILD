# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=buck
pkgver=2019.10.17.01
pkgrel=2
pkgdesc='A fast build system that encourages the creation of small, \
	   reusable modules over a variety of platforms and languages.'
arch=('any')
depends=('python2')
makedepends=('java-environment=8' 'apache-ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url='https://buckbuild.com'
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0861bf47dc1439bfe0f29f9f74161848ddedb7013ec3996afe7c9ff79fbb53ec7916944f1a09bcb6c5874b46fbf80ca7743db54368fc7cc7274ed74d1c056e1a')

prepare() {
  sed -i 's+executable="python"+executable="python2"+g' ${pkgname}-${pkgver}/build.xml
}

build() {
  cd "${pkgname}-${pkgver}"
  ant
  ./bin/buck build buck
}

package() {
  cd "${pkgname}-${pkgver}"
  BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
  install -Dm 755 "${BINPATH}" "${pkgdir}"/usr/bin/buck
}
