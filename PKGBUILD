# Maintainer: X0rg

_svnname=gnustep-make
pkgname=$_svnname-clang-svn
epoch=1
pkgver=r38389
pkgrel=4
pkgdesc="The GNUstep make package, using Clang"
arch=('any')
url="http://www.gnustep.org/"
license=('GPL3')
groups=('gnustep-clang-svn')
depends=('bash')
makedepends=('subversion')
makedepends_i686=('gcc' 'clang')
makedepends_x86_64=('gcc-multilib' 'lib32-clang')
conflicts=('gnustep-make' 'gnustep-make-multilib-clang-svn')
replaces=('gnustep-make-multilib-clang-svn')
provides=('gnustep-make')
options=('!emptydirs')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/tools/make/trunk/"
	'arch'
	'lib32-arch')
md5sums=('SKIP'
         '0daa9a592d808306193540bda0980673'
         '2a6ac6a4b3feac708d3272829cfcdc37')

pkgver() {
	cd "$srcdir/$_svnname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	msg2 "Copy new file system layouts for Arch..."
	cp -v "$srcdir/"{arch,lib32-arch} "$srcdir/$_svnname/FilesystemLayouts/"

	if [[ $CARCH == "x86_64" ]]; then
		msg2 "Make a clone of $_svnname"
		cp -R "$srcdir/$_svnname" "$srcdir/$_svnname-32"
	fi
}

build() {
	cd "$srcdir/$_svnname"
	msg2 "Run 'configure'..."
	CC="clang" CXX="clang++" ./configure --prefix=/usr --sysconfdir=/etc/GNUstep --with-layout=arch --with-objc-lib-flag=-l:libobjc2.so

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit build on x86_64
		cd "$srcdir/$_svnname-32"
		export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
		msg2 "Run 'configure' (32-bit)..."
		CC="clang -m32" CXX="clang++ -m32" ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc/GNUstep --with-layout=lib32-arch \
			--with-objc-lib-flag=-l:libobjc2.so --with-config-file=/etc/GNUstep/GNUstep32.conf
	fi
}

package() {
	cd "$srcdir/$_svnname"
	msg2 "Install..."
	make DESTDIR="$pkgdir" install
	echo -e "# Added by $pkgname package\nexport PATH=$PATH" >> "$pkgdir/usr/share/GNUstep/Makefiles/GNUstep-reset.sh"

	if [[ $CARCH == "x86_64" ]]; then
		# 32-bit install on x86_64
		cd "$srcdir/$_svnname-32"
		msg2 "Install (32-bit)..."
		make DESTDIR="$pkgdir" install
		echo -e "# Added by $pkgname package\nexport PATH=$PATH" >> "$pkgdir/usr/share/GNUstep32/Makefiles/GNUstep-reset.sh"
	fi
}
