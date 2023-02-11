# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=1.0.12504.5
_oclcommit=363a5262d8c7cff3fb28f3bdb5d85c8d7e91c1bb
pkgrel=2
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'custom')
depends=('gcc-libs' 'zlib')
makedepends=('git')
provides=('intel-graphics-compiler' 'intel-opencl-clang')
conflicts=('intel-graphics-compiler' 'intel-opencl-clang')
options=('!strip' '!emptydirs')
source=("https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-core_${pkgver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-media_${pkgver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-opencl-devel_${pkgver}_amd64.deb"
        "https://github.com/intel/intel-graphics-compiler/releases/download/igc-${pkgver}/intel-igc-opencl_${pkgver}_amd64.deb"
        "git+https://github.com/intel/opencl-clang.git#commit=${_oclcommit}"
        'LICENSE')
noextract=("intel-igc-core_${pkgver}_amd64.deb"
           "intel-igc-media_${pkgver}_amd64.deb"
           "intel-igc-opencl-devel_${pkgver}_amd64.deb"
           "intel-igc-opencl_${pkgver}_amd64.deb")
sha256sums=('9471439bcd7a7a7e17ac96ff67db15a3028d8f755d5fae42221e73033b863bbb'
            'f68127aeacd4fde56f4ac2380f966aa0ae60ada40968b0d821119c1342e9edd7'
            '69eb8bbbc9ca48eecb0c851d78fee896a835c3c22dece0b5f08a10edde9a5674'
            '51d95bb3844337d780cdd795a54dfc785e82eb9b32d295810d8c07e0ce4441ae'
            'SKIP'
            '72d9ed65b0068110b0dcef7e2b52cd32d90ceaeb743b7b6fb8ad07265f230716')

prepare() {
    mkdir -p igc-{core,media,opencl-devel,opencl}-"$pkgver"
    bsdtar -xf "intel-igc-core_${pkgver}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-media_${pkgver}_amd64.deb" -C "igc-media-${pkgver}"
    bsdtar -xf "intel-igc-opencl-devel_${pkgver}_amd64.deb" -C "igc-opencl-devel-${pkgver}"
    bsdtar -xf "intel-igc-opencl_${pkgver}_amd64.deb" -C "igc-opencl-${pkgver}"
}

package() {
    bsdtar -xf "igc-core-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "igc-media-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-devel-${pkgver}/data.tar.xz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-${pkgver}/data.tar.xz" -C "$pkgdir"
    mv "${pkgdir}/usr/local"/{bin,include,lib} "${pkgdir}/usr"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    install -D -m644 opencl-clang/common_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/igc/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # fix symlinks
    ln -sf "libiga64.so.${pkgver%%.*}" "${pkgdir}/usr/lib/libiga64.so"
    ln -sf "libiga64.so.${pkgver}" "${pkgdir}/usr/lib/libiga64.so.${pkgver%%.*}"
    ln -sf "libigc.so.${pkgver%%.*}" "${pkgdir}/usr/lib/libigc.so"
    ln -sf "libigc.so.${pkgver}" "${pkgdir}/usr/lib/libigc.so.${pkgver%%.*}"
    ln -sf "libigdfcl.so.${pkgver%%.*}" "${pkgdir}/usr/lib/libigdfcl.so"
    ln -sf "libigdfcl.so.${pkgver}" "${pkgdir}/usr/lib/libigdfcl.so.${pkgver%%.*}"
}
