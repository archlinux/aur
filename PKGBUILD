# Maintainer: justforlxz <justforlxz@gmail.com>
pkgname=deepin-qt6integration-git
pkgver=6.0.4.r0.g9e98822
pkgrel=1
sourcename=qt6integration
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='Qt platform theme integration plugins for DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/qt6integration"
license=('GPL3')
depends=('dtk6widget' 'deepin-qt6platform-plugins' 'gcc-libs')
makedepends=('git' 'qt6-tools' 'xcb-util-renderutil' 'gtest' 'gmock' 'cmake' 'ninja' 'gcc' 'pkg-config')
conflicts=('deepin-qt6integration')
provides=('deepin-qt6integration')
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
  cmake . -GNinja \
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
