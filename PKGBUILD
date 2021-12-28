# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Facundo Tuesca <facutuesca at gmail dot com>

pkgname=k2pdfopt
pkgver=2.53
pkgrel=1
pkgdesc='Tool for optimizing PDF/DJVU files for mobile e-readers and smartphones.'
arch=('i686' 'x86_64')
url='http://www.willus.com/k2pdfopt'
license=('GPL3')
makedepends=('cmake')
depends=('libpng' 'libjpeg-turbo' 'djvulibre')
optdepends=('ghostscript: PostScript support'
            'jasper: JPEG 2000 bitmap support'
            'gsl: polynomial fit for spline interpolation feature'
            'leptonica: OCR support')
source=("${url}/src/${pkgname}_v${pkgver}_src.zip"
        'CMakeLists.txt.patch'
        'k2pdfoptlib.patch'
        'willuslib.patch')
sha256sums=('58c1b0647be5237570c110b0bb77eb78fab384282a2648edb59eac673070959b'
            '6569d3f15c288f1297ebc0f239a5d58bd3040e0521a22981a176d86b376cb6e3'
            '32db8cf1012b3626d397023c7ecd08b711136700bca9f37b18e056f4c367e392'
            'c0ae18681871385ab4b10a0c129661cf7318e2d86837c2d092c77fe362cb9512')

prepare() {
    cd "${srcdir}/${pkgname}_v${pkgver}"
    patch < ../CMakeLists.txt.patch
    patch -p2 < ../k2pdfoptlib.patch
    patch -p2 < ../willuslib.patch
}

build() {
    cd "${srcdir}/${pkgname}_v${pkgver}"
    [ -d '_build' ] && rm -r '_build'
    mkdir '_build'
    cd '_build'
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ..
    cmake --build .
}

package() {
    cd "${srcdir}/${pkgname}_v${pkgver}"
    cd '_build'
    install -d "${pkgdir}/usr/bin"
    cmake --install .
}
