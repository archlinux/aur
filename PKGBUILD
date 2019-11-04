# Maintainer: Victor Tran <vicr12345 at gmail dot com>
# Contributor: Dan Printzell <arch@vild.io>

pkgname=("discord-rpc-api" "discord-rpc-api-static")
pkgver=3.4.0
pkgrel=0
pkgdesc="Libraries for Discord Rich Presence"
arch=("x86_64")
url="https://github.com/discordapp/discord-rpc"
license=('MIT')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz"::'https://github.com/discordapp/discord-rpc/archive/v3.4.0.tar.gz')
md5sums=('dac53f5ff7e1c9e34a86cc3f5aafc487')
sha256sums=('e13427019027acd187352dacba6c65953af66fdf3c35fcf38fc40b454a9d7855')

build() {
	export CC=gcc
	export CXX=g++
	cd "$srcdir"/discord-rpc-$pkgver

	mkdir -p build-shared
	pushd build-shared
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_EXAMPLES=OFF
	cmake --build . --config Release
	popd

	mkdir -p build-static
	pushd build-static
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_EXAMPLES=OFF
	cmake --build . --config Release
	popd
}

package_discord-rpc-api() {
	pushd "$srcdir"/discord-rpc-$pkgver/build-shared
	cmake --build . --config Release --target install -- DESTDIR=$pkgdir
	popd
}

package_discord-rpc-api-static() {
	conflicts=("discord-rpc-api")
	provices=("discord-rpc-api-static")

	pushd "$srcdir"/discord-rpc-$pkgver/build-static
        cmake --build . --config Release --target install -- DESTDIR=$pkgdir
	popd
}
