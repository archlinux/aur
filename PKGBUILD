# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Taylor Smock <vorpalblade77@gmail.com>
# Contributor: Keshav Amburay <the.ridikulus.rat@gmail.com>

pkgname=shim-efi
pkgver=15
pkgrel=3
pkgdesc='Bootloader for UEFI Secure Boot'
url='https://github.com/rhboot/shim/'
arch=('any')
license=('BSD')
makedepends=('gnu-efi-libs' 'pesign')
source=("${pkgname}-${pkgver}.tar.bz2"::"https://github.com/rhboot/shim/releases/download/${pkgver}/shim-${pkgver}.tar.bz2"
        "${pkgname}-gcc9-fix.patch"::'https://patch-diff.githubusercontent.com/raw/rhboot/shim/pull/183.patch')
sha256sums=('473720200e6dae7cfd3ce7fb27c66367a8d6b08233fe63f01aa1d6b3888deeb6'
            'b2d2db78a77a4257a95acab9bcb1f1243e230a714748538c915c3173b41e0657')

prepare() {
    cd "shim-${pkgver}"
    
    # gcc9 fix
    # https://github.com/rhboot/shim/pull/183
    patch -Np1 -i "${srcdir}/${pkgname}-gcc9-fix.patch"
}

build() {
    cd "shim-${pkgver}"
    
    export EFI_PATH='/usr/lib'
    export ENABLE_HTTPBOOT='1'
    export ENABLE_SHIM_CERT='1'
    export OSLABEL='ARCH'
    
    make
}

package() {
    cd "shim-${pkgver}"
    
    make DESTDIR="$pkgdir" install-as-data
    
    install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
