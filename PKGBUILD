# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-bin
pkgver=25.44.36015.5
_gmmver=22.8.2
_gmmsover=12
_igcver=2.22.2
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
sha256sums=('3a8a4914e9ee88f229382424a5de217e181bee81f450d2037fa024a2932456e0'
            'eb4110d993af4a3cfea738cc2ef36d7f7269174e7ab402540faa9c95331f2ead'
            'd1eac4a7af59623289032548440eb8c50eb6dd073c70016b6048dd1f56dccfc3'
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
