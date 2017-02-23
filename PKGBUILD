# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgbase=phonon-gstreamer
pkgname=('phonon-qt4-gstreamer' 'phonon-qt5-gstreamer')
pkgver=4.9.0
pkgrel=2
arch=('i686' 'x86_64')
url='http://phonon.kde.org/'
license=('LGPL')
optdepends=('pulseaudio: PulseAudio support' 'gst-plugins-good: PulseAudio support and good codecs' 'gst-plugins-bad: additional codecs'
	'gst-plugins-ugly: additional codecs' 'gst-libav: libav codec')
makedepends=('gst-plugins-base' 'extra-cmake-modules' 'automoc4' 'phonon-qt4' 'phonon-qt5' 'qt5-x11extras')
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/${pkgver}/phonon-backend-gstreamer-${pkgver}.tar.xz")
md5sums=('b2b0ca327908948ce8cdba117e31bf80')

prepare() {
  mkdir build-qt4
  mkdir build-qt5
}

build() {
  cd build-qt4
  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -D__KDE_HAVE_GCC_VISIBILITY=NO \
    -DCMAKE_INSTALL_LIBDIR=lib
  make

  cd ../build-qt5
  cmake ../${pkgbase}-${pkgver} \
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
  depends=(gst-plugins-base phonon-qt4)

  cd build-qt4
  make DESTDIR="${pkgdir}" install

# Conflict with -qt5
  rm -r "$pkgdir"/usr/share/icons
}

package_phonon-qt5-gstreamer() {
  pkgdesc="Phonon GStreamer backend for Qt5"
  depends=(gst-plugins-base qt5-x11extras phonon-qt5)

  cd build-qt5
  make DESTDIR="${pkgdir}" install
}
