# Maintainer: justforlxz <justforlxz@gmail.com>
pkgname=deepin-qt5integration-git
pkgver=5.6.20.r2.gb020f02
pkgrel=1
sourcename=qt5integration
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='Qt platform theme integration plugins for DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/qt5integration"
license=('GPL3')
depends=('dtkwidget' 'deepin-qt5platform-plugins' 'gcc-libs')
makedepends=('git' 'qt5-tools' 'xcb-util-renderutil' 'gtest' 'gmock' 'cmake' 'ninja' 'gcc' 'pkg-config')
conflicts=('deepin-qt5integration')
provides=('deepin-qt5integration')
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
