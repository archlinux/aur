# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.4
pkgrel=3
pkgdesc="Interactive SDR receiver waterfall for many devices."
arch=('i686' 'x86_64')
url="http://gqrx.dk/"
license=('GPL')
depends=('qt5-svg' 'libpulse' 'gnuradio-osmosdr' 'libxkbcommon-x11')
makedepends=('boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/csete/gqrx/archive/v$pkgver.tar.gz"
        "$pkgname.png"
        "$pkgname.desktop")
md5sums=('a9f14dfa153ddf2b370d98ee8f0e7c9d'
         'f7032a8883c89bd80e0d0fd36f861c59'
         '810f89195231c18f32af92522aade721')

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
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  cd "$srcdir/$pkgname-$pkgver/build"
  make install INSTALL_ROOT="$pkgdir"

  cd "$srcdir/$pkgname-$pkgver-alsa/build"
  install -Dm755 gqrx "$pkgdir/usr/bin/gqrx-alsa"
}

