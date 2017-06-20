# Maintainer: Omri Mor <omri50@gmail.com>
pkgname=libdispatch-git
pkgver=2017.06.19.a.r0.g56f36b6
pkgrel=2
pkgdesc="Comprehensive support for concurrent code execution on multicore hardware"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://apple.github.io/swift-corelibs-libdispatch/"
license=('Apache')
depends=('libbsd' 'libblocksruntime')
makedepends=('git' 'clang')
provides=('libdispatch' 'libdispatch-clang-git')
conflicts=('libdispatch' 'libdispatch-clang-git' 'swift' 'swift-development')
replaces=('libdispatch-clang-git')
source=('libdispatch::git+https://github.com/apple/swift-corelibs-libdispatch.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/libdispatch"
	git describe --long | sed 's/^swift-DEVELOPMENT-SNAPSHOT-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/libdispatch"
}

build() {
	cd "$srcdir/libdispatch"
	sh autogen.sh
	./configure \
		--prefix=/usr \
		--disable-embedded-blocks-runtime \
		OBJCFLAGS="$CFLAGS" \
		OBJCXXFLAGS="$CXXFLAGS"
	make
}

check() {
	cd "$srcdir/libdispatch"
	make -k -j1 check
}

package() {
	cd "$srcdir/libdispatch"
	make DESTDIR="$pkgdir/" install
}
