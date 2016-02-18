# Maintainer: X0rg

_svnname=gnustep-base
pkgname=$_svnname-clang-svn
epoch=1
pkgver=r38298
pkgrel=2
pkgdesc="The GNUstep base package, using Clang"
arch=('i686' 'x86_64')
url="http://www.gnustep.org/"
license=('GPL2' 'GPL3' 'LGPL2.1')
groups=('gnustep-clang-svn')
depends=('libffi' 'libxml2' 'libxslt' 'gnutls' 'icu' 'gnustep-libobjc2-clang-svn')
depends_x86_64=('lib32-libffi' 'lib32-libxml2' 'lib32-libxslt' 'lib32-gnutls' 'lib32-icu' 'lib32-libao')
makedepends=('subversion' 'gnustep-make-clang-svn')
makedepends_i686=('clang')
makedepends_x86_64=('lib32-clang')
optdepends=('avahi: enable NSNetServices support (need recompilation)')
optdepends_i686=('libdispatch-clang-git: enable dispatching blocks via libdispatch (need recompilation)')
optdepends_x86_64=('lib32-avahi: enable 32-bit NSNetServices support (need recompilation)'
	'lib32-libdispatch-clang-git: enable dispatching blocks via libdispatch (need recompilation)')
conflicts=('gnustep-base' 'gnustep-base-svn' 'gnustep-base-multilib-clang-svn')
replaces=('gnustep-base-multilib-clang-svn')
provides=('gnustep-base')
options=('!emptydirs')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/base/trunk/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_svnname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	msg2 "Fix permissions..."
	sed -i 's/tar -xf $(TIMEZONE_ARCHIVE);/tar -xf $(TIMEZONE_ARCHIVE);chown -R root:root * ;/' "$srcdir/$_svnname/NSTimeZones/Makefile.postamble"

	if [[ $CARCH == "x86_64" ]]; then
		msg2 "Make a clone of $_svnname"
		cp -R "$srcdir/$_svnname" "$srcdir/$_svnname-32"
	fi
}

build() {
	cd "$srcdir/$_svnname"

	msg2 "Run 'configure'..."
	OBJCFLAGS="-fblocks" CC="clang" CXX="clang++" ./configure --prefix=/usr --sysconfdir=/etc/GNUstep \
		--disable-unicodeconstants --with-ffi-include=/usr/lib/libffi-`pacman -Q libffi | cut -f2 -d\ |cut -f1 -d-`/include/

	msg2 "Run 'make'..."
	make

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit build on x86_64
		cd "$srcdir/$_svnname-32"
		source "/usr/share/GNUstep32/Makefiles/GNUstep.sh"
		export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

		msg2 "Run 'configure' (32-bit)..."
		OBJCFLAGS="-fblocks" CC="clang -m32" CXX="clang++ -m32" ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc/GNUstep \
			--disable-unicodeconstants --with-ffi-include=/usr/lib32/libffi-`pacman -Q lib32-libffi | cut -f2 -d\ |cut -f1 -d-`/include/

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
		# 32-bit build on x86_64
		cd "$srcdir/$_svnname-32"
		msg2 "Install (32-bit)..."
		GNUSTEP_CONFIG_FILE="/etc/GNUstep/GNUstep32.conf" make DESTDIR="$pkgdir" install
	fi
}
