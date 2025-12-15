# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=2.24.8
_build=20344
_oclcommit=4157bbe686dbe2a464b317c74f56b6601d5f3be3
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
sha256sums=('a701b03553f42111e6790cfd1bf9bdf7e7c2106b2489083892be338b51688ed7'
            '22e9193938272035cbe03e238c8e24224518a1de72d1c1b65f6d3a6c832ab20e'
            '670d3c8d0073b90ef5cc9f10d42b4bc86c08985aa5f7617b81006d7598d543c7'
            '6301d75589b8053ae0c2d95a6bdded87cac531a58d16caa3fc31de324a9ae57f'
            'c69aaec482bffa20560882b6b901ca7a62fe402ab9ec6375e5f7323eaf2356ec'
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
