# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=cassandra-cpp-driver
_pkgname=cpp-driver
pkgver=2.7.1
pkgrel=1
pkgdesc="DataStax C/C++ Driver for Apache Cassandra"
arch=(i686 x86_64)
url="http://datastax.github.io/cpp-driver/"
license=('Apache')
depends=('libuv' 'openssl-1.0')
makedepends=('libuv')
source=("https://codeload.github.com/datastax/${_pkgname}/tar.gz/${pkgver}")

build() {
	cd "$_pkgname-$pkgver"
	# Remove the -Werror from .cmake otherwise it does not compile anymore with gcc 7.x
	sed -i "s/-Werror//"  cmake/modules/CppDriver.cmake
	# Use openssl 1.0 because it does not compile against openssl 1.1.0 yet
	export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib -Wno-error .
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
sha256sums=('eb22b7b148507253d2ca24f419e6768d5f9525dbc6f60afcd40906df3ae7cf8d')
