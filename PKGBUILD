# Maintainer: X0rg

_gitname=darling
pkgname=$_gitname-git
pkgver=r1532.a7d584bf
pkgrel=1
pkgdesc="A Darwin/OS X emulation layer for Linux"
arch=('x86_64') # Can only be built on x86_64 systems
url="http://www.darlinghq.org"
license=('GPL3')
groups=('darling-git')
depends=('darling-mach-dkms-git' 'xz' 'fuse' 'libxml2' 'icu' 'openssl' 'bzip2' 'zlib' 'libsystemd'
	'wget' 'curl' 'sqlite' 'ruby' 'sed' 'libarchive' 'file' 'python' 'gawk' 'libunwind') # namcap complains about them
depends_x86_64=('lib32-clang' 'lib32-bzip2' 'lib32-systemd' 'lib32-libxslt')
makedepends=('git' 'cmake' 'clang' 'bison' 'flex' 'binutils<2.27' 'binutils>=2.28') # binutils-2.27 bug report: https://github.com/darlinghq/darling/issues/157
makedepends_x86_64=('gcc-multilib')
source=('git+https://github.com/darlinghq/darling.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_gitname"

	msg2 "Initialize git submodules..."
	sed -i 's|url = ../|url = https://github.com/darlinghq/|g' .gitmodules
	git submodule update --init --recursive

	#msg2 "Forbid libexec use..."
	#sed -i 's|${CMAKE_INSTALL_PREFIX}/libexec/darling|${CMAKE_INSTALL_PREFIX}/share/darling/prefix|g' src/darling-config.h.in
	#find . -name CMakeLists.txt -exec sed -i 's|libexec/darling|${CMAKE_INSTALL_PREFIX}/share/darling/prefix|g' {} \;

	msg2 "Make build directories..."
	mkdir -pv "build/"{i386,x86-64}
}

build() {
	# 32-bit build
	cd "$srcdir/$_gitname/build/i386"
	msg2 "Run 'cmake' for 32-bit build..."
	cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../Toolchain-x86.cmake -DCMAKE_INSTALL_PREFIX=/usr
	msg2 "Run 'make' for 32-bit build..."
	make

	# 64-bit build
	cd "$srcdir/$_gitname/build/x86-64"
	msg2 "Run 'cmake' for 64-bit build..."
	cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../Toolchain-x86_64.cmake -DCMAKE_INSTALL_PREFIX=/usr
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
