# Maintainer: Timo Sarawinsi <tino@it-kraut.net>

pkgname=("php-pdlib")
_pkgbase=("pdlib")
pkgver=1.1.0
pkgrel=3
pkgdesc="PDlib - A PHP extension for Dlib"
arch=('x86_64')
url="https://github.com/goodspb/pdlib"
license=('MIT License')
depends=('dlib'
         'php'
         'libx11'
         'openblas'
         'openblas64'
	 'cblas'
	 'cblas64'
         'lapack'
         'lapack64'
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
	"pdlib.ini")
sha256sums=('6c255c07dfb70d34019faecd99160d03846c83925452c9e93d5606edc8d55803'
            'c325ddedc2e685f12119a0f4e8a1a45430a1ecb15368179f4c0c7153352b8a0e')

build() {
    #unset LDFLAGS
    export CXXFLAGS="-O2 -I/usr/include/giflib4"
    export LDFLAGS="-L/usr/lib/giflib4"
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    phpize
    ./configure --enable-debug --with-php-config=/usr/bin/php-config --with-libdir=/usr/lib/giflib4
    make
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make NO_INTERACTION=1 test
}

package_php-pdlib() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    install -Dm744 "modules/pdlib.so" "${pkgdir}/usr/lib/php/modules/pdlib.so"
    # install ini file
    install -Dm644 "../pdlib.ini" "${pkgdir}/etc/php/conf.d/pdlib.ini"
}

