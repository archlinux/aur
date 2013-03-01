# Contributor: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>
pkgname=expressioneditor-git
pkgver=20130301
pkgrel=1
pkgdesc="Application intended to help in testing and writing regular expressions"
arch=(i686 x86_64)
url="http://alex-elliott.co.uk/projects/expression-editor"
license=('GPL')
depends=('qt4' 'icu')
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
		cd $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf build
	mkdir build
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release

	# Fix weird cmake bug
	sed -i 's|;--std=|--std=|' CMakeFiles/expressioneditor.dir/flags.make CMakeFiles/expressioneditor.dir/link.txt

	make
}

package() {
	cd "$srcdir/$_gitname/build"
	make DESTDIR="$pkgdir" install
}
