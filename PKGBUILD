# $Id: PKGBUILD 150009 2015-12-07 15:59:52Z bpiotrowski $
# Maintainer : speps <speps at aur dot archlinux dot org>

pkgbase=lib32-qtcurve
pkgname=('lib32-qtcurve-utils' 'lib32-qtcurve-gtk2' 'lib32-qtcurve-qt4')
pkgver=1.8.18
pkgrel=2
pkgdesc='A configurable set of widget styles for KDE and Gtk'
arch=('i686' 'x86_64')
url='https://github.com/QtCurve/qtcurve'
license=('LGPL')
groups=('qtcurve')
makedepends=('cmake' 'gcc-multilib' 'automoc4' 'lib32-gtk2' 'lib32-qt4')
source=("qtcurve-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz" qconfig.h)
md5sums=('422d1876d944bb278855f320eda19368'
         '6b89fb32651dd73d1c02185d23b86186')

prepare() {
  cd qtcurve-$pkgver
  [ -d b ] || mkdir b

  # export multilib parameters
  # and QT_BUILD_KEY workaround
  export CC="gcc -m32 -I$srcdir"
  export CXX="g++ -m32 -I$srcdir"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  [ -d QtCore ] || mkdir QtCore
  ln -s ../${source[1]} QtCore
}

build() {
  cd qtcurve-$pkgver/b
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DQT_PLUGINS_DIR=/usr/lib32/qt/plugins \
           -DQT_LIBRARY_DIR=/usr/lib32 \
           -DLIB_INSTALL_DIR=/usr/lib32 \
           -DQTC_QT4_ENABLE_KDE=false \
           -DENABLE_QT5=false
  make
}

package_lib32-qtcurve-utils() {
  depends=('lib32-libx11')
  cd qtcurve-$pkgver/b/lib/utils
  make DESTDIR="$pkgdir" install
}

package_lib32-qtcurve-gtk2() {
  depends=('lib32-qtcurve-utils' 'lib32-gtk2' 'qtcurve-gtk2')
  cd qtcurve-$pkgver/b/gtk2
  make DESTDIR="$pkgdir" install
  cd ../lib/cairo
  make DESTDIR="$pkgdir" install

  # strip themes
  rm -rf "$pkgdir/usr/share"
}

package_lib32-qtcurve-qt4() {
  depends=('lib32-qtcurve-utils' 'lib32-qt4')
  cd qtcurve-$pkgver/b/qt4
  make DESTDIR="$pkgdir" install
}
