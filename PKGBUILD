# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=2.22.2
_build=20121
_oclcommit=43611737fe738e227da35d65e787f4e10a88c9c9
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=(
    'gcc-libs'
    'glibc'
    'zlib'
    'zstd')
makedepends=(
    'git')
provides=('intel-graphics-compiler' 'intel-opencl-clang')
conflicts=('intel-graphics-compiler' 'intel-opencl-clang')
options=('!debug' '!emptydirs' '!strip')
source=("https://github.com/intel/intel-graphics-compiler/releases/download/v${pkgver}/intel-igc-core-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/v${pkgver}/intel-igc-core-devel_${pkgver}+${_build}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/v${pkgver}/intel-igc-opencl-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/v${pkgver}/intel-igc-opencl-devel_${pkgver}+${_build}_amd64.deb"
        "git+https://github.com/intel/opencl-clang.git#commit=${_oclcommit}"
        'LICENSE')
noextract=("intel-igc-core-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb"
           "intel-igc-core-devel_${pkgver}+${_build}_amd64.deb"
           "intel-igc-opencl-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb"
           "intel-igc-opencl-devel_${pkgver}+${_build}_amd64.deb")
sha256sums=('ee6238e648f65c4404e222464868f0d2624701c10cc85576310470d92073d6ca'
            '2b668a2253d4bbfd3e1d7acc7a8e0c52dd9a94e8bcfbcb8db950172c7b3b90f4'
            '17147aebb29ebfb73b3a0b78d3d0b260c4c2fc79585d6dc85299c037eaae189c'
            'be4334962a9ed13d993860d38078a0aebace2d48b037208b2d0190f944bd3882'
            '353c46ec4a4354ad1f55c958b294f2ba10cd4ee329b101bf31d30b5351b65011'
            '72d9ed65b0068110b0dcef7e2b52cd32d90ceaeb743b7b6fb8ad07265f230716')

prepare() {
    mkdir -p igc-{core{,-devel},opencl{,-devel}}-"$pkgver"
    bsdtar -xf "intel-igc-core-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-core-devel_${pkgver}+${_build}_amd64.deb" -C "igc-core-devel-${pkgver}"
    bsdtar -xf "intel-igc-opencl-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb" -C "igc-opencl-${pkgver}"
    bsdtar -xf "intel-igc-opencl-devel_${pkgver}+${_build}_amd64.deb" -C "igc-opencl-devel-${pkgver}"
}

package() {
    bsdtar -xf "igc-core-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-core-devel-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-devel-${pkgver}/data.tar.gz" -C "$pkgdir"
    mv "${pkgdir}/usr/local"/{bin,include,lib} "${pkgdir}/usr"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    install -D -m644 opencl-clang/opencl_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed -i 's|/usr/local|/usr|' "${pkgdir}/usr/lib/pkgconfig/igc-opencl.pc"
    mv "${pkgdir}/usr/lib/igc2/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
