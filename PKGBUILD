# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=openvx
pkgver=1.1
pkgrel=2
pkgdesc='An open, royalty-free standard for cross platform acceleration of computer vision applications'
arch=('i686' 'x86_64')
url='https://www.khronos.org/openvx/'
license=('MIT')
makedepends=('cmake' 'python2')
provides=('libopenvx.so' 'libvxu.so')
source=("https://www.khronos.org/registry/OpenVX/sample/openvx_sample_${pkgver}.tar.bz2"
        "${pkgname}.pc")
noextract=("openvx_sample_${pkgver}.tar.bz2")
sha256sums=('cebda8a6a4802d7f56cb618bc12e7cd3333aa1d9a5a3259e7250e24163bb0c01'
            'e4c665b8ee74f8618ff46ad36e1f515c5ff2fb4d5e610ff43b0b69f1a3338714')

prepare() {
    # extract source file to a directory in the format ${pkgname}-${pkgver}
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    tar xf ../"openvx_sample_${pkgver}.tar.bz2" --strip 1
    
    # fix: CMakeLists uses a non existing directory in the source tree
    sed -i 's/^add_subdirectory( sample-c++ )/#add_subdirectory( sample-c++ )/' CMakeLists.txt
}

build() {
    cd "${pkgname}-${pkgver}"
    
    [ "$CARCH" = 'x86_64' ] && _architecture='64'
    [ "$CARCH" = 'i686'   ] && _architecture='32'
    
    python2 Build.py \
        --os='Linux' \
        --arch="$_architecture" \
        --conf='Release' \
        --gen='Unix Makefiles' \
        --build='True' \
        --opencl='False' \
        --openmp='True' \
        --package='False'
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
