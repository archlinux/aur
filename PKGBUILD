# Contributor: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>
pkgname=expressioneditor-git
pkgver=20110414
pkgrel=1
pkgdesc="Application intended to help in testing and writing regular expressions"
arch=(i686 x86_64)
url="http://alex-elliott.co.uk/projects/expression-editor"
license=('GPL')
depends=('qt' 'icu')
makedepends=('git' 'cmake')

_gitroot="https://github.com/aelliott/expressioneditor.git"
_gitname=expressioneditor

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ]; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=0 $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install
}
