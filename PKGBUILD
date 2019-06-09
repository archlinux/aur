# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=avbin
pkgver=10
pkgrel=3
pkgdesc='A C library that provides a wrapper around Libav’s video and audio decoding functionality'
arch=('x86_64')
url='https://avbin.github.io/'
license=('LGPL3')
depends=('bzip2' 'zlib')
makedepends=('git' 'yasm')
source=("git+https://github.com/AVbin/AVbin.git#tag=avbin-${pkgver}"
        'libav-avbin'::'git+https://github.com/AVbin/libav.git'
        '0001-avbin-remove-unwanted-optimization.patch'
        '0002-avbin-fix-link-and-add-full-relro.patch'
        '0003-avbin-faster-build.patch'
        'avbin.pc')
sha256sums=('SKIP'
            'SKIP'
            '8f8b20d6e57bdc6bf73723691740ae35b157785ebda5764a7611a68df427c30a'
            'fa8f7263326b10f968836f5fe7ae9efef04cdce58a28cfd3f7cb93985fffb469'
            'be5e45a35c35229c68adfc1606c31d479a4813926de1c022d3919c7592d92c8b'
            'd43b24480805ede648a5851465b3071fde75d4114f8a6c84430902075767667f')

prepare() {
    cd AVbin
    
    git submodule init
    git config --local "submodule.libav.url" "${srcdir}/libav-avbin"
    git submodule update
    
    patch -Np1 -i "${srcdir}/0001-avbin-remove-unwanted-optimization.patch"
    patch -Np1 -i "${srcdir}/0002-avbin-fix-link-and-add-full-relro.patch"
    patch -Np1 -i "${srcdir}/0003-avbin-faster-build.patch"
}

build() {
    cd AVbin
    
    unset LDFLAGS # won't build if setted, modified by patch
    
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
