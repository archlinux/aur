# Maintainer: justforlxz <justforlxz@gmail.com>
pkgname=deepin-qt6platform-plugins-git
pkgver=6.0.41.r1.gfe42fd3
pkgrel=1
sourcename=dde-qt6platform-plugins
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="qt6platform-plugins"
pkgdesc='Qt platform plugins for DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/qt6platform-plugins"
license=('GPL3')
depends=('cairo' 'qt6-base')
makedepends=('git' 'expac' 'libglvnd' 'ninja' 'cmake' 'libxcb' 'libxi' 'gtest' 'gmock' 'qt6-xcb-private-headers')
groups=('deepin-git')
source=("git+${url}")
sha512sums=('SKIP')
conflicts=('deepin-qt6platform-plugins')
provides=('deepin-qt6platform-plugins')

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
                -DQT_XCB_PRIVATE_HEADERS=/usr/include/qt6xcb-private \
                -DDTK_VERSION=$version
	ninja
}

package() {
	cd $sourcedir
	DESTDIR="$pkgdir" ninja install
}
