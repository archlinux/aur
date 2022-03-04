# Maintainer: msmol <mitch@smolash.com>
# Contributor: Stuart Mumford <stuart@cadair.com>
pkgname=krunner-pass-wl-clipboard-git
pkgver=1.3.0
pkgrel=1
pkgdesc="krunner-pass patched to use wl-clipboard"
arch=('any')
url="https://github.com/akermu/krunner-pass"
license=('GPL')
depends=('krunner' 'qt5-base' 'ki18n' 'wl-clipboard')
makedepends=('cmake' 'extra-cmake-modules')
provides=('krunner-pass')
source=("git://github.com/akermu/krunner-pass")
md5sums=('SKIP')

build() {
  sed -i 's/cb->setText(msg)/QProcess::execute("wl-copy " + msg)/g' krunner-pass/pass.cpp
  sed -i 's/cb->setText(QString())/QProcess::execute("wl-copy \" \"")/g' krunner-pass/pass.cpp
  sed -i 's/kcmutils_version.h/\/usr\/include\/KF5\/KCMUtils\/kcmutils_version.h/' krunner-pass/config.cpp
  mkdir -p build
  cd build
  cmake ../krunner-pass -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` -DQT_PLUGIN_INSTALL_DIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
}

