# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler-bin
pkgver=1.0.3
_build=1844
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('gcc-libs' 'zlib')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler' 'intel-opencl-clang')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-core_${pkgver}-${_build}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-media_${pkgver}-${_build}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-opencl-devel_${pkgver}-${_build}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-opencl_${pkgver}-${_build}_amd64.deb"
        'LICENSE')
noextract=("intel-igc-core_${pkgver}-${_build}_amd64.deb"
           "intel-igc-media_${pkgver}-${_build}_amd64.deb"
           "intel-igc-opencl-devel_${pkgver}-${_build}_amd64.deb"
           "intel-igc-opencl_${pkgver}-${_build}_amd64.deb")
sha256sums=('9afd0e361a9098f04810fd66f451de11337e00e7e26dd9264702cfe7fe6ae371'
            '97bb0e91d6b852f1d89066a11cde5f5271b920ca732dc5d5bda4209f7f601082'
            'cced578c548474b2708363912d94dd3bd45f3dfedf5c8b0a36d79b729c81028d'
            'c687e3689b4bcb39ead2b101c4c050a8409b207a6d3f72ed4b369f7b43324127'
            '4099c7bc8a69e9e9c82f898e75870435cc0ca989a816a8ba6e38faabc88f0c36')

prepare() {
    mkdir -p igc-{core,media,opencl-devel,opencl}-"$pkgver"
    
    bsdtar -xf "intel-igc-core_${pkgver}-${_build}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-media_${pkgver}-${_build}_amd64.deb" -C "igc-media-${pkgver}"
    bsdtar -xf "intel-igc-opencl-devel_${pkgver}-${_build}_amd64.deb" -C "igc-opencl-devel-${pkgver}"
    bsdtar -xf "intel-igc-opencl_${pkgver}-${_build}_amd64.deb" -C "igc-opencl-${pkgver}"
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
    
    cd "${pkgdir}/usr/lib"
    rm libopencl-clang.so
    ln -sf libopencl-clang.so.? libopencl-clang.so
    
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
