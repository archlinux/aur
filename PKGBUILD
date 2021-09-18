# Maintainer: Sythelux Rikd <dersyth@gmail.com>
# Maintainer: Mattia Basaglia <glax@dragon.best>
_corpname=glaxnimate
_pkgname='glaxnimate'
pkgname="$_pkgname"
pkgver=0.4.5
pkgrel=1
pkgdesc="Simple vector animation program."
url="https://glaxnimate.mattbas.org/"
license=('GPL3')
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
makedepends=('git' 'cmake' 'qt5-tools')
depends=('python' 'zlib' 'hicolor-icon-theme' 'qt5-base' 'potrace' 'ffmpeg' 'qt5-imageformats' 'qt5-svg' 'libarchive')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://gitlab.com/mattbas/$_pkgname/#branch=release"
)
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname/"

	# Provide git submodules
	git submodule init
	git submodule update --init --recursive
}

pkgver() {
	cd "$srcdir/$_pkgname/"
	git describe --tags | tr - _
}

build() {
	cd "$srcdir/$_pkgname/"
	mkdir -p build
	cd build
    cmake ".." -DCMAKE_INSTALL_PREFIX=/usr
    make -j 4
	make -j 4 translations
}

package() {
	cd "$srcdir/$_pkgname/build"
	make install DESTDIR=$pkgdir >/dev/null
}
