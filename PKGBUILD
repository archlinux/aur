# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=openvx
pkgver=1.2
pkgrel=2
pkgdesc='An open, royalty-free standard for cross platform acceleration of computer vision applications'
arch=('x86_64')
url='https://www.khronos.org/openvx/'
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'python')
source=("https://www.khronos.org/registry/OpenVX/sample/openvx_sample_${pkgver}.tar.bz2"
        'openvx-add-full-relro.patch'
        'openvx.pc')
noextract=("openvx_sample_${pkgver}.tar.bz2")
sha256sums=('8f61203572668f7719bc9f86bc24ca06c51a98531ca7941264bd7cbbaa7b9aaa'
            '1f85fb4b4729bf59ae8bf8a251991d52faac4d216e41937bd6c0d48a41f0b946'
            '92c695748c9be151c5eca9fc61da742fc391b45a623fb851ac56b80b5ab6cd40')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    
    # extract source file to a directory in the format ${pkgname}-${pkgver}
    tar xf ../"openvx_sample_${pkgver}.tar.bz2" --strip 1
    
    # add full relro
    patch -Np1 -i "${srcdir}/openvx-add-full-relro.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    
    python Build.py \
        --os='Linux' \
        --arch='64' \
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
    # headers
    mkdir -p "${pkgdir}/usr/include"
    cd "${pkgname}-${pkgver}/install/Linux/x64/Release/include"
    cp -a * "${pkgdir}/usr/include"
    
    # libraries
    cd "${srcdir}/${pkgname}-${pkgver}/install/Linux/x64/Release/bin"
    install -D -m755 *.so* -t "${pkgdir}/usr/lib"
    
    # pkgconfig
    install -D -m644 "${srcdir}/${pkgname}.pc" -t "${pkgdir}/usr/lib/pkgconfig"
    
    # license
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
