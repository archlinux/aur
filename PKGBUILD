# Maintainer: Timo Sarawinsi <tino@it-kraut.net>

pkgname=("php-pdlib")
_pkgbase=("pdlib")
pkgver=1.0.2
pkgrel=4
pkgdesc="PDlib - A PHP extension for Dlib"
arch=('x86_64')
url="https://github.com/goodspb/pdlib"
license=('MIT License')
depends=('dlib'
         'php'
         'libx11'
         'openblas'
	 'cblas'
         'lapack'
	 'libsm'
	 'libice'
         'libxext'
         'giflib4'
	 'libpng'
	 'zlib'
 	 'libjpeg-turbo'
	 'sqlite'
	 'fftw'
         )

makedepends=('cmake')
source=("https://github.com/goodspb/pdlib/archive/v$pkgver.tar.gz"
	"pdlib.ini"
	"php80.patch")
sha256sums=('e91a3c7396ee2027f957fa34fcc2567e614e4e1c1570ae7d5d16d4203541ba4a'
            'c325ddedc2e685f12119a0f4e8a1a45430a1ecb15368179f4c0c7153352b8a0e'
            'd4ee8f30d0d056e0f538f54117d54d458404e47d7e5217e448e6bdc75aba1d38')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    patch -p1 -i ../php80.patch
}

build() {
    unset LDFLAGS
    export CXXFLAGS="-O2 -I/usr/include/giflib4" 
    export LDFLAGS="-L/usr/lib/giflib4"
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    phpize
    ./configure --with-php-config=/usr/bin/php-config --with-libdir=/usr/lib/giflib4
    make
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make NO_INTERACTION=1 test
}

package_php-pdlib() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    install -Dm644 "modules/pdlib.so" "${pkgdir}/usr/lib/php/modules/pdlib.so"
    # install ini file
    install -Dm644 "../pdlib.ini" "${pkgdir}/etc/php/conf.d/pdlib.ini"
}

