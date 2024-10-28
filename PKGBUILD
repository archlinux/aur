# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=1.0.17791.9
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
sha256sums=('9738542d9beb0e883d159bac8c170e08f1450a0b09ce81166e270351d173560b'
            'f17389ca86593be2a9753e615246802844a2ed7cc6517d3f0f921f940770d71f'
            'b929a46016ed4acf5e56b3cee1995add7391d4c4c547c9fb63b9fd073f17fb4e'
            'c3b35c0ce1d31c07b1d5598935a4fdaefbe05e34b4f4bf9f72908b422bc16d53'
            '19214ef9956892960ebd10c91f13cde103ccd270aa4681bdeeb048eb500cd165'
            '72d9ed65b0068110b0dcef7e2b52cd32d90ceaeb743b7b6fb8ad07265f230716')

prepare() {
    mkdir -p igc-{core,media,opencl-devel,opencl}-"$pkgver"
    bsdtar -xf "intel-igc-core_${pkgver}_amd64.deb" -C "igc-core-${pkgver}"
    bsdtar -xf "intel-igc-media_${pkgver}_amd64.deb" -C "igc-media-${pkgver}"
    bsdtar -xf "intel-igc-opencl-devel_${pkgver}_amd64.deb" -C "igc-opencl-devel-${pkgver}"
    bsdtar -xf "intel-igc-opencl_${pkgver}_amd64.deb" -C "igc-opencl-${pkgver}"
}

package() {
    bsdtar -xf "igc-core-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-media-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-devel-${pkgver}/data.tar.gz" -C "$pkgdir"
    bsdtar -xf "igc-opencl-${pkgver}/data.tar.gz" -C "$pkgdir"
    mv "${pkgdir}/usr/local"/{bin,include,lib} "${pkgdir}/usr"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    install -D -m644 opencl-clang/common_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/igc/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
