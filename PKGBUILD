# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=dateutils-static
_pkgname=dateutils
pkgver=0.4.12
pkgrel=1
pkgdesc="nifty command line date and time utilities; fast date calculations and conversion in the shell"
url='https://www.fresse.org/dateutils/'
arch=('x86_64' 'aarch64')
license=('BSD')
conflicts=('dateutils')
replaces=('dateutils')
makedepends=('gperf' 'gcc' 'musl' 'make')
source=("https://github.com/hroptatyr/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha512sums=('f953a2dc9bf2cddb1f7f8bde8f2bc4318f7485d26ae64a8b637ef18571b23c1a83c45d92a5537957dc2662da67db8f8586e588bc2bf926ce9276c599d9e96c13')
validpgpkeys=('6CB0D61E23A4275CC2CFA16194C9A1AC82C9390E')

build() {
    cd ${_pkgname}-${pkgver}
    export CC="musl-gcc -fno-link-libatomic" CFLAGS="--static"
    ./configure --prefix=/usr --with-old-links=no
    make -j $(nproc)
}
check() {
    make -C ${_pkgname}-${pkgver} check
}
package() {
    make -C ${_pkgname}-${pkgver} DESTDIR=$pkgdir install
    strip ${pkgdir}/usr/bin/*
    install -Dm0644 ${_pkgname}-${pkgver}/LICENSE \
      ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
