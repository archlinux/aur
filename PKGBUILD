# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=flif
_srcname=FLIF
pkgver=0.3
pkgrel=4
pkgdesc='Free Lossless Image Format'
arch=('i686' 'x86_64')
url='https://github.com/FLIF-hub/FLIF/'
license=('LGPL3' 'APACHE')
depends=('gcc-libs' 'libpng' 'sdl2')
optdepends=(
    # official repositories:
        'imagemagick: for gif2flif tool'
    # AUR:
        'apng-utils: for apng2flif tool'
)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/FLIF-hub/FLIF/archive/v${pkgver}.tar.gz"
        'flif-use-build-flags.patch')
sha256sums=('aa02a62974d78f8109cff21ecb6d805f1d23b05b2db7189cfdf1f0d97ff89498'
            'd8cdb93f4f1e63487d65d23c1c96bf79acff1277532cbcfd88ca05932655d871')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    # use build flags
    patch -Np1 -i "${srcdir}/flif-use-build-flags.patch"
    
    # remove apt-get references from installed tools
    cd tools
    sed -i '/apt-get/d' gif2flif apng2flif
}

build() {
    cd "${_srcname}-${pkgver}/src"
    
    make all decoder viewflif
    
}

package() {
    cd "${_srcname}-${pkgver}/src"
    
    make PREFIX="${pkgdir}/usr" install{,-dev,-decoder,-viewflif}
}
