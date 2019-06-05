# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler-bin
pkgver=1.0.7
_build=2061
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
sha256sums=('2dc7f40dfb0a8db4149dddff5beee311fbeb323ec30d7a4c36babe4590ace433'
            'cd78ac42d6df4a65d34b68795fdafe8ae578995c98a739b30a2c0d3bc5169a4b'
            'f061cb229057338574cb77d8f7514cd13cc694d42f6779254b4f05dfa057f489'
            '5abee8a04d82ddf2cd3faf55920a4e3c490dcd48570c3208fc9c980c42951c91'
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
    
    rm "${pkgdir}/usr/bin/clang"
    
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
