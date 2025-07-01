# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=qtel-svxlink
pkgver=25.05.1
pkgrel=1
pkgdesc="Qtel: a Qt-based EchoLink client for Linux, from the official SvxLink project"
arch=('x86_64')
url="https://github.com/sm0svx/svxlink"
license=('GPL')
depends=('qt5-base' 'alsa-lib' 'libsigc++' 'libsamplerate' 'gsm' 'libx11')
makedepends=('cmake' 'make' 'gcc')
conflicts=('qtel' 'qtel-git' 'svxlink')
provides=('qtel')
source=("https://github.com/sm0svx/svxlink/archive/refs/tags/${pkgver}.zip")
sha256sums=('SKIP')

build() {
  cd "$srcdir/svxlink-${pkgver}/src"
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSBIN_INSTALL_DIR=/usr/bin \
    -DUSE_QT=YES \
    -DWITH_QTEL=YES
  make
}

package() {
  cd "$srcdir/svxlink-${pkgver}/src/build"
  make DESTDIR="$pkgdir" install

  # Remove everything except Qtel binary
  rm -f "$pkgdir/usr/bin/"{svxlink,remotetrx,siglevdetcal,svxreflector,devcal}
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir"/usr/lib*/libasynccpp.so*
  rm -rf "$pkgdir"/usr/lib*/svxlink
  rm -rf "$pkgdir/usr/share/"{doc,man,svxlink}
  rm -rf "$pkgdir/var"
  rm -rf "$pkgdir/etc"
}
