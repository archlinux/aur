# AUR Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Community Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai militaru at xmpp dot ro>
# Contributor: carstene1ns <arch carsten-teibes.de>

pkgname=aur-mbedtls
opkgnm=mbedtls
pkgver=3.2.1
pkgrel=1
pkgdesc="Portable cryptographic and SSL/TLS library, aka polarssl"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://tls.mbed.org"
license=('Apache')
depends=('glibc' 'sh')
checkdepends=('python')
makedepends=('cmake')
provides=('polarssl' 'mbedtls' 'libmbedcrypto.so' 'libmbedtls.so' 'libmbedx509.so')
replaces=('polarssl' 'mbedtls')
conflicts=('polarssl' 'mbedtls')
options=('staticlibs')
source=(https://github.com/ARMmbed/mbedtls/archive/${opkgnm}-${pkgver}.tar.gz)
sha256sums=('5850089672560eeaca03dc36678ee8573bb48ef6e38c94f5ce349af60c16da33')
b2sums=('4f33172c9c7a3ffbad6600c41d9b574a79e512ec417c3ec90a04085cce393456e8502e94150094bc80a217c352c8148d67bdab1bf0cb311c8dc88d653475a003')

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

