# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=kregexpeditor-git

pkgver=20130312
pkgrel=1
pkgdesc="KDE editor for regular expressions"
arch=(i686 x86_64)
url="https://projects.kde.org/projects/playground/utils/kregexpeditor"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('git' 'cmake' 'automoc4')
provides=('kregexpeditor')
conflicts=('kregexpeditor')
replaces=('kregexpeditor-svn')
install=kregexpeditor.install

_gitroot="git://anongit.kde.org/kregexpeditor"
_gitname="kregexpeditor"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir/" install
}
