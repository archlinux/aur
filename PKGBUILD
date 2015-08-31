#Maintainer: Leonard König <leonard dot r dot koenig at googlemail dot com>
pkgname=sayonara-player-svn
pkgver=r1092
pkgrel=3
pkgdesc="Sayonara is a small, clear and fast audio player for Linux written in C++, supported by the Qt framework. It uses Gstreamer as audio backend."
arch=('i686' 'x86_64')
url="https://sayonara-player.com/"
license=('GPL3')
depends=('qt5-base'
	 'gst-plugins-base'
	 'gst-plugins-good'
	 'libnotify'
	 'hicolor-icon-theme')
# taglib not needed as it is already covered by gst-plugins-good dependency
# hicolor theme for the icon structure
optdepends=('lame: mp3 converter, broadcasting'
            'gst-plugins-ugly: mp3 converter, broadcasting')
makedepends=('subversion' 'cmake' 'desktop-file-utils' 'xdg-utils')
# desktop-file-utils and xdg-utils needed for MIME and icon DB
conflicts=('sayonara-player')
install=sayonara-player-svn.install
source=($pkgname::svn+http://sayonara-player.com/svn/sayonara/trunk)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # Workaround the reset of the svn-version:
  # The package uses a workaround that adds 1042 to the revision number, as due to source-transfer
  # the revision counter got reset. So while the svn-revision is ~50, the actual version is much higher.
  local sver=$(svnversion)
  local ver=$(($sver + 1042))
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$pkgname"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE="Release"
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir/" install
}
