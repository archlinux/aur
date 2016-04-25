# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.5.3
pkgrel=3
pkgdesc="Interactive SDR receiver waterfall for many devices."
arch=('i686' 'x86_64')
url="http://gqrx.dk/"
license=('GPL')
depends=('qt5-svg' 'libpulse' 'gnuradio-osmosdr' 'libxkbcommon-x11')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/csete/gqrx/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('b78a0a2b2fcf610f12b5c260624465b5'
         '91bc8634f843a1ef05c9c56251d8a3f0')

prepare() {
  cd "$srcdir"
  cp -r gqrx-$pkgver gqrx-$pkgver-alsa
  cd gqrx-$pkgver-alsa
  sed -i 's/AUDIO_BACKEND = pulse/#&/' gqrx.pro
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf build
  mkdir build
  cd build
  qmake PREFIX=/usr/ ..
  make
  cd "$srcdir/$pkgname-$pkgver-alsa"
  rm -rf build
  mkdir build
  cd build
  qmake PREFIX=/usr/ ..
  make
}

package() {
  cd "$srcdir"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "resources/icons/gqrx.svg" "$pkgdir/usr/share/pixmaps/gqrx.svg"

  cd "$srcdir/$pkgname-$pkgver/build"
  make install INSTALL_ROOT="$pkgdir"

  cd "$srcdir/$pkgname-$pkgver-alsa/build"
  install -Dm755 gqrx "$pkgdir/usr/bin/gqrx-alsa"
}

