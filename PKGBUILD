# Maintainer: Peter Gulutzan <pgulutzan at ocelot.ca>
# This file may be useful for creating an ocelotgui package for pacman on Arch Linux derivatives.
# Instructions: As tested with Manjaro-21 Live CD:
#               Get this file, PKGBUILD, from http://github.com/ocelot-inc/ocelotgui
#               Here is a way to get PKGBUILD only:
#                 mkdir ocelotgui
#                 cd ocelotgui
#                 wget https://raw.githubusercontent.com/ocelot-inc/ocelotgui/master/PKGBUILD
#               Here is a way to get PKGBUILD along with the rest of ocelotgui source:
#                 git clone https://github.com/ocelot-inc/ocelotgui
#                 cd ocelotgui
#               The file name should be PKGBUILD and the directory name should be ocelotgui.
#               sudo pacman -S base-devel libmariadbclient cmake
#               makepkg
#               sudo pacman -U ./ocelotgui-1.7.0-1-x86_64.pkg.tar.zst
#               Now ocelotgui is ready to run. It might be necessary to run it twice.
# For Qt 6:     Change depends=('qt5-base' ...) to depends=('qt6-base' ...)
#               Change -DQT_VERSION=5 to -DQT_VERSION=6
#               (Yes we could make two packages with the same PKGBUILD file,
#               ocelotgui-qt5 and ocelotgui-qt6, but that requires they both be present.)
#               (Probably we will make Qt6-base default when it is default in most Arch-based distros.)
# For MySQL:    Change depends=(... 'libmariadbclient') to depends=(... 'libmysqlclient')
#               (This is unnecessary since libmariadbclient has the same functionality,
#               but perhaps some people already have libmysqlclient installed.)
#               (We don't need libmariadbclient or equivalent when running unless we connect to a
#               MySQL or MariaDB server, but that would be normal since it is the most important purpose.)
#Re cleanup:    There is no cleanup after makepkg so this will save space after package is installed:
#               cd to directory containing PKGBUILD
#               rm -r -f ocelotgui (to remove what "git clone" produced)
#               rm -r -f build (to remove what "cmake" produced)
#               Otherwise if running makepkg a second time it may be necessary to say makepkg -f
#Re cmake:      This is an out-of-source build and produces a RelWithDebInfo executable with an -O2 flag.
#               For other options read CMakeLists.txt.
pkgname=ocelotgui
pkgver=1.7.0
pkgrel=1
pkgdesc="GUI client for MySQL or MariaDB or Tarantool DBMS"
arch=("i686" "x86_64")
url="http://ocelot.ca"
license=('GPL2')
depends=('qt5-base' 'libmariadbclient')
makedepends=('cmake' 'git')
optdepends=('tarantool: for connecting to Tarantool server')
source=("git+https://github.com/ocelot-inc/ocelotgui.git")
md5sums=('SKIP')
build() {
  cd $pkgname
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_RPATH=TRUE -DQT_VERSION=5
  cmake --build build
}
package() {
  cd $pkgname/build
  make DESTDIR="$pkgdir/" install
}
