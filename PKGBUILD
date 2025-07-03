# Maintainer: 9M2PJU <9m2pju@hamradio.my>

pkgname=qtel-svxlink-git
_pkgname=svxlink
pkgver=25.05.1.9.r928cd878
pkgrel=1
pkgdesc="Qtel (EchoLink client) built from the latest official SvxLink Git repository"
arch=('i686' 'x86_64')
url="https://github.com/sm0svx/svxlink"
license=('GPL')
depends=('qt5-base' 'alsa-lib' 'libsigc++' 'libsamplerate' 'gsm' 'libx11')
makedepends=('cmake' 'git' 'make' 'gcc')
provides=('qtel')
install=qtel-svxlink-git.install
conflicts=('qtel' 'qtel-svxlink' 'qtel-git' 'svxlink')
source=("git+https://github.com/sm0svx/svxlink.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/^v//' | tr '-' '.' | sed 's/\.g/\.r/'
}

build() {
  cd "$srcdir/$_pkgname/src"
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
  cd "$srcdir/$_pkgname/src/build"
  make DESTDIR="$pkgdir" install

  # Strip non-Qtel files
  rm -f "$pkgdir/usr/bin/"{svxlink,remotetrx,siglevdetcal,svxreflector,devcal}
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir"/usr/lib*/libasynccpp.so*
  rm -rf "$pkgdir"/usr/lib*/svxlink
  rm -rf "$pkgdir/usr/share/"{doc,man,svxlink}
  rm -rf "$pkgdir/var"
  rm -rf "$pkgdir/etc"
}
