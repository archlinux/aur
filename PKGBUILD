# Maintainer: Daniel Massey <masseyd1396@gmail.com>

pkgname=mcpelauncher-thesonicmaster
pkgver=20210323
pkgrel=1
pkgdesc="Minecraft Bedrock Edition Linux launcher with license error fixed."
arch=("i686" "x86_64")
url="https://www.thesonicmaster.net/software/mcpelauncher-thesonicmaster"
license=("custom")
depends=("curl" "libegl" "libevdev" "libpng" "libx11" "libxi" "libzip" "openssl" "protobuf" "qt5-base" "qt5-declarative" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-svg" "qt5-tools" "qt5-webengine" "zlib")
makedepends=("clang" "cmake" "ninja")
conflicts=("mcpelauncher-msa-git" "mcpelauncher-msa-ui-qt-git" "mcpelauncher-linux-git" "mcpelauncher-ui-git")
source=("https://www.thesonicmaster.net/software/mcpelauncher-thesonicmaster/source/$pkgname-$pkgver.tar.xz")
sha256sums=("a34a621ccd0095118192257643b4d02c244dfc943b9eb08133ff77101193de39")

build() {
	cd $pkgname-$pkgver/msa-manifest
	mkdir -p build && cd build
	CC=clang CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_MSA_QT_UI=ON -Wno-dev -G Ninja ..
	ninja
	cd ../../mcpelauncher-manifest
	mkdir -p build && cd build
	CC=clang CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -Wno-dev -G Ninja ..
	ninja
	cd ../../mcpelauncher-ui-manifest
	mkdir -p build && cd build
	CC=clang CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -Wno-dev -G Ninja ..
	ninja
}

package() {
	cd $pkgname-$pkgver/msa-manifest/build
	DESTDIR=$pkgdir ninja install
	cd ../../mcpelauncher-manifest/build
	DESTDIR=$pkgdir ninja install
	cd ../../mcpelauncher-ui-manifest/build
	DESTDIR=$pkgdir ninja install
}
