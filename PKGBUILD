# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler-bin
pkgver=1.0.8
_build=2114
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
sha256sums=('9ca0ab7629c21f247fe78774a91dee43b410f4e1b463871066388bf59dc39e31'
            '0c8dd387adcba6e41e189df1404200c5ef1dbaf3701fe6b2830d3b60eb32295a'
            '79c0f7a66819bbe4e0e1d9025143285a3289c0093225d3e45b9c24211d3c0de1'
            'bf8b6b4f42f86596e9cfaaaa735c7ca5abe8935cd42725b0b97f266c5773423c'
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
