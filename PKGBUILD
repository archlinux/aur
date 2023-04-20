# AUR Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Community Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai militaru at xmpp dot ro>
# Contributor: carstene1ns <arch carsten-teibes.de>

pkgname=aur-mbedtls
opkgnm=mbedtls
pkgver=3.4.0
pkgrel=1
pkgdesc="Portable cryptographic and SSL/TLS library, aka polarssl"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://tls.mbed.org"
license=('Apache')
depends=('glibc' 'sh')
checkdepends=('python')
makedepends=('cmake' 'python-jsonschema' 'python-jinja')
provides=('polarssl' 'mbedtls' 'libmbedcrypto.so' 'libmbedtls.so' 'libmbedx509.so')
replaces=('polarssl' 'mbedtls')
conflicts=('polarssl' 'mbedtls')
options=('staticlibs')
source=(https://github.com/Mbed-TLS/mbedtls/archive/refs/tags/${opkgnm}-${pkgver}.tar.gz)
sha256sums=('a5dac98592b1ac2232de0aed8f4ee62dffaa99e843e6f41dca2958095c737afd')
b2sums=('2b2c4a3a0089867e3606462d3517c4e9cb71aaea2bd431fa0468552a25e22e637ddc83615983d25963bd433212cfa77a19d45d790bf7a975483be191002a4c3f')

prepare() {
	cd "$opkgnm-$opkgnm-$pkgver"
	# enable flags for non-embedded systems
	sed -i 's|//\(#define MBEDTLS_THREADING_C\)|\1|' include/mbedtls/mbedtls_config.h
	sed -i 's|//\(#define MBEDTLS_THREADING_PTHREAD\)|\1|' include/mbedtls/mbedtls_config.h
}

build() {
	cd "$opkgnm-$opkgnm-$pkgver"
	cmake \
		-B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_C_FLAGS="${CFLAGS} -ffat-lto-objects" \
		-DMBEDTLS_FATAL_WARNINGS=OFF \
		-DCMAKE_VERBOSE_MAKEFILE=ON \
		-DUSE_SHARED_MBEDTLS_LIBRARY=ON \
		-DCMAKE_INSTALL_RPATH=
	make -C build
}

check() {
	cd "$opkgnm-$opkgnm-$pkgver"
	make -C build test
	# make check?
}

package() {
	cd "$opkgnm-$opkgnm-$pkgver"
	make -C build DESTDIR="$pkgdir" install

	# rename generic utils
	local _prog _baseprog
	for _prog in "$pkgdir"/usr/bin/*; do
		_baseprog=$(basename "$_prog")
		mv -v "$_prog" "${_prog//$_baseprog/mbedtls_$_baseprog}"
	done

	# fixup static lib permissions
	chmod 644 "$pkgdir"/usr/lib/*.a
}

