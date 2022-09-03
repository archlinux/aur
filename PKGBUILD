# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-bin
pkgver=22.35.24055
_gmmver=22.1.3
_gmmsover=12
_igcver=1.0.11702.1
_lzver="1.3.${pkgver##*.}"
pkgrel=1
pkgdesc='Intel Graphics Compute Runtime for oneAPI Level Zero and OpenCL Driver (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/compute-runtime/'
license=('MIT')
depends=("intel-graphics-compiler-bin=1:${_igcver}")
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
provides=('intel-compute-runtime' 'intel-gmmlib' 'level-zero-driver' 'opencl-driver')
conflicts=('intel-compute-runtime' 'intel-gmmlib')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-opencl-icd_${pkgver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-level-zero-gpu_${_lzver}_amd64.deb"
        "${pkgname}-${pkgver}-gmmlib-dev-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/libigdgmm-dev_${_gmmver}_amd64.deb"
        "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/libigdgmm${_gmmsover}_${_gmmver}_amd64.deb"
        'LICENSE')
noextract=("intel-opencl-icd_${pkgver}_amd64.deb"
           "intel-level-zero-gpu_${_lzver}_amd64.deb"
           "${pkgname}-${pkgver}-gmmlib-dev-${_gmmver}_amd64.deb"
           "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb")
sha256sums=('5df50599fa1969d14c6f564ca0fd99c28a623fa4a76a750270c0f3c4ffa6f661'
            '1ebc2938c7e9a4d0ab7407de7f76cab593a5c0ffd6f87d9ef800470321a401cf'
            '3e956cd368cbf1e59a254565c5b02d2df4686aaacf425b0d67eba222d6501569'
            '7b6378d9a760b5c93e835d862047d7c7841f6b6065e9bf2103b5b4134f2af2b5'
            'baaad465bdbb6ee44cf268f976e35cc50a8d35db268722b13e29c0624ed4e5b7')

prepare() {
    mkdir -p {opencl,level-zero-gpu,gmmlib{,-dev}}-"$pkgver"
    bsdtar -xf "intel-opencl-icd_${pkgver}_amd64.deb" -C "opencl-${pkgver}"
    bsdtar -xf "intel-level-zero-gpu_${_lzver}_amd64.deb" -C "level-zero-gpu-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-gmmlib-dev-${_gmmver}_amd64.deb" -C "gmmlib-dev-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb" -C "gmmlib-${pkgver}"
}

package() {
    bsdtar -xf "opencl-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "level-zero-gpu-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "gmmlib-dev-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "gmmlib-${pkgver}/data.tar.xz" -C "$pkgdir"
    mv "${pkgdir}/usr/lib/${CARCH}-linux-gnu"/* "${pkgdir}/usr/lib"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu.so"
    sed -i "s|/usr/lib/${CARCH}-linux-gnu|/usr/lib|" "${pkgdir}"/{etc/OpenCL/vendors/intel.icd,usr/lib/pkgconfig/igdgmm.pc}
    rm "${pkgdir}/usr/share/doc"/{intel-{level-zero-gpu,opencl-icd},libigdgmm{-dev,"$_gmmsover"}}/{changelog.gz,copyright}
    rm -r "${pkgdir}/var/lib/libze_intel_gpu"
}
