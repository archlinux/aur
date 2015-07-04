# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgbase=phonon-gstreamer
pkgname=('phonon-qt4-gstreamer' 'phonon-qt5-gstreamer')
pkgver=4.8.2
pkgrel=1
arch=('i686' 'x86_64')
url='http://phonon.kde.org/'
license=('LGPL')
makedepends=('gst-plugins-base' 'cmake' 'automoc4' 'phonon-qt4' 'phonon-qt5')
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/${pkgver}/src/phonon-backend-gstreamer-${pkgver}.tar.xz")
md5sums=('ce441035dc5a00ffaac9a64518ab5c62')

prepare() {
  mkdir build-qt4
  mkdir build-qt5
}

build() {
  cd build-qt4
  cmake ../phonon-backend-gstreamer-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -D__KDE_HAVE_GCC_VISIBILITY=NO \
    -DCMAKE_INSTALL_LIBDIR=lib
  make

  cd ../build-qt5
  cmake ../phonon-backend-gstreamer-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -D__KDE_HAVE_GCC_VISIBILITY=NO \
    -DPHONON_BUILD_PHONON4QT5=ON
  make
}

package_phonon-qt4-gstreamer() {
  pkgdesc="Phonon GStreamer backend for Qt4"
  depends=('gst-plugins-base')
  optdepends=('pulseaudio: PulseAudio support' 'gst-plugins-good: PulseAudio support')
  provides=('phonon-backend' 'phonon-qt4-backend')
  replaces=('phonon-gstreamer')
  conflicts=('phonon-gstreamer')
  install="phonon-qt4-gstreamer.install"

  cd build-qt4
  make DESTDIR="${pkgdir}" install
}

package_phonon-qt5-gstreamer() {
  pkgdesc="Phonon GStreamer backend for Qt5"
  depends=('gst-plugins-base')
  optdepends=('pulseaudio: PulseAudio support' 'gst-plugins-good: PulseAudio support')
  provides=('phonon-qt5-backend')
  replaces=('phonon-gstreamer')
  conflicts=('phonon-gstreamer')

  cd build-qt5
  make DESTDIR="${pkgdir}" install

  # Those are not needed
  rm -rf "${pkgdir}"/usr/share
}
