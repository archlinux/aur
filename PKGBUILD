# Maintainer: aspen <aspenuwu@protonmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgbase=ccache
pkgname=$_pkgbase-4
pkgver=4.1
pkgrel=1
pkgdesc='Compiler cache that speeds up recompilation by caching previous compilations - 4.x version'
url='https://ccache.samba.org/'
arch=('x86_64')
license=('GPL3')
depends=('glibc' 'zstd')
makedepends=('cmake')
provides=('ccache')
conflicts=('ccache')
source=(https://github.com/ccache/ccache/releases/download/v${pkgver}/ccache-${pkgver}.tar.xz{,.asc})
validpgpkeys=('5A939A71A46792CF57866A51996DDA075594ADB8') # Joel Rosdahl <joel@rosdahl.net>
sha512sums=('e80075eeea3fef8215de0a793e02381bfb59d7e74237fa34a49306047c60f0de0e678396ad3a9e5d86d3ad2aa21bbe29c7f0055f06b3ba2470f6895ce2eedd7b'
            'SKIP')
b2sums=('265ed6cd9602a04db0fadf63266d0fe1e78a74c69a27f05854a287e4048934d6afd63e71987bc525217782075c1a158601c400f3418caa0eb9730f34275bd08c'
        'SKIP')

build() {
	cmake -B build -S "${_pkgbase}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
	make -C build
}

check() {
	make -C build check
}

package() {
    make -C build DESTDIR="$pkgdir" install

	install -d "${pkgdir}/usr/lib/ccache/bin"

	local _prog
	for _prog in gcc g++ c++; do
		ln -s /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
		ln -s /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/${CHOST}-$_prog"
	done
	for _prog in cc clang clang++; do
		ln -s /usr/bin/ccache "${pkgdir}/usr/lib/ccache/bin/$_prog"
	done
}

# vim: ts=2 sw=2 et:
