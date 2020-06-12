# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=1.0.4062
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('intel-opencl-clang' 'zlib')
provides=('intel-graphics-compiler')
conflicts=('intel-graphics-compiler')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-core_${pkgver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-media_${pkgver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-opencl-devel_${pkgver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-opencl_${pkgver}_amd64.deb"
        'LICENSE')
noextract=("intel-igc-core_${pkgver}_amd64.deb"
           "intel-igc-media_${pkgver}_amd64.deb"
           "intel-igc-opencl-devel_${pkgver}_amd64.deb"
           "intel-igc-opencl_${pkgver}_amd64.deb")
sha256sums=('bf69f19fda470f5e2c1f5f40da4a3dda3df5f961d315dcdc5ecfe13b3e02e0df'
            '8a624b3241d5ce625b41d3474b643d8b33a0253d5021a28e633ae1bab3347365'
            '80c912437f7c6a91f3e5da36894bc627e00bf1d018ede5ce01a54ea4337c347d'
            '7e3619e53b619f92fd470f0517380bf58542855f8728940f33dc6a7240ab4fe9'
            '8c95643f47a244153bef1c2d3a2801dde2b566f0294aae956c8a5226f7acd789')

prepare() {
    mkdir -p igc-{core,media,opencl-devel,opencl}-"$pkgver"
    bsdtar -xf "intel-igc-core_${pkgver}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-media_${pkgver}_amd64.deb" -C "igc-media-${pkgver}"
    bsdtar -xf "intel-igc-opencl-devel_${pkgver}_amd64.deb" -C "igc-opencl-devel-${pkgver}"
    bsdtar -xf "intel-igc-opencl_${pkgver}_amd64.deb" -C "igc-opencl-${pkgver}"
}

package() {
    bsdtar -xf "igc-core-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-media-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-devel-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-${pkgver}/data.tar.gz" -C "$pkgdir"
    mv "${pkgdir}/usr/local/"{bin,include,lib} "${pkgdir}/usr"
    rm "${pkgdir}/usr/"{include/{opencl-c-base.h,opencl-c.h},lib/libopencl-clang.so*}
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
