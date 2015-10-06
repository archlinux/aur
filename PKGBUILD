# Maintainer: X0rg

_gitname=libdispatch
pkgname=lib32-$_gitname-clang-git
pkgver=301.4e4b38f
pkgrel=4
pkgdesc="Linux port of Apple's open-source concurrency library with blocks support, using Clang (32-bit)"
arch=('x86_64')
url="http://nickhutchinson.me/libdispatch"
license=('Apache')
depends=('lib32-libkqueue' 'lib32-libpthread_workqueue-git' 'gnustep-libobjc2-clang-svn' 'libdispatch-clang-git')
makedepends=('git' 'cmake' 'lib32-clang')
conflicts=('libdispatch-svn')
source=("git://github.com/nickhutchinson/$_gitname.git"
	'gnustep-blocks.patch')
md5sums=('SKIP'
         '735b9990836df8b24f9c8a64c7f1c344')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "$srcdir/$_gitname"
	msg2 "Patch to use GNUstep Libobjc2 Blocks..."
	patch -p1 -i "$srcdir/gnustep-blocks.patch"

	msg2 "Make 'build' directory..."
	mkdir -pv "./build"
}

build() {
	cd "$srcdir/$_gitname/build"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	msg2 "Run 'cmake'..."
	OBJCFLAGS="-fblocks" CC="clang -m32" CXX="clang++ -m32" cmake .. -DCMAKE_INSTALL_PREFIX=/usr

	msg2 "Run 'make'..."
	make
}

package() {
	cd "$srcdir/$_gitname/build"
	msg2 "Install..."
	make DESTDIR="$pkgdir" install

	# Clean up lib32 package
	rm -rf "$pkgdir"/usr/{include,share}
	mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
}
