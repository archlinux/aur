# Maintainer: X0rg

_svnname=gnustep-gui
pkgname=$_svnname-clang-svn
epoch=1
pkgver=r38298
pkgrel=3
pkgdesc="The GNUstep GUI class library, using Clang"
arch=('i686' 'x86_64')
url="http://www.gnustep.org/"
license=('GPL3' 'LGPL2.1')
groups=('gnustep-clang-svn')
depends=('libtiff' 'libjpeg-turbo' 'libpng' 'giflib' 'aspell' 'libsndfile' 'libao' 'libcups' 'gnustep-base-clang-svn')
depends_x86_64=('lib32-libtiff' 'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-giflib' 'lib32-libsndfile' 'lib32-libao' 'lib32-libcups')
makedepends=('subversion' 'gnustep-make-clang-svn')
makedepends_i686=('clang')
makedepends_x86_64=('lib32-clang')
optdepends=('flite: enable speech server (need recompilation)'
	'imagemagick: enable ImageMagick support (need recompilation)')
conflicts=('gnustep-gui' 'gnustep-gui-svn' 'gnustep-gui-multilib-clang-svn')
replaces=('gnustep-gui-multilib-clang-svn')
provides=('gnustep-gui')
options=('!emptydirs')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/gui/trunk/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_svnname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	msg2 "Patch 'NSBitmapImageRep+PNG.m' file..."
	sed -i 's|png_sizeof|sizeof|g' "$srcdir/$_svnname/Source/NSBitmapImageRep+PNG.m"

	if [[ $CARCH == "x86_64" ]]; then
		msg2 "Make a clone of $_svnname"
		cp -R "$srcdir/$_svnname" "$srcdir/$_svnname-32"
	fi
}

build() {
	cd "$srcdir/$_svnname"
	[[ -n $(pacman -Q imagemagick) ]] && imagemagick="--enable-imagemagick"

	msg2 "Run 'configure'..."
	OBJCFLAGS="-fblocks" CC="clang" CXX="clang++" ./configure --prefix=/usr --sysconfdir=/etc/GNUstep \
		--enable-libgif $imagemagick

	msg2 "Run 'make'..."
	make

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit build on x86_64
		cd "$srcdir/$_svnname-32"
		source "/usr/share/GNUstep32/Makefiles/GNUstep.sh"
		export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

		msg2 "Run 'configure' (32-bit)..."
		OBJCFLAGS="-fblocks" CC="clang -m32" CXX="clang++ -m32" ./configure --prefix=/usr --libdir=/usr/lib32 \
			--sysconfdir=/etc/GNUstep --enable-libgif --disable-speech

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
