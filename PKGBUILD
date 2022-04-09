# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-bin
pkgver=22.14.22890
_gmmver=22.0.2
_igcver=1.0.10840
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
        "${pkgname}-${pkgver}-gmmlib-devel-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-gmmlib-devel_${_gmmver}_amd64.deb"
        "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-gmmlib_${_gmmver}_amd64.deb"
        'LICENSE')
noextract=("intel-opencl-icd_${pkgver}_amd64.deb"
           "intel-level-zero-gpu_${_lzver}_amd64.deb"
           "${pkgname}-${pkgver}-gmmlib-devel-${_gmmver}_amd64.deb"
           "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb")
sha256sums=('a8e066e2b4110b894d97cd001847584d35fbc88722965ca262e46faef3fb537b'
            '668672a75a51bcd26bbaaf5a89a6bbec2c1a59a8a9df09ee76044b5bf154f874'
            '5d0d4105591f0cd8ba383edd419606a04df6b180a7811af2172936ac214d0b17'
            'a94459dda576f5b39b4deb942cfee7077700cb6fb9ea05119d509013f7f9a21b'
            '73783f7cd3b35aa7d23fa64e400c8c6a6cf6256b62b35e4827094719a9acb172')

prepare() {
    mkdir -p {opencl,level-zero-gpu,gmmlib{,-devel}}-"$pkgver"
    bsdtar -xf "intel-opencl-icd_${pkgver}_amd64.deb" -C "opencl-${pkgver}"
    bsdtar -xf "intel-level-zero-gpu_${_lzver}_amd64.deb" -C "level-zero-gpu-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-gmmlib-devel-${_gmmver}_amd64.deb" -C "gmmlib-devel-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb" -C "gmmlib-${pkgver}"
}

package() {
    bsdtar -xf "opencl-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "level-zero-gpu-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "gmmlib-devel-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "gmmlib-${pkgver}/data.tar.xz" -C "$pkgdir"
    mv "${pkgdir}/usr/local/include"/* "${pkgdir}/usr/include"
    mv "${pkgdir}/usr/local/lib"/* "${pkgdir}/usr/lib"
    mv "${pkgdir}/usr/lib/${CARCH}-linux-gnu"/* "${pkgdir}/usr/lib"
    chown -R root:root "$pkgdir"
    chmod -R o-w "$pkgdir"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu.so"
    sed -i "s|/usr/lib/${CARCH}-linux-gnu|/usr/lib|" "${pkgdir}/etc/OpenCL/vendors/intel.icd"
    sed -i 's|/usr/local|/usr|'  "${pkgdir}/usr/lib/pkgconfig/igdgmm.pc"
    rm "${pkgdir}/usr/share/doc"/intel-{level-zero-gpu,opencl-icd}/{changelog.gz,copyright}
    rm -r "${pkgdir}/var/lib/libze_intel_gpu"
}
