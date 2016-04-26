# Maintainer: X0rg

_gitname=darling
pkgname=$_gitname-git
pkgver=1230.63c6f36
pkgrel=1
pkgdesc="A Darwin/OS X emulation layer for Linux"
arch=('x86_64') # Can only be built on x86_64 systems
url="http://www.darlinghq.org"
license=('GPL3')
groups=('darling-git')
depends=('darling-mach-git' 'xz' 'fuse' 'libxml2' 'icu' 'openssl' 'lbzip2' 'zlib' 'libunwind' 'curl' 'systemd' 'libffi' 'bzip2' 'libxslt' 'wget')
depends_x86_64=('lib32-systemd' 'lib32-libffi' 'lib32-bzip2' 'lib32-libxslt')
makedepends=('git' 'cmake' 'clang' 'bison' 'flex')
makedepends_x86_64=('gcc-multilib')
source=('git+https://github.com/darlinghq/darling.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "$srcdir/$_gitname"

	msg2 "Initialize git submodules..."
	sed -i 's|url = ../|url = https://github.com/darlinghq/|g' .gitmodules
	git submodule update --init --recursive

	msg2 "Make build directories..."
	mkdir -pv "build/"{i386,x86-64}
	sed -i 's/lib64/lib/' Toolchain-x86_64.cmake
}

build() {
	# 32-bit build
	cd "$srcdir/$_gitname/build/i386"
	msg2 "Run 'cmake' for 32-bit build..."
	LDFLAGS="${LDFLAGS//,--as-needed}" cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../Toolchain-x86.cmake -DCMAKE_INSTALL_PREFIX=/usr
	msg2 "Run 'make' for 32-bit build..."
	make

	# 64-bit build
	cd "$srcdir/$_gitname/build/x86-64"
	msg2 "Run 'cmake' for 64-bit build..."
	LDFLAGS="${LDFLAGS//,--as-needed}" cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../Toolchain-x86_64.cmake -DCMAKE_INSTALL_PREFIX=/usr
	msg2 "Run 'make' for 64-bit build..."
	make
}

package() {
	# 32-bit install
	cd "$srcdir/$_gitname/build/i386"
	msg2 "Install 32-bit build..."
	make DESTDIR="$pkgdir" install

	# 64-bit install
	cd "$srcdir/$_gitname/build/x86-64"
	msg2 "Install 64-bit build..."
	make DESTDIR="$pkgdir" install
}
