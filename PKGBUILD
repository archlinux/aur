# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=trojita-git
pkgver=20121220
pkgrel=1
pkgdesc="A QT IMAP email client"
arch=(i686 x86_64)
url="http://trojita.flaska.net"
license=('GPL')
depends=('qtwebkit')
conflicts=('trojita')
provides=('trojita')
makedepends=('git' 'cmake')

_gitroot="git://anongit.kde.org/trojita.git"
_gitname="trojita"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	qmake PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make install INSTALL_ROOT="$pkgdir"
}
