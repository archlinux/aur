# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.12.1
pkgrel=1
pkgdesc="Interactive SDR receiver waterfall for many devices."
arch=('x86_64')
url="http://gqrx.dk/"
license=('GPL')
depends=('qt5-svg' 'libpulse' 'gnuradio-osmosdr' 'libxkbcommon-x11')
makedepends=('boost')
source=("$pkgname-$pkgver.tgz::https://github.com/csete/gqrx/archive/v$pkgver.tar.gz")
#source=("https://github.com/csete/gqrx/releases/download/v$pkgver/gqrx-sdr-$pkgver-src.tar.xz")
md5sums=('a355b630c6999c250103d04ed13edd7b')

prepare() {
  cd "$srcdir/gqrx-$pkgver"
  echo "StartupNotify=false" >> gqrx.desktop

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
  sed -i 's|-lpthread|& -llog4cpp|' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "resources/icons/gqrx.svg" "$pkgdir/usr/share/pixmaps/gqrx.svg"

  cd "$srcdir/$pkgname-$pkgver/build"
  make install INSTALL_ROOT="$pkgdir"

  cd "$srcdir/$pkgname-$pkgver-alsa/build"
  install -Dm755 gqrx "$pkgdir/usr/bin/gqrx-alsa"
}

