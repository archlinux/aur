# Maintainer: X0rg

_svnname=gnustep-libobjc2
pkgname=$_svnname-clang-svn
epoch=1
pkgver=r38298
pkgrel=1
pkgdesc="The GNUstep Objective-C runtime is designed as a drop-in replacement for the GCC runtime, using Clang"
arch=('i686' 'x86_64')
url="http://www.gnustep.org/"
license=('custom:MIT')
groups=('gnustep-clang-svn')
depends_i686=('gcc-libs')
depends_x86_64=('gcc-libs-multilib')
makedepends=('subversion' 'cmake' 'gnustep-make-clang-svn')
makedepends_i686=('clang')
makedepends_x86_64=('lib32-clang')
optdepends_i686=('libdispatch-clang-git: enable libdispatch at compilation after installing gnustep-libobjc2-clang-svn then libdispatch-clang-git')
optdepends_x86_64=('lib32-libdispatch-clang-git: enable libdispatch at compilation after installing gnustep-libobjc2-clang-svn then lib32-libdispatch-clang-git')
conflicts=('gnustep-libobjc2-git' 'gnustep-libobjc2-multilib-clang-svn')
replaces=('gnustep-libobjc2-multilib-clang-svn')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/libobjc2/trunk/")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_svnname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	msg2 "Create 'build' directory..."
	mkdir -pv "$srcdir/$_svnname/build"
	[[ $CARCH == "x86_64" ]] && mkdir -pv "$srcdir/$_svnname/build32"

	msg2 "Delete 'GNUmakefile' file..."
	rm -v "$srcdir/$_svnname/GNUmakefile"
}

build() {
	cd "$srcdir/$_svnname/build"

	msg2 "Run 'cmake'..."
	OBJCFLAGS="-fblocks" CC="clang" CXX="clang++" LDFLAGS="${LDFLAGS//,--as-needed}" cmake .. -DLIBOBJC_NAME=objc2

	msg2 "Run 'make'..."
	make

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit build on x86_64
		cd "$srcdir/$_svnname/build32"
		source "/usr/share/GNUstep32/Makefiles/GNUstep.sh"
		export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

		msg2 "Run 'cmake' (32-bit)..."
		OBJCFLAGS="-fblocks" ASMFLAGS="-m32" CC="clang -m32" CXX="clang++ -m32" LDFLAGS="${LDFLAGS//,--as-needed}" cmake .. -DLIBOBJC_NAME=objc2

		msg2 "Run 'make' (32-bit)..."
		make
	fi
}

# check() {
# 	cd "$srcdir/$_svnname/build"
# 	make test || warning "One test has failed !"
#
# 	if [[ $CARCH == "x86_64" ]]; then
# 		# 32-bit check on x86_64
# 		cd "$srcdir/$_svnname/build32"
# 		make test || warning "One test has failed !"
# 	fi
# }

package() {
	cd "$srcdir/$_svnname/build"
	msg2 "Install..."
	make DESTDIR="$pkgdir" install

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit install on x86_64
		cd "$srcdir/$_svnname/build32"
		msg2 "Install (32-bit)..."
		make DESTDIR="$pkgdir" install
	fi

	msg2 "Install the license..."
	install -Dvm644 "../COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
