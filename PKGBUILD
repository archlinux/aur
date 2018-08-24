# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=phonon-qt4
pkgver=4.10.1
pkgrel=1
pkgdesc="The multimedia framework for KDE4"
arch=(x86_64)
depends=(qt4 libpulse phonon-qt4-backend)
optdepends=('pulseaudio: PulseAudio support')
makedepends=(extra-cmake-modules libpulse qt4)
url='http://phonon.kde.org/'
license=(LGPL)
source=("http://download.kde.org/stable/${pkgname%-qt4}/$pkgver/${pkgname%-qt4}-$pkgver.tar.xz"{,.sig})
sha256sums=('e5a98df31aeffc22493afc8d6adbca5d6f0c27cc2eed73b3be05195321e08db7'
            'SKIP')
validpgpkeys=(CB9387521E1EE0127DA804843FDBB55084CC5D84) # Harald Sitter <sitter@kde.org>

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../${pkgname%-qt4}-$pkgver \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPHONON_INSTALL_QT_EXTENSIONS_INTO_SYSTEM_QT=ON \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install

  # Install headers into the Qt4 dir
  install -d "$pkgdir"/usr/include/qt4
  mv "$pkgdir"/usr/include/{phonon,KDE} "$pkgdir"/usr/include/qt4/

  sed -i 's#includedir=/usr/include#includedir=/usr/include/qt4#' \
    "$pkgdir/usr/lib/pkgconfig/phonon.pc"
}
