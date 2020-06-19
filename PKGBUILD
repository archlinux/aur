# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=1.0.4111
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
sha256sums=('6ab40e3a4c709f1942db6232a4ea0d80736c391ea033c6540d0128cafd175e64'
            'e0dfa7756cf1ce5b24d1297f9cbeedacb9b6a99ff3a4d7ed5bbc3641c419c39c'
            '12d6812803168cfefb4d414decb99949a153ec50774e6ea972aa09e338c771cc'
            '3ececf144da3c0ae98b34787f955cf6828296cdbb77e588743f54c4fd927f986'
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
