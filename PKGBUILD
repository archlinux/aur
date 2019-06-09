# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=hm
pkgver=16.20
_rev=4994
pkgrel=1
pkgdesc='HEVC Test Model - the reference software for HEVC'
arch=('x86_64')
url='https://hevc.hhi.fraunhofer.de/'
license=('BSD')
depends=('gcc-libs')
makedepends=('nasm')
source=("${pkgname}-${pkgver}.zip"::"https://hevc.hhi.fraunhofer.de/trac/hevc/browser/tags/HM-${pkgver}?rev=${_rev}&format=zip"
        '0001-hm-fix-build-with-gcc8.patch'
        '0002-hm-use-arch-flags.patch')
sha256sums=('021ac73a08c23c4053f08636d3a435a1da02a56066f9f6e4710a7afadc154a9e'
            '1fc52f8507902c7ee315bb7fbe42914dd4b0b49251d237b2e024e6e776ba02c3'
            'da19d17edfb2acac3feaedaf8169d84da3b6675de4c70b32d9a3d3144b9fc59f')

prepare() {
    cd "HM-${pkgver}"
    
    # fix build with gcc8 (do not treat warnings as errors)
    patch -Np1 -i "${srcdir}/0001-hm-fix-build-with-gcc8.patch"
    
    # use Arch build flags (add full relro and other improvements)
    patch -Np1 -i "${srcdir}/0002-hm-use-arch-flags.patch"
}

build() {
    cd "HM-${pkgver}/build/linux"
    
    # may randomly fail with multiple jobs
    make -j1 -f makefile release{,_highbitdepth}
}

package() {
    cd "HM-${pkgver}"
    
    install -D -m755 bin/*     -t "${pkgdir}/usr/bin"
    install -D -m644 README    -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 doc/*.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 COPYING      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
