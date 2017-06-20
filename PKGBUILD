# Maintainer: Omri Mor <omri50@gmail.com>
pkgname=libdispatch-git
pkgver=2017.06.17.a.r0.g56f36b6
pkgrel=1
pkgdesc="Comprehensive support for concurrent code execution on multicore hardware"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://apple.github.io/swift-corelibs-libdispatch/"
license=('Apache')
depends=('libbsd')
makedepends=('git' 'clang')
provides=('libdispatch' 'libdispatch-clang-git' 'libblocksruntime')
conflicts=('libdispatch' 'libdispatch-clang-git' 'libblocksruntime')
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
	OBJCFLAGS="$CFLAGS" OBJCXXFLAGS="$CXXFLAGS" ./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/libdispatch"
	make -k -j1 check
}

package() {
	cd "$srcdir/libdispatch"
	make DESTDIR="$pkgdir/" install
	ln -s "$pkgdir/usr/lib/libdispatch.so" "$pkgdir/usr/lib/libBlocksRuntime.so"
}
