# Maintainer: X0rg

_gitname=darling
pkgname=$_gitname-git
pkgver=689.accadce
pkgrel=14
pkgdesc="A Wine-like emulation layer that enables you to run Darwin/OS X apps on Linux"
arch=('i686' 'x86_64')
url="http://www.darlinghq.org"
license=('GPL3')
depends=('libbsd' 'libsystemd' 'openssl' 'gnustep-corebase-clang-svn')
depends_x86_64=('lib32-libbsd' 'lib32-systemd'  'lib32-openssl')
makedepends=('git' 'nasm' 'libkqueue' 'gnustep-gui-clang-svn')
makedepends_i686=('clang' 'libgl')
makedepends_x86_64=('lib32-clang' 'lib32-libgl')
optdepends=('dmg2dir-git: extract OS X application from .dmg file')
backup=(etc/darling/dylib.conf)
conflitcs=('darling-multilib-git')
replaces=('darling-multilib-git')
source=('git+https://github.com/LubosD/darling.git'
	'dyld')
md5sums=('SKIP'
         '9313524c87a422c9405ece68bd4ff4f2')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	msg2 "Make 'build' directory..."
	mkdir -pv "$srcdir/$_gitname/build"{,32}
}

build() {
	cd "$srcdir/$_gitname/build"

	msg2 "Run 'cmake'..."
	CC="clang" CXX="clang++" CXXFLAGS="${CXXFLAGS//-O2}" cmake .. -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev

	msg2 "Run 'make'..."
	make

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit build on x86_64
		cd "$srcdir/$_gitname/build32"
		source "/usr/share/GNUstep32/Makefiles/GNUstep.sh"
		export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

		msg2 "Run 'cmake' (32-bit)..."
		CC="clang -m32" CXX="clang++ -m32" CXXFLAGS="${CXXFLAGS//-O2}" cmake .. -DSUFFIX=32 -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev

		msg2 "Run 'make' (32-bit)..."
		make
	fi
}

package() {
	cd "$srcdir/$_gitname/build"
	msg2 "Install..."
	make DESTDIR="$pkgdir" install

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit install on x86_64
		cd "$srcdir/$_gitname/build32"
		msg2 "Install (32-bit)..."
		make DESTDIR="$pkgdir" install

		msg2 "Install script dyld (auto-choosing for dyld32 or dyld64)..."
		mv "$pkgdir/usr/bin/dyld" "$pkgdir/usr/bin/dyld64"
		install -Dvm755 "$srcdir/dyld" "$pkgdir/usr/bin/dyld"
	fi
}
