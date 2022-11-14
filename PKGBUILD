# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=avbin
pkgver=10
pkgrel=4
pkgdesc='A C library that provides a wrapper around Libav’s video and audio decoding functionality'
arch=('x86_64')
url='https://avbin.github.io/'
license=('LGPL3')
depends=('bzip2' 'zlib')
makedepends=('git' 'yasm')
options=('!lto')
source=("git+https://github.com/AVbin/AVbin.git#tag=avbin-${pkgver}"
        'libav-avbin'::'git+https://github.com/AVbin/libav.git'
        '0001-avbin-remove-unwanted-optimization.patch'
        '0002-avbin-fix-link-and-add-full-relro.patch'
        '0003-avbin-faster-build.patch'
        'avbin.pc')
sha256sums=('SKIP'
            'SKIP'
            'cd44745477803d96d9cf762c4004b7d53c0b84e5a6ba4a3c1f5ce46f4572a2ca'
            'a177c0906928338113469c688d309ae8e95a753de35c2a73bff02b6d99de6008'
            'be5e45a35c35229c68adfc1606c31d479a4813926de1c022d3919c7592d92c8b'
            'd43b24480805ede648a5851465b3071fde75d4114f8a6c84430902075767667f')

prepare() {
    git -C AVbin submodule init
    git -C AVbin config --local "submodule.libav.url" "${srcdir}/libav-avbin"
    git -C AVbin -c protocol.file.allow='always' submodule update
    
    patch -d AVbin -Np1 -i "${srcdir}/0001-avbin-remove-unwanted-optimization.patch"
    patch -d AVbin -Np1 -i "${srcdir}/0002-avbin-fix-link-and-add-full-relro.patch"
    patch -d AVbin -Np1 -i "${srcdir}/0003-avbin-faster-build.patch"
}

build() {
    cd AVbin
    unset -v LDFLAGS # won't build if setted, modified by patch
    ./build.sh --fast linux-x86-64
}

package() {
    # header
    install -D -m644 AVbin/include/avbin.h -t "${pkgdir}/usr/include"
    
    # library
    install -D -m755 "AVbin/dist/linux-x86-64/libavbin.so.${pkgver}" -t "${pkgdir}/usr/lib"
    ln -s "libavbin.so.${pkgver}" "${pkgdir}/usr/lib/libavbin.so"
    
    # pkgconfig
    install -D -m644 avbin.pc -t "${pkgdir}/usr/lib/pkgconfig"
}
