# Maintainer: John Regan <john@jrjrtech.com>
pkgname='vgmtools-git'
pkgver=r184.19aa30e
pkgrel=1
pkgdesc="A collection of tools for the VGM file format"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/vgmrips/vgmtools"
license=('GPL-2.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'zlib')
makedepends=('git' 'cmake')

source=('git+https://github.com/vgmrips/vgmtools.git')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    # leaving a note for patching
    #patch --forward --strip=1 --input="${srcdir}/vgmtools-example.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    rm -rf build
    mkdir build
    cd build
    cmake \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_SKIP_BUILD_RPATH=TRUE \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
	make all optdac optvgm32
}

package() {
	cd "${pkgname%-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "build"
    make install DESTDIR="$pkgdir"
}

