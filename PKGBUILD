# Maintainer: Marc Lebrun <mclbn.dev@gmail.com>
pkgname=libevhtp-git
_gitname=libevhtp
pkgver=1.2.11.r46.gd4bcfa8
pkgrel=1
pkgdesc="A more flexible replacement for libevent's httpd API (git develop branch)."
arch=('i686' 'x86_64' 'armv5te' 'armv6h' 'armv7h')
url="https://github.com/ellzey/libevhtp"
license=('BSD')
conflicts=('libevhtp')
depends=('libevent>=2.0.0')
makedepends=('git' 'cmake')
optdepends=()
provides=()
options=('staticlibs')

source=("git://github.com/ellzey/libevhtp.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
	 cd "$srcdir/$_gitname"
	 git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
	cd "$srcdir/$_gitname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ./
	make
}

package () {
	#install library and header files
	cd "$srcdir/$_gitname"
	echo "$pkgdir"
	make DESTDIR="$pkgdir/" install

	# include files seems to be installed to /usr/lib/evhtp by default now, moving them
	mv $pkgdir/usr/include/evhtp/*.h $pkgdir/usr/include/
	rm -r $pkgdir/usr/include/evhtp/

	#copy license over
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
