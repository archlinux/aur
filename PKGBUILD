# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lzma_alone
pkgver=19.00
pkgrel=2
pkgdesc='An algorithm used to perform lossless data compression'
arch=('x86_64')
url='https://www.7-zip.org/sdk.html'
license=('custom')
depends=('gcc-libs')
source=("https://www.7-zip.org/a/lzma${pkgver/./}.7z"
        '010-lzma_alone-use-arch-flags.patch'
        '020-lzma_alone-remove-werror.patch')
noextract=("lzma${pkgver/./}.7z")
sha256sums=('00f569e624b3d9ed89cf8d40136662c4c5207eaceb92a70b1044c77f84234bad'
            '33e256857f435e9e69bb2e2bd24e75cc3d693ebdcdfd980002e2ed2ffed85a6e'
            '99d654a3bd69b7a24191e11dbbe0d8f0c2c4d15781bdb4dbba98c43f8d769b67')

prepare() {
    mkdir -p "lzma-sdk-${pkgver}"
    bsdtar -x -f "${srcdir}/lzma${pkgver/./}.7z" -C "lzma-sdk-${pkgver}"
    chmod 644 "lzma-sdk-${pkgver}/CPP/7zip/Bundles/LzmaCon/makefile.gcc"
    patch -d "lzma-sdk-${pkgver}" -Np1 -i "${srcdir}/010-lzma_alone-use-arch-flags.patch"
    patch -d "lzma-sdk-${pkgver}" -Np1 -i "${srcdir}/020-lzma_alone-remove-werror.patch"
}

build() {
    make -C "lzma-sdk-${pkgver}/CPP/7zip/Bundles/LzmaCon" -f makefile.gcc
    
    # create a LICENSE file
    sed -n '27,41p' "lzma-sdk-${pkgver}/DOC/lzma-sdk.txt" > "lzma-sdk-${pkgver}/DOC/LICENSE"
}

package() {
    install -D -m755 "lzma-sdk-${pkgver}/CPP/7zip/Bundles/LzmaCon/lzma" "${pkgdir}/usr/bin/lzma_alone"
    install -D -m644 "lzma-sdk-${pkgver}/DOC/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
