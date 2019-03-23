# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler-bin
pkgver=19.11.15884
_srcver="$(printf '%s' "$pkgver" | sed 's/\(\.\)\([0-9]*\)$/-\2/')"
_igcver=2019-03-12
pkgrel=2
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('gcc-libs' 'zlib')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/intel-graphics-compiler/releases/download/igc_release_${_igcver}/intel-igc-core_${_srcver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc_release_${_igcver}/intel-igc-media_${_srcver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc_release_${_igcver}/intel-igc-opencl-devel_${_srcver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc_release_${_igcver}/intel-igc-opencl_${_srcver}_amd64.deb"
        'LICENSE')
noextract=("intel-igc-core_${_srcver}_amd64.deb"
           "intel-igc-media_${_srcver}_amd64.deb"
           "intel-igc-opencl-devel_${_srcver}_amd64.deb"
           "intel-igc-opencl_${_srcver}_amd64.deb")
sha256sums=('44651972c6cc9f5af9b4fcdc568f9551e7c8a2d0dfe5f708a372b9223bb80183'
            '69141ecef44c95b96bb1094286e3ef4758e0b7f3d8c1deb032451e67448c2941'
            '15fc328e63f8eba3b01297fa4a374c31103c351b3e1b3380a69ff52d43955c94'
            'efbb969549d6c9b313b84c973160d0a56758e1704b75b100d3e566a010f393a2'
            '4099c7bc8a69e9e9c82f898e75870435cc0ca989a816a8ba6e38faabc88f0c36')

prepare() {
    mkdir -p igc-{core,media,opencl-devel,opencl}-"$pkgver"
    
    bsdtar -xf "intel-igc-core_${_srcver}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-media_${_srcver}_amd64.deb" -C "igc-media-${pkgver}"
    bsdtar -xf "intel-igc-opencl-devel_${_srcver}_amd64.deb" -C "igc-opencl-devel-${pkgver}"
    bsdtar -xf "intel-igc-opencl_${_srcver}_amd64.deb" -C "igc-opencl-${pkgver}"
}

package() {
    tar -zxf "igc-core-${pkgver}/data.tar.gz" -C "$pkgdir"
    tar -zxf "igc-media-${pkgver}/data.tar.gz" -C "$pkgdir"
    tar -zxf "igc-opencl-devel-${pkgver}/data.tar.gz" -C "$pkgdir"
    tar -zxf "igc-opencl-${pkgver}/data.tar.gz" -C "$pkgdir"
    
    mkdir -p "$pkgdir"/usr/{bin,include,lib}
    mv "$pkgdir"/usr/local/bin/*     "${pkgdir}/usr/bin"
    mv "$pkgdir"/usr/local/include/* "${pkgdir}/usr/include"
    mv "$pkgdir"/usr/local/lib/*     "${pkgdir}/usr/lib"
    
    rm "${pkgdir}/usr/lib/libopencl_clang.so"
    
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
