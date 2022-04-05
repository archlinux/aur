# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isho Antar <IshoAntar@protonmail.com>
# Contributor: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=spdlog-git
pkgver=1.10.0.r0.g76fb40d9
pkgrel=1
pkgdesc='Very fast, header only, C++ logging library'
arch=('x86_64')
url='https://github.com/gabime/spdlog'
license=('MIT')
depends=('libfmt.so')
makedepends=('git' 'cmake')
provides=('spdlog' 'libspdlog.so')
conflicts=('spdlog')
source=("git+$url#branch=v1.x")
sha512sums=('SKIP')

pkgver() {
	git -C spdlog describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S spdlog \
		-DSPDLOG_BUILD_BENCH=OFF \
		-DSPDLOG_BUILD_EXAMPLE=OFF \
		-DSPDLOG_BUILD_TESTS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DSPDLOG_BUILD_SHARED=ON \
		-DSPDLOG_FMT_EXTERNAL=ON \
		-Wno-dev
	make -C build
}

check() {
	cd build
	ctest
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	install -Dm644 spdlog/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
