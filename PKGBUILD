# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Johannes Dewender <arch@JonnyJD.net>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbasename=schroedinger
pkgname=lib32-"$_pkgbasename"
pkgver=1.0.11
pkgrel=4
pkgdesc='An implemenation of the Dirac video codec in ANSI C code (32 bit)'
arch=('x86_64')
url='https://launchpad.net/schroedinger/'
license=('GPL2' 'LGPL2.1' 'MPL' 'MIT')
depends=('lib32-gcc-libs' 'lib32-orc' "$_pkgbasename")
source=("https://launchpad.net/schroedinger/trunk/${pkgver}/+download//${_pkgbasename}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('9456AFC0814A8139E99483517FE6B095B582B0D4') # Timothy Gu
sha256sums=('1e572a0735b92aca5746c4528f9bebd35aa0ccf8619b22fa2756137a8cc9f912'
            'SKIP')

build() {
    cd "${_pkgbasename}-${pkgver}"
    
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
    ./configure \
        --prefix='/usr' \
        --libdir='/usr/lib32' \
        --enable-shared='yes' \
        --enable-encoder \
        --enable-motion-ref \
        --with-thread='auto'
        
    make
}

package() {
    cd "${_pkgbasename}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    rm -r "$pkgdir"/usr/{include,share}
    
    install -D -m644 COPYING.MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
