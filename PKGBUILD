# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergey Malkin  <adresatt@gmail.com>

pkgname=nemu
pkgver=3.2.0
pkgrel=2
pkgdesc="ncurses interface for QEMU"
arch=(i686 x86_64)
url="https://github.com/nemuTUI/nemu"
license=(BSD)
depends=(qemu ncurses sqlite udev libusb json-c libxml2 libarchive bash)
makedepends=(git cmake)
source=("git+https://github.com/nemuTUI/nemu.git#tag=v${pkgver}"
        "nemu-fix-compiler-flags.patch::https://github.com/nemuTUI/nemu/commit/e8c206775e8fb288d79fdc73d703e05d8e93ed31.patch")
sha256sums=('SKIP'
            'e831c072932e1f2c33ad30ed1600352aa5a3c6d8aab990dc44624ef2718142bb')

prepare() {
  cd "${pkgname}"
  [[ -d build ]] || mkdir build
  patch -Np1 -i ../nemu-fix-compiler-flags.patch
}

build() {
  cd "${pkgname}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
