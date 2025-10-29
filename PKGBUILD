# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-bin
pkgver=25.40.35563.4
_gmmver=22.8.2
_gmmsover=12
_igcver=2.20.3
_lzsover=1
_build=0
pkgrel=1
pkgdesc='Intel Graphics Compute Runtime for oneAPI Level Zero and OpenCL Driver (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/compute-runtime/'
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    "intel-graphics-compiler-bin=1:${_igcver}")
optdepends=(
    'libdrm: for cl_intel_va_api_media_sharing'
    'libva: for cl_intel_va_api_media_sharing')
provides=('intel-compute-runtime' 'intel-gmmlib' 'level-zero-driver' 'opencl-driver')
conflicts=('intel-compute-runtime' 'intel-gmmlib')
options=('!debug' '!emptydirs' '!strip')
source=("https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-ocloc_${pkgver}-${_build}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-opencl-icd_${pkgver}-${_build}_amd64.deb"
        "${pkgname}-${pkgver}-level-zero-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/libze-intel-gpu${_lzsover}_${pkgver}-${_build}_amd64.deb"
        "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/libigdgmm${_gmmsover}_${_gmmver}_amd64.deb"
        'LICENSE')
noextract=("intel-ocloc_${pkgver}-${_build}_amd64.deb"
           "intel-opencl-icd_${pkgver}-${_build}_amd64.deb"
           "${pkgname}-${pkgver}-level-zero-${_gmmver}_amd64.deb"
           "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb")
sha256sums=('f37a4817a2f69987e9c66cee50b46e7a29e921d74983a6dd86bcd072ee8d75fa'
            'a31996872b89cacf44fb0a777278fde23cba6a6246eaf1d847a11af017d77e8a'
            '57d3ece3a0ad12aa53fd8750c82307d7d01c544d98a2398d3622a65cec987eee'
            'fa66d2debfb5674bccdf26795d8903019aa5ef65a9c179059b72c8e964d69f58'
            '987a002c6c9eb75290d9937735641ef4f4b670591ee79e1ac8edebe16a81872e')

prepare() {
    mkdir -p {ocloc,opencl,level-zero-gpu,gmmlib}-"$pkgver"
    bsdtar -xf "intel-ocloc_${pkgver}-${_build}_amd64.deb" -C "ocloc-${pkgver}"
    bsdtar -xf "intel-opencl-icd_${pkgver}-${_build}_amd64.deb" -C "opencl-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-level-zero-${_gmmver}_amd64.deb" -C "level-zero-gpu-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb" -C "gmmlib-${pkgver}"
}

package() {
    bsdtar -xf "ocloc-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "opencl-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "level-zero-gpu-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "gmmlib-${pkgver}/data.tar.zst" -C "$pkgdir"
    mv "${pkgdir}/usr/lib/${CARCH}-linux-gnu"/* "${pkgdir}/usr/lib"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu.so"
    ln -s "$(find "${pkgdir}"/usr/bin -name 'ocloc-*' -exec basename {} \;)" "${pkgdir}/usr/bin/ocloc"
    sed -i "s|/usr/lib/${CARCH}-linux-gnu|/usr/lib|" "${pkgdir}/etc/OpenCL/vendors/intel.icd"
    rm "${pkgdir}/usr/share/doc"/{intel-{ocloc,opencl-icd},libze-intel-"gpu${_lzsover}"}/{changelog.Debian.gz,copyright}
    rm "${pkgdir}/usr/share/doc/libigdgmm${_gmmsover}"/{changelog.gz,copyright}
}
