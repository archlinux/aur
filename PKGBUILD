# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler-bin
pkgver=19.12.1681
_srcver='1.0-0'
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('gcc-libs' 'zlib')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-core_${_srcver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-media_${_srcver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-opencl-devel_${_srcver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-opencl_${_srcver}_amd64.deb"
        'LICENSE')
noextract=("intel-igc-core_${_srcver}_amd64.deb"
           "intel-igc-media_${_srcver}_amd64.deb"
           "intel-igc-opencl-devel_${_srcver}_amd64.deb"
           "intel-igc-opencl_${_srcver}_amd64.deb")
sha256sums=('ac81f3f7531875774d00057d65776bf4c8ecc41e58720d22a1cb3695abf048d6'
            'dd94d41ebfc149499616f9784e645914f6b0b0996266b6d427201bfe50b78d19'
            'a9991c633b154fccd15184e31b8ead92786aeefd4dad4d60665a60348cab9d9d'
            '9589d54101982bccddcbcaf59b59cf04aba4e7980769dc5671ec584bdac36441'
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
