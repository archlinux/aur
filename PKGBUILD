# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

pkgname=mypaint-git
pkgver=1.1.0.r4202.e0faa7f
pkgrel=2
pkgdesc="A fast and easy painting application for digital painters, with brush dynamics"
arch=('i686' 'x86_64')
url="http://mypaint.intilinux.com/"
license=('GPL')
depends=('desktop-file-utils' 'gtk3' 'gegl' 'babl' 'json-c' 'python2-cairo' 'python2-gobject' 'python2-numpy')
makedepends=('git' 'scons' 'swig')
provides=('mypaint' 'libmypaint-git')
conflicts=('mypaint' 'libmypaint-git')
install=mypaint-git.install
source=('git+https://github.com/mypaint/mypaint.git'
        'git+https://github.com/mypaint/libmypaint.git'
        'mypaint-git.install')
sha256sums=('SKIP'
            'SKIP'
            '34dec9df2e005de9fae6c6352f49835a1d41e515c6131ed1df8c9e27ee3c9d1d')

pkgver() {
	cd "$srcdir/mypaint"
	ver=$(git describe --abbrev=0 | sed -e 's/[^.0-9]//g')
	count=$(git rev-list --count HEAD)
	commit=$(git rev-parse --short HEAD)
	echo $ver.r$count.$commit
}

prepare() {
	cd "$srcdir/mypaint"

	git submodule init
	git config submodule.brushlib.url "$srcdir/libmypaint"
	git submodule update
}

build() {
	cd "$srcdir/mypaint"
	scons prefix="/usr" enable_gegl=true use_sharedlib=yes
}

package() {
	cd "$srcdir/mypaint"
	scons prefix="/usr" enable_gegl=true use_sharedlib=yes --install-sandbox="$pkgdir" "$pkgdir"

	#mypaint fails to start if this isn't installed, report upstream later
	cp brushlib/libmypaint-tests.so "$pkgdir/usr/lib/"
}
