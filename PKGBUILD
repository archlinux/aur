# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-bin
pkgver=21.18.19737
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compute Runtime for oneAPI Level Zero and OpenCL Driver (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/compute-runtime/'
license=('MIT')
depends=('intel-graphics-compiler-bin')
provides=('intel-compute-runtime' 'level-zero-driver' 'opencl-driver')
conflicts=('intel-compute-runtime' 'intel-gmmlib')
options=('!strip' '!emptydirs')
_lzver=1.1.19737
_gmmver=21.1.2
source=("https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-opencl_${pkgver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-ocloc_${pkgver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-level-zero-gpu_${_lzver}_amd64.deb"
        "https://github.com/intel/compute-runtime/releases/download/${pkgver}/intel-gmmlib_${_gmmver}_amd64.deb"
        'LICENSE')
noextract=("intel-opencl_${pkgver}_amd64.deb"
           "intel-ocloc_${pkgver}_amd64.deb"
           "intel-level-zero-gpu_${_lzver}_amd64.deb"
           "intel-gmmlib_${_gmmver}_amd64.deb")
sha256sums=('a17a4f7f4e2e59096a58e131235c508eb49f9086db5bef3ddb47c5ae482e2bac'
            '35a851d44b54f4c948e06edf709c4cd509b17029a03bf58b7ae614062880e352'
            '4bb17c8a23d7a188b6c1194f181d403ef98ea6c0eabf75298feb1fa24c8458f2'
            '793ea78b09474baa775b5158fd83a24d58f0ace37d6801bb54d082a118bd855a'
            '73783f7cd3b35aa7d23fa64e400c8c6a6cf6256b62b35e4827094719a9acb172')

prepare() {
    mkdir -p {opencl,ocloc,level-zero-gpu,gmmlib}-"$pkgver"
    bsdtar -xf "intel-opencl_${pkgver}_amd64.deb" -C "opencl-${pkgver}"
    bsdtar -xf "intel-ocloc_${pkgver}_amd64.deb" -C "ocloc-${pkgver}"
    bsdtar -xf "intel-level-zero-gpu_${_lzver}_amd64.deb" -C "level-zero-gpu-${pkgver}"
    bsdtar -xf "intel-gmmlib_${_gmmver}_amd64.deb" -C "gmmlib-${pkgver}"
}

package() {
    bsdtar -xf "opencl-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "ocloc-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "level-zero-gpu-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "gmmlib-${pkgver}/data.tar.xz" -C "$pkgdir"
    mv "${pkgdir}/usr/local"/{bin,include,lib} "${pkgdir}/usr"
    chown -R root:root "$pkgdir"
    ln -s $(find "${pkgdir}"/usr/lib -regex '.*libigdgmm.so.[0-9]*' -exec basename {} \;) "${pkgdir}"/usr/lib/libigdgmm.so
    ln -s $(find "${pkgdir}"/usr/lib -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} \;) "${pkgdir}"/usr/lib/libze_intel_gpu.so
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed -i 's|/usr/local|/usr|' "${pkgdir}/etc/OpenCL/vendors/intel.icd"
}
