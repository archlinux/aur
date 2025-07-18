# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-bin
pkgver=25.27.34303.5
_gmmver=22.7.2
_gmmsover=12
_igcver=2.14.1
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
sha256sums=('49f88c7d6a985ef94544261755b01dc6dba169e4c534e06bfe77f186c068774c'
            'e46499fd7fa0a056759b52425b6ba28e5aa6734ff46bcd1e1f8541c5efc2e0b3'
            '4e08d3796c856505c852f8700f44b7895cd185c48e83ebc5785d9744b6003546'
            '68f9e6c79c298bf75a80253adef2e84bf0011dc3e70db3e72daa7e4ad46f95cf'
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
