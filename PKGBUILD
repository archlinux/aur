# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=1.0.8173
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('git')
provides=('intel-graphics-compiler' 'intel-opencl-clang')
conflicts=('intel-graphics-compiler' 'intel-opencl-clang')
options=('!strip' '!emptydirs')
_oclcommit=c8cd72e32b6abc18ce6da71c357ea45ba78b52f0
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
sha256sums=('df305ff523d93e5d664c15b825a6e79501c0775f32b07621bee1f7acec4e7858'
            'd067315d51f20aebbcf0b4f23812ee981a55cee6523ff67f634c7849816c084d'
            '4be6b9090bed4d7e2be8b85d17e23e832788fb4c336c350a9af67f9e1d4c380f'
            '95973707b3f3c852228553f1da08a54821744ef465c4d29e6ef7c3912fa56717'
            'SKIP'
            '0ddcc820928d5fc03b6c1271de8c0f9e9be74717f872956cc3fc4ae25eca9d90')

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
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/igc/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
