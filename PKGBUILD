# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=dateutils-static
_pkgname=dateutils
pkgver=0.4.11
pkgrel=1
pkgdesc="nifty command line date and time utilities; fast date calculations and conversion in the shell"
url='https://www.fresse.org/dateutils/'
arch=('x86_64' 'aarch64')
license=('BSD')
conflicts=('dateutils')
replaces=('dateutils')
makedepends=('gperf' 'gcc' 'musl' 'make')
source=("https://bitbucket.org/hroptatyr/${_pkgname}/downloads/${_pkgname}-${pkgver}.tar.xz")
sha512sums=('601fa8197acdb68fe0688aed3fa2ba2fcf66b9a8ad23a0c7cb816a2cba9c645854ec8715a2127e02294cc068f63b09d0596eee60e151a8ad0edff22f54ec9d7a')
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
