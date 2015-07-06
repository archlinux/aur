# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kochmorse-git
_pkgname=kochmorse
pkgver=3.1.0
pkgrel=1
pkgdesc="A simple morse tutor using the Koch method - GIT version."
arch=('i686' 'x86_64')
url="https://github.com/hmatuschek/kochmorse"
license=('GPL')
depends=('qt5-svg' 'portaudio' 'libxkbcommon-x11' 'desktop-file-utils')
makedepends=('cmake' 'git')
provides=('kochmorse')
conflicts=('kochmorse')
install=$_pkgname.install

_gitroot=https://github.com/hmatuschek/kochmorse.git
_gitname=master

pkgver() {
	cd "$srcdir/${_gitname}-build"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
 		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

build() {
	cd "$srcdir/${_gitname}-build"
	msg "Starting build..."

	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	msg "Starting packaging..."

	make DESTDIR="$pkgdir/" install
}
