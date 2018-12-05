# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=lzma_alone
pkgver=18.05
_srcver="${pkgver/./}"
pkgrel=2
pkgdesc='An algorithm used to perform lossless data compression'
arch=('i686' 'x86_64')
url='https://www.7-zip.org/sdk.html'
license=('custom')
depends=('gcc-libs')
source=("https://www.7-zip.org/a/lzma${_srcver}.7z")
noextract=("lzma${_srcver}.7z")
sha256sums=('d4ad382070d20edde117a8e544e7149ab6c84fdedd220aafe75454056a924732')

prepare() {
    mkdir -p "lzma-sdk-${pkgver}"
    
    cd "lzma-sdk-${pkgver}"
    
    bsdtar -x -f "${srcdir}/lzma${_srcver}.7z"
    
    # fix build: do not treat warnings as errors
    cd "${srcdir}/lzma-sdk-${pkgver}/CPP/7zip/Bundles/LzmaCon"
    sed -i '/CXX_C[[:space:]]=/s/[[:space:]]-Werror//' makefile.gcc
    
    # create a LICENSE file
    cd "${srcdir}/lzma-sdk-${pkgver}/DOC"
    sed -n '27,41p' lzma-sdk.txt > LICENSE
}

build() {
    cd "lzma-sdk-${pkgver}/CPP/7zip/Bundles/LzmaCon"
    
    make -f makefile.gcc
}

package() {
    cd lzma-sdk-"${pkgver}/CPP/7zip/Bundles/LzmaCon"
    install -D -m755 lzma "${pkgdir}/usr/bin/lzma_alone"
    
    cd "${srcdir}/lzma-sdk-${pkgver}/DOC"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
