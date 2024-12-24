# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=2.2.3
_build=18220
_oclcommit=470cf0018e1ef6fc92eda1356f5f31f7da452abc
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=('gcc-libs' 'zlib')
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
sha256sums=('6c1fff18f5ea7ef23d3e5532750822363bf4688d342d09af31470329f54a83d6'
            '60e9e4de95b191fd9b49123e0d745c6071283a38e632059e9c4ffa935e99d4e7'
            '46d01652a240f5be572c0248177ee52967acf608d039acc5c16d5a10946b5a3a'
            '19214ef9956892960ebd10c91f13cde103ccd270aa4681bdeeb048eb500cd165'
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
