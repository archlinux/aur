# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=lzma_alone
pkgver=19.00
_srcver="${pkgver/./}"
pkgrel=1
pkgdesc='An algorithm used to perform lossless data compression'
arch=('i686' 'x86_64')
url='https://www.7-zip.org/sdk.html'
license=('custom')
depends=('gcc-libs')
source=("https://www.7-zip.org/a/lzma${_srcver}.7z"
        'lzma_alone-001-use-arch-flags.patch'
        'lzma_alone-002-remove-werror.patch')
noextract=("lzma${_srcver}.7z")
sha256sums=('00f569e624b3d9ed89cf8d40136662c4c5207eaceb92a70b1044c77f84234bad'
            '33e256857f435e9e69bb2e2bd24e75cc3d693ebdcdfd980002e2ed2ffed85a6e'
            '99d654a3bd69b7a24191e11dbbe0d8f0c2c4d15781bdb4dbba98c43f8d769b67')

prepare() {
    mkdir -p "lzma-sdk-${pkgver}"
    cd "lzma-sdk-${pkgver}"
    bsdtar -x -f "${srcdir}/lzma${_srcver}.7z"
    
    chmod 644 CPP/7zip/Bundles/LzmaCon/makefile.gcc
    patch -Np1 -i "${srcdir}/lzma_alone-001-use-arch-flags.patch"
    patch -Np1 -i "${srcdir}/lzma_alone-002-remove-werror.patch"
    
    # create a LICENSE file
    sed -n '27,41p' DOC/lzma-sdk.txt > DOC/LICENSE
}

build() {
    cd "lzma-sdk-${pkgver}/CPP/7zip/Bundles/LzmaCon"
    
    make -f makefile.gcc
}

package() {
    cd "lzma-sdk-${pkgver}"
    
    install -D -m755 CPP/7zip/Bundles/LzmaCon/lzma "${pkgdir}/usr/bin/lzma_alone"
    
    install -D -m644 DOC/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
