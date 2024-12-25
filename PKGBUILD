# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lzma_alone
pkgver=24.09
pkgrel=1
pkgdesc='An algorithm used to perform lossless data compression'
arch=('x86_64')
url='https://www.7-zip.org/sdk.html'
license=('LZMA-SDK-9.22')
depends=('gcc-libs')
source=("https://www.7-zip.org/a/lzma${pkgver/./}.7z"
        '010-lzma_alone-use-arch-flags.patch')
noextract=("lzma${pkgver/./}.7z")
sha256sums=('79b39f10b7b69eea293caa90c3e7ea07faf8f01f8ae9db1bb1b90c092375e5f3'
            '8c1905241ce2d517b019b3101bab5e4994ca6864fe00b6ce303470adec66ed85')

prepare() {
    mkdir -p "lzma-sdk-${pkgver}"
    bsdtar -x -f "${srcdir}/lzma${pkgver/./}.7z" -C "lzma-sdk-${pkgver}"
    chmod 644 "lzma-sdk-${pkgver}/CPP/7zip/7zip_gcc.mak"
    patch -d "lzma-sdk-${pkgver}" --binary -Np1 -i "${srcdir}/010-lzma_alone-use-arch-flags.patch"
}

build() {
    make -C "lzma-sdk-${pkgver}/CPP/7zip/Bundles/LzmaCon" -f makefile.gcc
    
    # create a LICENSE file
    sed -n '27,41p' "lzma-sdk-${pkgver}/DOC/lzma-sdk.txt" > "lzma-sdk-${pkgver}/DOC/LICENSE"
}

package() {
    install -D -m755 "lzma-sdk-${pkgver}/CPP/7zip/Bundles/LzmaCon/_o/lzma" "${pkgdir}/usr/bin/lzma_alone"
    install -D -m644 "lzma-sdk-${pkgver}/DOC/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
