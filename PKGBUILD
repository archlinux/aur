# Maintainer: gilcu3
# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Facundo Tuesca <facutuesca at gmail dot com>

pkgname=k2pdfopt
pkgver=2.55
pkgrel=4
pkgdesc='Tool for optimizing PDF/DJVU files for mobile e-readers and smartphones.'
arch=('i686' 'x86_64')
url='http://www.willus.com/k2pdfopt'
license=('GPL3')
makedepends=('cmake')
depends=('libpng' 'libjpeg-turbo' 'djvulibre' 'libmupdf' 'mujs')
optdepends=('ghostscript: PostScript support'
            'jasper: JPEG 2000 bitmap support'
            'gsl: polynomial fit for spline interpolation feature'
            'leptonica: OCR support')
debian_2_55v3_patches='https://salsa.debian.org/yangfl-guest/k2pdfopt/-/raw/dbc5c01db8d3fdf4aefda7a80ff40e4dd48f0486/debian/patches/'
source=("${url}/src/${pkgname}_v${pkgver}_src.zip"
        "${debian_2_55v3_patches}/0001-CMakeLists.txt-add-missing-install-command.patch"
        "${debian_2_55v3_patches}/0002-CMakeLists.txt-do-not-detect-ghostscript-at-compile-.patch"
        "${debian_2_55v3_patches}/0003-CMakeLists.txt-use-system-mupdf.patch"
        "${debian_2_55v3_patches}/0004-CMakeLists.txt-use-system-gocr.patch"
        "${debian_2_55v3_patches}/0005-CMakeLists.txt-use-system-gsl.patch"
        "${debian_2_55v3_patches}/0006-k2pdfopt.h-dst_ocr_visibility_flags-workaround.patch"
        "${debian_2_55v3_patches}/0007-k2pdfoptlib-k2ocr.c-conditionally-enable-tesseract-r.patch"
        "${debian_2_55v3_patches}/0008-willuslib-CMakeLists.txt-typo.patch"
        "${debian_2_55v3_patches}/0009-willuslib-CMakeLists.txt-conditionally-add-source-fi.patch"
        "${debian_2_55v3_patches}/0010-willuslib-use-system-leptonica.patch"
        "${debian_2_55v3_patches}/0011-willuslib-use-system-djvu.patch"
        "jasper_header_path.patch"
        "disable_tesseract.patch"
        "fix_jasper_lib.patch"
        "mupdf.pc"
)

sha256sums=('3e78b4c7dd6227fde12138fd2468dd13c0c45b5251592a4f0aac67fd139ab953'
            '121c0f861958abbd8f70bfa1d07b10333c236cf748862158eacac8b2d810e48c'
            '6915c6e17f5e3c3f0ba331648cb05eb2ce44208c18aabb7d33bd71d6dfdf7e25'
            'b2a74c34cb876067a6bf8ba3150a5d782ee9b4269e49fddc6a0c015df4d7fe4c'
            '538c0e92ba929a9849372d3a20f039fe2605a67b3c9788d6068ac19568905e44'
            'ac84d99c041e19614c4bbc6e97c9dc4d36ecc74614c47b76c207cacb7e841ec7'
            '4a7cb136133651a94ed501b68daa59c89aa0704deaa824a44b2331c4af6d4450'
            'fd0dba9269a0882884f003846c4545b201790588c3388cebb55257eac3e9c0ff'
            '76fa11f22de8d81617b14e4cd258e11c4636bd02a82e2a2fe246e356e5834128'
            'c5215b13c9e56a70aa8c38cad03cc8c7a8c16f6adb0baa6c652db95d2ef141ad'
            '86d501b6050bef96d16141e4c169fe72ec84f4deefbb09e087f5ee7ea7c652b3'
            '329353f8ea2fbc1405969ee81c0539f1b05ce8e29d23348687f1a74cef7c3ff0'
            '205ffd746ce876e86824ce8d153ee72059fe830785cafa5cbe23ad39199aa6a8'
            '2b143e146bb7c41f1d178029a8354c292aacac25bf10108c9290039421374726'
            'd7b9a9881a5ef9533195c03e6ae08fb383bbdc5eca7f413c8ac127ac1800f6f2'
            '0beeb362290ddc5bf60638b5490b311630897d878e63412bc922b4457533b805')


prepare() {
    cd "${srcdir}/${pkgname}_v${pkgver}"
    for p in ../00*.patch; do
       patch -p1 <  "$p"
    done
    patch -p1 < ../jasper_header_path.patch
    patch -p1 < ../fix_jasper_lib.patch
    patch -p1 < ../disable_tesseract.patch
}

build() {
    cd "${srcdir}/${pkgname}_v${pkgver}"
    [ -d '_build' ] && rm -r '_build'
    mkdir '_build'
    cd '_build'
    PKG_CONFIG_PATH=../../ cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
    cmake  --build .
}

package() {
    cd "${srcdir}/${pkgname}_v${pkgver}"
    cd '_build'
    install -d "${pkgdir}/usr/bin"
    cmake --install .
}
