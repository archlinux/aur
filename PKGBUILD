pkgname=libevhtp2-git
_gitname=libevhtp
pkgver=1.2.4.r156.ge30bb07
pkgrel=1
pkgdesc="A more flexible replacement for libevent's httpd API (git develop branch)."
arch=('i686' 'x86_64' 'armv5te' 'armv6h' 'armv7h')
url="https://github.com/azat/libevhtp"
license=('BSD')
conflicts=('libevhtp-git' 'libevhtp')
depends=('libevent-git>=2.0.0')
makedepends=('git' 'cmake')
optdepends=()
provides=()
options=('staticlibs')

source=("git://github.com/azat/libevhtp#branch=libevhtp2-azat")
sha256sums=('SKIP')

pkgver() {
	 cd "$srcdir/$_gitname"
	 git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
	cd "$srcdir/$_gitname"
	cmake -DCMAKE_C_FLAGS=-fPIC -DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DCMAKE_INSTALL_PREFIX=/usr ./
	make
}

package () {
	#install library and header files
	cd "$srcdir/$_gitname"
	echo "$pkgdir"
	make DESTDIR="$pkgdir/" install

	if [ ! -d $pkgdir/usr/include/evhtp2 ]; then
		mkdir -p $pkgdir/usr/include/evhtp2
		mv $pkgdir/usr/include/*.h $pkgdir/usr/include/evhtp2/
	fi

	#copy license over
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
