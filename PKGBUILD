# Maintainer: M0Rf30

pkgname=xash3d-git
pkgver=v0.19.r4.g18eb06d
pkgrel=1
pkgdesc="A custom Gold Source engine rewritten from scratch"
arch=(i686 x86_64)
url="http://xash.su/"
license=('GPL3')
depends=('lib32-sdl2')
makedepends=('gcc-multilib')
install=
source=("$pkgname::git+https://github.com/FWGS/xash3d.git"
	xash3d.sh)

pkgver() {
  cd $srcdir/$pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
        cd $srcdir/$pkgname
        git submodule init && git submodule update
        mkdir -p build
        cp ../xash3d.sh .
}
build() {
	cd $srcdir/$pkgname
	cd build
	cmake ../. -DHL_SDK_DIR=../hlsdk -DXASH_SDL=yes -DXASH_VGUI=yes \
	      -DCMAKE_C_FLAGS="-m32" -DCMAKE_CXX_FLAGS="-m32" \
	      -DCMAKE_EXE_LINKER_FLAGS="-m32" \
	      -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd $srcdir/$pkgname/
	cd build
	make DESTDIR="$pkgdir" install
}

md5sums=('SKIP'
         '3ef06bad6df82f714b57ce2f35cf7903')
