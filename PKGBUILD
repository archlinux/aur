# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Jristz
pkgname=nano-svn
pkgver=5245
pkgrel=1
pkgdesc="Pico editor clone with enhancements, svn version"
arch=(i686 x86_64)
license=('GPL')
url="http://www.nano-editor.org"
depends=('glibc' 'ncurses')
makedepends=('texinfo' 'subversion')
source=(nano::svn+svn://svn.savannah.gnu.org/nano/trunk/nano)
backup=('etc/nanorc')
provides=('nano')
conflicts=('nano')
md5sums=('SKIP')

pkgver() {
	 # Get the proper version.
	 cd nano
	 svnversion | tr -d [A-z]
}

build() {
	# Compiling nano.
	cd $srcdir/nano
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --enable-color --enable-nanorc --enable-multibuffer \
		    --bindir=/usr/bin --sbindir=/usr/bin --disable-wrapping-as-root
	make
}

package(){
	# Removing unwanted source dir.
	rm -r $startdir/nano

	# Moving everything to pkg/.
	cd $srcdir/nano

	make DESTDIR=$pkgdir sbindir=/usr/bin install 

	install -DTm644 $srcdir/nano/doc/nanorc.sample $pkgdir/etc/nanorc
}
