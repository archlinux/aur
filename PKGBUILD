# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=2.12.5
_build=19302
_oclcommit=58242977b4092cf5eb94a10dd144691c12c87001
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=('gcc-libs' 'glibc' 'zlib' 'zstd')
makedepends=('git')
provides=('intel-graphics-compiler' 'intel-opencl-clang')
conflicts=('intel-graphics-compiler' 'intel-opencl-clang')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/intel-graphics-compiler/releases/download/v${pkgver}/intel-igc-core-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/v${pkgver}/intel-igc-opencl-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/v${pkgver}/intel-igc-opencl-devel_${pkgver}+${_build}_amd64.deb"
        "git+https://github.com/intel/opencl-clang.git#commit=${_oclcommit}"
        'LICENSE')
noextract=("intel-igc-core-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb"
           "intel-igc-opencl-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb"
           "intel-igc-opencl-devel_${pkgver}+${_build}_amd64.deb")
sha256sums=('6f3531c3dc2de7a895b990fe6661d61ff6aad2afe68d1f2069965ee7e7af08d0'
            '888d5958f344d267387194926276c8fc06fd28debdf575b2fd8a6bf37e80875c'
            'e924467408f58c381fc01645dde881d37872f837c88035e4ad3ddb3a77d34aee'
            'cc4961a1701dc241d9a3c8c7f0d9a1ab8302f6f70b3df036e73313c32bf551f2'
            '72d9ed65b0068110b0dcef7e2b52cd32d90ceaeb743b7b6fb8ad07265f230716')

prepare() {
    mkdir -p igc-{core,opencl{,-devel}}-"$pkgver"
    bsdtar -xf "intel-igc-core-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-opencl-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb" -C "igc-opencl-${pkgver}"
    bsdtar -xf "intel-igc-opencl-devel_${pkgver}+${_build}_amd64.deb" -C "igc-opencl-devel-${pkgver}"
}

package() {
    bsdtar -xf "igc-core-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-devel-${pkgver}/data.tar.gz" -C "$pkgdir"
    mv "${pkgdir}/usr/local"/{bin,include,lib} "${pkgdir}/usr"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    install -D -m644 opencl-clang/common_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed -i 's|/usr/local|/usr|' "${pkgdir}/usr/lib/pkgconfig/igc-opencl.pc"
    mv "${pkgdir}/usr/lib/igc2/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
