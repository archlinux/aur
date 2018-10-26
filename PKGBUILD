# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=kvazaar
pkgver=1.2.0
pkgrel=6
pkgdesc='An open-source HEVC encoder'
arch=('i686' 'x86_64')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('LGPL')
depends=('glibc' 'gcc-libs' 'crypto++')
makedepends=('yasm')
provides=('libkvazaar.so')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ultravideo/kvazaar/archive/v${pkgver}.tar.gz"
        'kvazaar-crypto++6.0.0.patch')
sha256sums=('480ecfd9b4d2b7d21b355e4a35fcf47b4db7a3b0315b6219d93733db42392bd9'
            '02396099561b9c87462420ee6b16706237c7502938c1b3ab9fc3797ea2ec568a')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    patch -Np1 -i "${srcdir}/kvazaar-crypto++6.0.0.patch"
    
    ./autogen.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure \
        --prefix='/usr' \
        --enable-largefile \
        --enable-static='no' \
        --enable-shared='yes' \
        --enable-fast-install='yes' \
        --with-cryptopp
        
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
