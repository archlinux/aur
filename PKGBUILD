# Maintainer: David Runge <dave@sleepmap.de>
pkgname=ssr
pkgver=0.4.2
pkgrel=7
pkgdesc="A tool for real-time spatial audio reproduction providing a variety of rendering algorithms, e.g. Wave Field Synthesis, Higher-Order Ambisonics and binaural techniques."
arch=('x86_64')
url="http://spatialaudio.net/ssr/"
conflicts=('ssr-git')
provides=('ssr')
license=('GPL3')
depends=('boost-libs' 'ecasound' 'fftw' 'glu' 'jack' 'libsndfile' 'libxml2' 'qt4')
makedepends=('boost' 'help2man')
source=("https://github.com/SoundScapeRenderer/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9e0364a499b5bd3526ff29575cbc2c0cf5b62d7915a0bd6c9df0c9cb54fa042c1052a2438dd8f2d903e61016ac8f0f6f0393aea01075574052b879f72b47d129')

prepare() {
  cd "${pkgname}-${pkgver}/"
  # adding moc-qt4 PATH before default moc PATH
  export PATH=/usr/lib/qt4/bin:$PATH
  autoreconf -vfi
  # fixing boost_system link test
  sed -e 's/get_system_category/system_category/' -i configure
}

build() {
  cd "${pkgname}-${pkgver}/"
  export QT_SELECT=4
  ./configure --prefix=/usr --disable-vrpn
  make
}

package() {
  cd "${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
}

