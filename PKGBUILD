# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=openvx
pkgver=1.2
pkgrel=1
pkgdesc='An open, royalty-free standard for cross platform acceleration of computer vision applications'
arch=('i686' 'x86_64')
url='https://www.khronos.org/openvx/'
license=('APACHE')
depends=('gcc-libs')
makedepends=('cmake' 'python')
provides=('libopenvx.so' 'libvxu.so')
source=("https://www.khronos.org/registry/OpenVX/sample/openvx_sample_${pkgver}.tar.bz2"
        "${pkgname}.pc")
noextract=("openvx_sample_${pkgver}.tar.bz2")
sha256sums=('8f61203572668f7719bc9f86bc24ca06c51a98531ca7941264bd7cbbaa7b9aaa'
            '92c695748c9be151c5eca9fc61da742fc391b45a623fb851ac56b80b5ab6cd40')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    
    # extract source file to a directory in the format ${pkgname}-${pkgver}
    tar xf ../"openvx_sample_${pkgver}.tar.bz2" --strip 1
}

build() {
    cd "${pkgname}-${pkgver}"
    
    [ "$CARCH" = 'x86_64' ] && _architecture='64'
    [ "$CARCH" = 'i686'   ] && _architecture='32'
    
    python Build.py \
        --os='Linux' \
        --arch="$_architecture" \
        --conf='Release' \
        --gen='Unix Makefiles' \
        --build='True' \
        --dump_commands \
        --ix \
        --nn \
        --tiling \
        --s16 \
        --openmp
}

package() {
    [ "$CARCH" = 'x86_64' ] && _architecture='x64'
    [ "$CARCH" = 'i686'   ] && _architecture='x32'
    
    # directories creation
    mkdir -p "${pkgdir}/usr/"{include/VX,lib}
    
    # includes
    cd "${pkgname}-${pkgver}/install/Linux/${_architecture}/Release/include/VX"
    install -m644 * "${pkgdir}/usr/include/VX"
    
    # libraries
    cd "${srcdir}/${pkgname}-${pkgver}/install/Linux/${_architecture}/Release/bin"
    install -m755 *.so "${pkgdir}/usr/lib"
    
    # pkgconfig
    cd "$srcdir"
    install -D -m644 "${pkgname}.pc" "${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc"
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
