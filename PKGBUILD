# Maintainer: gilcu3
# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Facundo Tuesca <facutuesca at gmail dot com>

pkgname=k2pdfopt
pkgver=2.55
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
debian_2_55v2_patches='https://salsa.debian.org/yangfl-guest/k2pdfopt/-/raw/06d32c78ad4e816f08cf9054aab09773a6f984a4/debian/patches/'
source=("${url}/src/${pkgname}_v${pkgver}_src.zip"
        "${debian_2_55v2_patches}/0001-CMakeLists.txt-add-missing-install-command.patch"
        "${debian_2_55v2_patches}/0002-CMakeLists.txt-no-mupdf.patch"
        "${debian_2_55v2_patches}/0003-CMakeLists.txt-do-not-detect-ghostscript-at-compile-.patch"
        "${debian_2_55v2_patches}/0004-willuslib-CMakeLists.txt-typo.patch"
        "${debian_2_55v2_patches}/0005-willuslib-use-system-leptonica.patch"
        "${debian_2_55v2_patches}/0006-k2pdfopt.h-dst_ocr_visibility_flags-workaround.patch"
        "${debian_2_55v2_patches}/0007-k2pdfoptlib-k2ocr.c-conditionally-enable-tesseract-r.patch"
        "${debian_2_55v2_patches}/0008-willuslib-gslpolyfit.c-use-system-gsl.patch"
        "${debian_2_55v2_patches}/0009-CMakeLists.txt-use-system-gocr.patch"
        "${debian_2_55v2_patches}/0010-willuslib-use-system-djvu.patch"
        "${debian_2_55v2_patches}/0011-willuslib-pdfwrite.c-workaround-buggy-PDF-page-count.patch"
        "${debian_2_55v2_patches}/0012-willuslib-CMakeLists.txt-conditionally-add-source-fi.patch"
        "jasper_header_path.patch"
        "disable_tesseract.patch"
        "fix_jasper_lib.patch"
        "fix_ocrtess.patch"
)

sha256sums=('3e78b4c7dd6227fde12138fd2468dd13c0c45b5251592a4f0aac67fd139ab953'
            '6d1990072a2a2a01fcaaba57f74c04ebc6a9fed39f25747a5115670d73449967'
            '5944aac480e760d2fad22809b359a43c42adf2efcc9ab13750bf3a6c2ded20db'
            'b2bc0adf903f27952b8dfe31d452bf7d447950346eb33c6f5f8ea54bad0da078'
            'a0be0e8f03346a57ef20d532e782fd57bdf95bbb2296096cbabed8bea547bc6b'
            '0905388d455b928a40e798b5c584382f48f6789c9556fe70ac9dac0885252179'
            '6349e5c69356169afcd57d7477737111e621d4cb95f3030f2cfbe00ba7a3fcae'
            '9eccab9a016c53dba4eeacea045c59ea0bfed8aec715303dc1d49fdcd74120cc'
            '041394dd4da0a9c166e34ca0b9aea7288b10874c89937b0f62ba6c69a1ba0159'
            'b98a65ffb2d68582e2c0741f5889fe319f8d41584334d7691c7ef56e98034fed'
            '1b39c0cbddd6997948af302bcbed34e75ef2e6c5946a1b961c3e3a558a22115d'
            'dcf8e7aebebdb43aea371b951b46c04cca87f23f9b920d275e5aec419d9ef313'
            'e8b44fd98554a568ddd41fc5eed9c4f7b907c3386293e98e49e5654673812c0d'
            '707a56d36c2e2468e0c0543d32bad5b631c248a429f206f24793432cc6a4e05c'
            'ad9e3c00339f8a241af1b84a7776fb4beb9dfe15bda139c30972bc030a98cb68'
            'd7b9a9881a5ef9533195c03e6ae08fb383bbdc5eca7f413c8ac127ac1800f6f2'
            'f0e60da8d3f335ea3a0c6fcf3814325ed3eec136dcd1fd2886e6fb98f8384069')


prepare() {
    cd "${srcdir}/${pkgname}_v${pkgver}"
    for p in ../00*.patch; do
       patch -p1 <  "$p"
    done
    patch -p1 < ../jasper_header_path.patch
    patch -p1 < ../disable_tesseract.patch
    patch -p1 < ../fix_jasper_lib.patch
    patch -p1 < ../fix_ocrtess.patch
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
