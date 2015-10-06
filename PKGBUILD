# Maintainer: X0rg

_gitname=libdispatch
pkgname=$_gitname-clang-git
pkgver=301.4e4b38f
pkgrel=6
pkgdesc="Linux port of Apple's open-source concurrency library with blocks support, using Clang"
arch=('i686' 'x86_64')
url="http://nickhutchinson.me/libdispatch"
license=('Apache')
depends=('libkqueue' 'libpthread_workqueue-git' 'gnustep-libobjc2-clang-svn')
makedepends=('git' 'cmake' 'clang')
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
	msg2 "Run 'cmake'..."
	OBJCFLAGS="-fblocks" CC="clang" CXX="clang++" cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

	msg2 "Run 'make'..."
	make
}

package() {
	cd "$srcdir/$_gitname/build"
	msg2 "Install..."
	make DESTDIR="$pkgdir" install
}
