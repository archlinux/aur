# Maintainer: Jakub 'Eremiell' Marek <eremiell at eremiell dot net>
# See also https://github.com/eremiell-aur/dpp
pkgname=dpp
_pkgname=DPP
pkgver=10.0.24
pkgrel=1
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library"
arch=('x86_64')
url="https://dpp.dev/"
license=('Apache')
depends=('gcc-libs' 'openssl' 'zlib' 'opus' 'libsodium' 'nlohmann-json')
makedepends=('cmake' 'pkgconf')
install="${pkgname}.install"
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brainboxdotcc/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e5d561b864a7397caeb5616d388ebbd79a8f21077f3b13ac6ccd7e29c746daa9')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	rm -rf "include/dpp/nlohmann"
	#sed -i -E "s/(#pragma once)/\1\n#include <cstdint>/" "include/dpp/sslclient.h"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake -DDPP_BUILD_TEST=OFF -DRUN_LDCONFIG=OFF -DDPP_NO_VCPKG=ON -DDPP_CORO=ON -DDPP_USE_EXTERNAL_JSON=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MESSAGE=NEVER -Wno-dev ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}/" install
	ln -s "/usr/include/nlohmann" "${pkgdir}/usr/include/dpp/nlohmann"
}
