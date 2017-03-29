# Maintainer: X0rg

_gitname=darling
pkgname=$_gitname-git
pkgver=r1741.a33de880
pkgrel=1
pkgdesc="A Darwin/OS X emulation layer for Linux"
arch=('x86_64') # Can only be built on x86_64 systems
url="http://www.darlinghq.org"
license=('GPL3')
install=$pkgname.install
groups=('darling-git')
depends=('darling-mach-dkms-git' 'xz' 'fuse' 'libxml2' 'icu' 'openssl' 'bzip2' 'zlib' 'libsystemd'
	'wget' 'curl' 'sqlite' 'ruby' 'sed' 'libarchive' 'file' 'python' 'gawk' 'libunwind') # namcap complains about them
depends_x86_64=('lib32-clang' 'lib32-bzip2' 'lib32-systemd' 'lib32-libxslt')
makedepends=('git' 'cmake' 'clang' 'bison' 'flex' 'binutils>=2.28')
makedepends_x86_64=('gcc-multilib')
source=('git+https://github.com/darlinghq/darling.git')
md5sums=('SKIP')
options=('!buildflags')

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

	msg2 "Make build directory..."
	mkdir -pv "build"
}

build() {
	cd "$srcdir/$_gitname/build"
	msg2 "Run 'cmake'..."
	cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../Toolchain.cmake -DCMAKE_INSTALL_PREFIX=/usr
	msg2 "Run 'make'..."
	make
}

package() {
	cd "$srcdir/$_gitname/build"
	make DESTDIR="$pkgdir" install
	install -Dvm755 "$srcdir/$_gitname/src/setup-ld-so.sh" "$pkgdir/usr/bin/darling-setup-ld-so"
}
