# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flatcc-git
pkgver=0.6.0.r195.g07ae7dc
pkgrel=1
epoch=1
pkgdesc="FlatBuffers Compiler and Library in C for C"
arch=('x86_64')
url="https://github.com/dvidelabs/flatcc"
license=('Apache')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('flatcc' 'libflatcc.so' 'libflatccrt.so')
conflicts=('flatcc')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	mkdir -p build
}

build() {
	cmake \
		-S "$pkgname" \
		-B build \
		-DBUILD_SHARED_LIBS=on \
		-DFLATCC_ALLOW_WERROR=off \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DFLATCC_INSTALL=on
	make -C build
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 *.md doc/* -t "$pkgdir/usr/share/doc/$pkgname"
	make DESTDIR="$pkgdir" install -C "$srcdir/build/"
}
