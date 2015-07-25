# Maintainer: Xentec <artificial.i7 at gmail dot com>

pkgname=entityx-git
pkgver=1.2.0.r0.ga7535d8
pkgrel=1
pkgdesc="A fast, type-safe C++ Entity-Component system"
arch=('i686' 'x86_64')
url="https://github.com/alecthomas/entityx"
license=('MIT')
depends=('gcc-libs')
conflicts=('entityx')
makedepends=('cmake' 'git')
source=("$pkgname"::'git+https://github.com/alecthomas/entityx')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	mkdir -p build && cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DENTITYX_BUILD_SHARED=1 \
		-DENTITYX_BUILD_TESTING=0 \
		-Wno-dev \
		..
	make
}

check() {
	cd "$pkgname"
	cd build

	cmake \
		-DENTITYX_BUILD_TESTING=1 \
		..

	make 
	make test
}

package() {
	cd "$pkgname"

	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd build
	make DESTDIR="$pkgdir" install
}
