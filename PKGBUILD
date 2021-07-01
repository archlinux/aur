# Maintainer: Shuyuan Liu (AUR)

pkgname=aptdec-git
pkgver=r184.794d69c
pkgrel=2
pkgdesc='NOAA APT satellite imagery decoder'
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/Xerbo/aptdec"
license=('GPL2')
depends=('libsndfile' 'libpng')
makedepends=('git' 'cmake')
provides=('aptdec')
conflicts=('aptdec')
md5sums=('SKIP'
         '129dbf2c66891cb179482a6e2539676f')

source=('git+https://github.com/Xerbo/aptdec'
        '0001-Fix-GCC-A-may-be-used-uninitialized-warning.patch')

pkgver() {
	cd aptdec
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd aptdec
    patch --forward --strip=1 --input="$srcdir/0001-Fix-GCC-A-may-be-used-uninitialized-warning.patch"
}

build() {
	cd aptdec
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd aptdec/build
	make DESTDIR="$pkgdir/" install
}

