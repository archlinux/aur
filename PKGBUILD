# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isho Antar <IshoAntar@protonmail.com>
# Contributor: Michael Yang <ohmyarchlinux@pm.me>

pkgname=fmt-git
pkgver=9.0.0.r23.g81f1cc74
pkgrel=1
pkgdesc='Open-source formatting library for C++'
url='https://fmt.dev/'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("fmt=${pkgver%.r*}" 'libfmt.so')
conflicts=('fmt')
source=('fmt::git+https://github.com/fmtlib/fmt')
sha512sums=('SKIP')

pkgver() {
	git -C fmt describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S fmt \
		-DFMT_DOC=OFF \
		-DBUILD_SHARED_LIBS=TRUE \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-Wno-dev
	make -C build
}

check() {
	make -C build test
}

package() {
	make -C build DESTDIR="${pkgdir}" install
	install -Dm644 fmt/LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
