# AUR Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Community Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai militaru at xmpp dot ro>
# Contributor: carstene1ns <arch carsten-teibes.de>

pkgname=aur-mbedtls
opkgnm=mbedtls
pkgver=3.3.0
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
source=(https://github.com/Mbed-TLS/mbedtls/archive/refs/${opkgnm}-${pkgver}.tar.gz)
sha256sums=('a22ff38512697b9cd8472faa2ea2d35e320657f6d268def3a64765548b81c3ec')
b2sums=('e85e141a78d06482324a966b29a9948ff7e4a83a1940cca1a99839925212d02df724b4843592700c34d675c8e9f49b4e57da7445e77fdcbc1362f76d28fd0d73')

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

