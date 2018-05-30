# Maintainer: Kris McCleary <kris27mc@gmail.com>
# Contributor: Mark Vainomaa <mikroskeem.at.mikroskeem.dot.eu>

pkgname=mcpelauncher-linux
pkgver=1.4
pkgrel=1
pkgdesc="A launcher for Minecraft: Pocket Edition on Linux."
arch=("x86_64")
url="https://github.com/MCMrARM/mcpelauncher-linux"
license=("GPL")
depends=(
    "lib32-alsa-lib"
    "lib32-alsa-plugins"
    "lib32-gcc-libs"
    "lib32-gconf"
    "lib32-glibc"
    "lib32-gtk2"
    "lib32-libevdev"
    "lib32-libpng"
    "lib32-libprotobuf"
    "lib32-libstdc++5"
    "lib32-libudev0"
    "lib32-libx11"
    "lib32-libxss"
    "lib32-libxtst"
    "lib32-libzip"
    "lib32-mesa"
    "lib32-nss"
    "lib32-openssl"
    "lib32-util-linux"
    "lib32-zlib"
    "libzip"
    "protobuf"
)
makedepends=(
    "git"
    "cmake"
    "gcc-multilib"
    "wget"
)
source=(
	"git+https://github.com/MCMrARM/mcpelauncher-linux.git"
	"binarylaunch.sh"
)
md5sums=(
	'SKIP'
	'cfcbf03fa0bd3ced0f832e14bb187c59'
)

prepare() {
	cd "$pkgname"
	git submodule init && git submodule update
	./setup_cef.sh
	./download_icon.sh
	./setup_bin_libs.sh
	mkdir build
}

build() {
	cd "$pkgname/build"
	cmake ..
	make -j$(nproc --all)
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir" install
	cd "$srcdir"
	install -m755 binarylaunch.sh "$pkgdir/usr/local/bin/mcpelauncher"
}
