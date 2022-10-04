# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.15.9
pkgrel=3
pkgdesc="Interactive SDR receiver waterfall for many devices."
arch=('x86_64')
url="http://gqrx.dk/"
license=('GPL')
depends=('qt6-svg' 'libpulse' 'gnuradio-osmosdr' 'libxkbcommon-x11')
makedepends=('boost' 'cmake' 'spdlog')
source=("$pkgname-$pkgver.tgz::https://github.com/gqrx-sdr/gqrx/archive/v$pkgver.tar.gz")
md5sums=('8c22b0e66b109ac7ea89de6537663298')

prepare() {
  cd "$srcdir/gqrx-$pkgver"
  echo "StartupNotify=false" >> gqrx.desktop

  cd "$srcdir"
  cp -r gqrx-$pkgver gqrx-$pkgver-alsa
  cd gqrx-$pkgver-alsa
  #sed -i 's/AUDIO_BACKEND = pulse/#&/' gqrx.pro
  sed -i 's/LINUX_AUDIO_BACKEND Pulseaudio/LINUX_AUDIO_BACKEND Gr-audio/' CMakeLists.txt
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf build
  mkdir build
  cd build
  #qmake PREFIX=/usr/ ..
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  sed -i 's|-lpthread|& -lhidapi-libusb|' Makefile
  make
  cp src/gqrx ./
  cd "$srcdir/$pkgname-$pkgver-alsa"
  rm -rf build
  mkdir build
  cd build
  #qmake PREFIX=/usr/ ..
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  sed -i 's|-lpthread|& -llog4cpp|' Makefile
  make
  cp src/gqrx ./
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "resources/icons/gqrx.svg" "$pkgdir/usr/share/pixmaps/gqrx.svg"

  cd "$srcdir/$pkgname-$pkgver/build"
  #make install INSTALL_ROOT="$pkgdir"
  #make DESTDIR="$pkgdir" install
  install -Dm755 gqrx "$pkgdir/usr/bin/gqrx"

  cd "$srcdir/$pkgname-$pkgver-alsa/build"
  install -Dm755 gqrx "$pkgdir/usr/bin/gqrx-alsa"
}

