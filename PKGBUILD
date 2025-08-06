# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-legacy-bin
pkgver=24.35.30872.36
_gmmver=22.5.0
_gmmsover=12
_igcver=1.0.17537.24
_lzver="1.5.$(sed -E 's/([0-9]+\.){2}//' <<< "$pkgver")"
pkgrel=1
pkgdesc='Intel Graphics Compute Runtime for oneAPI Level Zero and OpenCL Driver (legacy platforms; pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/compute-runtime/'
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    "intel-graphics-compiler-legacy-bin=${_igcver}")
optdepends=(
    'libdrm: for cl_intel_va_api_media_sharing'
    'libva: for cl_intel_va_api_media_sharing')
provides=(
    "intel-compute-runtime=${pkgver}"
    "intel-compute-runtime-legacy=${pkgver}"
    "intel-gmmlib=${_gmmver}"
    "intel-gmmlib-legacy=${_gmmver}"
    'level-zero-driver'
    'opencl-driver')
conflicts=(
    'intel-compute-runtime'
    'intel-gmmlib')
options=('!debug' '!emptydirs' '!strip')
source=("https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-opencl-icd-legacy1_${pkgver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-level-zero-gpu-legacy1_${_lzver}_amd64.deb"
        "${pkgname}-${pkgver}-gmmlib-dev-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/libigdgmm-dev_${_gmmver}_amd64.deb"
        "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb"::"https://github.com/intel/compute-runtime/releases/download/${pkgver}/libigdgmm${_gmmsover}_${_gmmver}_amd64.deb"
        'LICENSE')
noextract=("intel-opencl-icd-legacy1_${pkgver}_amd64.deb"
           "intel-level-zero-gpu-legacy1_${_lzver}_amd64.deb"
           "${pkgname}-${pkgver}-gmmlib-dev-${_gmmver}_amd64.deb"
           "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb")
sha256sums=('bbe71e4f414259e06a10cde72c29a2bd78d41b2bb2f6f8463b1806797fe66e85'
            '40dfbd15ab62de036a00824b304a2aa1fa2d81ad60ef83da09cfe3c5a80c429f'
            'ca634ce51a9cac35010f363d34f84449ef1f20480ce6243920a80656754de932'
            'cc29d14df83cff1b3c6a66baa39257f0211b168ab43a99c2dc62a3734431bc23'
            '987a002c6c9eb75290d9937735641ef4f4b670591ee79e1ac8edebe16a81872e')

prepare() {
    mkdir -p {opencl,level-zero-gpu,gmmlib{,-dev}}-"$pkgver"
    bsdtar -xf "intel-opencl-icd-legacy1_${pkgver}_amd64.deb" -C "opencl-${pkgver}"
    bsdtar -xf "intel-level-zero-gpu-legacy1_${_lzver}_amd64.deb" -C "level-zero-gpu-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-gmmlib-dev-${_gmmver}_amd64.deb" -C "gmmlib-dev-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}-gmmlib-${_gmmver}_amd64.deb" -C "gmmlib-${pkgver}"
}

package() {
    bsdtar -xf "opencl-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "level-zero-gpu-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "gmmlib-dev-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "gmmlib-${pkgver}/data.tar.zst" -C "$pkgdir"
    mv "${pkgdir}/usr/lib/${CARCH}-linux-gnu"/* "${pkgdir}/usr/lib"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu_legacy1.so.[0-9]*' -exec basename {} \;)" "${pkgdir}/usr/lib/libze_intel_gpu_legacy1.so"
    ln -s "$(find "${pkgdir}"/usr/bin -name 'ocloc-*' -exec basename {} \;)" "${pkgdir}/usr/bin/ocloc"
    sed -i "s|/usr/lib/${CARCH}-linux-gnu|/usr/lib|" "${pkgdir}"/{etc/OpenCL/vendors/intel_legacy1.icd,usr/lib/pkgconfig/igdgmm.pc}
    rm "${pkgdir}/usr/share/doc"/{intel-{level-zero-gpu,opencl-icd}-legacy1,libigdgmm{-dev,"$_gmmsover"}}/{changelog.gz,copyright}
}
