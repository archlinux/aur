# Maintainer: ComixHe <heyuming@deepin.org>
pkgname=dtk6systemsettings-git
pkgver=6.0.2.r0.g9aeeb77
pkgrel=1
sourcename=dtk6systemsettings
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='Qt-based development library for system settings on Deepin.'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtk6systemsettings"
license=('LGPL3')
depends=('deepin-desktop-base' 'dtk6core' 'dtkcommon')
makedepends=('git' 'qt6-tools' 'qt6-base' 'ninja' 'cmake' 'doxygen' 'graphviz')
conflicts=('dtk6systemsettings')
provides=('dtk6systemsettings')
groups=('deepin-git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd $sourcedir
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $sourcedir
  version=$(git describe --long --tags | awk -F'[+_~-]' '{print $1}')
  cmake \
    -GNinja \
    -DMKSPECS_INSTALL_DIR=lib/qt/mkspecs/modules \
    -DBUILD_DOCS=ON \
    -DBUILD_EXAMPLES=OFF \
    -DQCH_INSTALL_DESTINATION=share/doc/qt \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DDTK_VERSION=$version
  ninja
}

package() {
  cd $sourcedir
  DESTDIR="$pkgdir" ninja install
}
