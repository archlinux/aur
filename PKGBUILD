# Maintainer: X0rg

_svnname=gnustep-corebase
pkgname=$_svnname-clang-svn
epoch=1
pkgver=r38298
pkgrel=3
pkgdesc="The GNUstep CoreBase Library is a library of general-purpose, non-graphical C objects, using Clang."
arch=('i686' 'x86_64')
url="http://www.gnustep.org/"
license=('GPL3' 'LGPL2.1')
groups=('gnustep-clang-svn')
depends=('gnustep-base-clang-svn' 'libdispatch-clang-git')
depends_x86_64=('lib32-libdispatch-clang-git')
makedepends=('subversion' 'gnustep-make-clang-svn')
makedepends_i686=('clang' 'gcc-objc')
makedepends_x86_64=('lib32-clang' 'gcc-objc-multilib')
conflicts=('gnustep-corebase-git' 'gnustep-corebase-multilib-clang-svn')
replaces=('gnustep-corebase-multilib-clang-svn')
options=('!emptydirs')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/corebase/trunk/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_svnname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	if [[ $CARCH == "x86_64" ]]; then
		msg2 "Make a clone of $_svnname"
		cp -R "$srcdir/$_svnname" "$srcdir/$_svnname-32"
	fi
}

build() {
	cd "$srcdir/$_svnname"

	msg2 "Run 'configure'..."
	OBJCFLAGS="-fblocks" CC="clang" CXX="clang++" ./configure --prefix=/usr --sysconfdir=/etc/GNUstep

	msg2 "Run 'make'..."
	make

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit build on x86_64
		cd "$srcdir/$_svnname-32"
		source "/usr/share/GNUstep32/Makefiles/GNUstep.sh"
		export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

		msg2 "Run 'configure' (32-bit)..."
		OBJCFLAGS="-fblocks" CC="clang -m32" CXX="clang++ -m32" ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc/GNUstep

		msg2 "Run 'make' (32-bit)..."
		make
	fi
}

# check() {
# 	cd "$srcdir/$_svnname"
# 	make check || warning "One test has failed !"
#
# 	if [[ $CARCH == "x86_64" ]]; then
# 		# 32-bit check on x86_64
# 		cd "$srcdir/$_svnname-32"
# 		make check || warning "One test has failed !"
# 	fi
# }

package() {
	cd "$srcdir/$_svnname"
	msg2 "Install..."
	GNUSTEP_CONFIG_FILE="/etc/GNUstep/GNUstep.conf" make DESTDIR="$pkgdir" install

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit install on x86_64
		cd "$srcdir/$_svnname-32"
		msg2 "Install (32-bit)..."
		GNUSTEP_CONFIG_FILE="/etc/GNUstep/GNUstep32.conf" make DESTDIR="$pkgdir" install
	fi
}
