# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=2.40.13
_build=22418
_oclcommit=6de4d92220bbbb4fa28e13418f8d0daf9d67fe58
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'Apache-2.0 WITH LLVM-exception')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
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
sha256sums=('ebd795e9fddf303a9b24b7f04545d8ddd9ad1f85b3d0cb1166476fab24da6d44'
            '4729cd734934b859332b6fc99b819ca63fb79b83938675ba6208523ed0058b4c'
            '4f990874efc11c3f6091a663b08aef576c4af592dcd8f12e116f8c2fc92d34d9'
            'da86fdae55cc324299db19e5cca9b61b5579d5a269f90a89655e3d60924081ea'
            'c09db1fd411f0d93f016d97ed32c8e57f5dda4c9466da945f6ea38e309766c92'
            '72d9ed65b0068110b0dcef7e2b52cd32d90ceaeb743b7b6fb8ad07265f230716')

prepare() {
    mkdir -p igc-{core{,-devel},opencl{,-devel}}-"$pkgver"
    bsdtar -xf "intel-igc-core-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-core-devel_${pkgver}+${_build}_amd64.deb" -C "igc-core-devel-${pkgver}"
    bsdtar -xf "intel-igc-opencl-${pkgver%%.*}_${pkgver}+${_build}_amd64.deb" -C "igc-opencl-${pkgver}"
    bsdtar -xf "intel-igc-opencl-devel_${pkgver}+${_build}_amd64.deb" -C "igc-opencl-devel-${pkgver}"
}

package() {
    bsdtar -xf "igc-core-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "igc-core-devel-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "igc-opencl-${pkgver}/data.tar.zst" -C "$pkgdir"
    bsdtar -xf "igc-opencl-devel-${pkgver}/data.tar.zst" -C "$pkgdir"
    mv "${pkgdir}/usr/local"/{bin,include,lib} "${pkgdir}/usr"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    install -D -m644 opencl-clang/opencl_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed -i 's|/usr/local|/usr|' "${pkgdir}/usr/lib/pkgconfig/igc-opencl.pc"
    mv "${pkgdir}/usr/lib/igc2/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    chown --recursive root:root "${pkgdir}/usr"
}
