# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-bin
pkgver=1.0.16510.2
_oclcommit=cf95b338d14685e4f3402ab1828bef31d48f1fd6
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (pre-compiled binaries)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'LicenseRef-Custom')
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
sha256sums=('7b3cf621e1a2740d24f6f5bcd8ec27a3c920cdfab7341c7b0e781693f112d64a'
            '395cce95d47f34f7e8bd438ed0a2f12ff1fc2d9ca76b80faec22484404884b8e'
            '84d6081fff7fb358d7a3fa43ebdc9c6c26e48a022097874e2e86b836de4dc75c'
            'f0f84804beb063d1bd92ed2f9213540b53561fdf8027f9f57dc6fad6739a49d5'
            '06648bff406785c2f9d28c4f38ace010ef699f30e8d70531137bff13adff7bd6'
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
