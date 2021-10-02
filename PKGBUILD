# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Sythelux Rikd <dersyth@gmail.com>
_corpname=python-glaxnimate
_pkgname='glaxnimate'
pkgname=python-glaxnimate
pkgver=0.4.6
pkgrel=1
pkgdesc="Python bindings for Glaxnimate."
url="https://glaxnimate.mattbas.org/"
license=('GPL3')
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
makedepends=('git' 'qt5-base' 'python' 'zlib' 'hicolor-icon-theme' 'potrace' 'ffmpeg' 'cmake' 'qt5-tools')
depends=('python' 'qt5-base' 'potrace' 'ffmpeg')
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

        if [ ! -e build ]; then mkdir build; fi
	cd build
	cmake ".." -DCMAKE_INSTALL_PREFIX=/usr
	make glaxnimate_python
}

package() {
	cd "$srcdir/$_pkgname/build/bin/python"
	python setup.py install --prefix=/usr --root="$pkgdir"
}
