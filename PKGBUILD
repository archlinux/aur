# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-bin
pkgver=24.13.29138.7
_gmmver=22.3.18
_gmmsover=12
_igcver=1.0.16510.2
_lzver="1.3.$(sed -E 's/([0-9]+\.){2}//' <<< "$pkgver")"
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
sha256sums=('2a4639f48d55f562d37f36af0baca42e78b833323429d2526871d5e75a197f63'
            '210c698a10ac6606720b058084089bb4579b5f2cc77f933ae8c1f82cc0da48a2'
            '4d0c1332dedaea7deaff2fd429fcfbb77a59eb66b1b9b6382dc06c3753bfb053'
            'e952d8aeccefdb46f2c037524cbb31ff164c197255e9762c35326c0e83b9f582'
            '987a002c6c9eb75290d9937735641ef4f4b670591ee79e1ac8edebe16a81872e')

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
    bsdtar -xf "gmmlib-dev-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "gmmlib-${pkgver}/data.tar.zst" -C "$pkgdir"
    mv "${pkgdir}/usr/lib/${CARCH}-linux-gnu"/* "${pkgdir}/usr/lib"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu.so"
    sed -i "s|/usr/lib/${CARCH}-linux-gnu|/usr/lib|" "${pkgdir}"/{etc/OpenCL/vendors/intel.icd,usr/lib/pkgconfig/igdgmm.pc}
    rm "${pkgdir}/usr/share/doc"/{intel-{level-zero-gpu,opencl-icd},libigdgmm{-dev,"$_gmmsover"}}/{changelog.gz,copyright}
}
