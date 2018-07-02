# Maintainer: robertfoster

pkgname=xash3d-git
pkgver=v0.19.1.r117.g257b72a0
pkgrel=1
pkgdesc="A custom Gold Source engine rewritten from scratch"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://xash.su/"
license=('GPL3')
depends=('sdl2' 'freetype2' 'fontconfig')
depends_i686=('vgui')
depends_x86_64=('lib32-freetype2' 'lib32-fontconfig' 'lib32-sdl2' 'lib32-vgui')
makedepends=('make' 'binutils' 'cmake')
makedepends=('gcc')
makedepends_x86_64=('gcc-multilib' 'lib32-gcc-libs')
source=("$pkgname::git+https://github.com/FWGS/xash3d.git")

pkgver() {
	cd $srcdir/$pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $srcdir/$pkgname
	git submodule init && git submodule update
	mkdir -p build
}

build() {
	cd $srcdir/$pkgname
	cd build
	if [ "$CARCH" == "x86_64" ]; then
		cmake ../. -DHL_SDK_DIR=/usr/include/vgui -DXASH_SDL=yes \
		-DXASH_VGUI=yes -DCMAKE_C_FLAGS="-m32" \
		-DCMAKE_CXX_FLAGS="-m32" -DCMAKE_EXE_LINKER_FLAGS="-m32" \
		-DCMAKE_INSTALL_PREFIX=/usr -DLIB_INSTALL_DIR=lib32
	else
		cmake ../. -DHL_SDK_DIR=/usr/include/vgui -DXASH_SDL=yes \
		-DXASH_VGUI=yes -DCMAKE_INSTALL_PREFIX=/usr -DLIB_INSTALL_DIR=lib
	fi

	make -j2
}

package() {
	cd $srcdir/$pkgname/
	cd build
	make DESTDIR="$pkgdir" V=1 install
}

md5sums=('SKIP')
