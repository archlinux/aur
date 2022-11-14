# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=avbin-git
pkgver=10.r61.g92d515a
pkgrel=1
pkgdesc='A C library that provides a wrapper around Libav’s video and audio decoding functionality (git version)'
arch=('x86_64')
url='https://avbin.github.io/'
license=('LGPL3')
depends=('bzip2' 'zlib')
makedepends=('git' 'yasm')
provides=('avbin')
conflicts=('avbin')
options=('!lto')
source=('git+https://github.com/AVbin/AVbin.git'
        'libav-avbin'::'git+https://github.com/AVbin/libav.git'
        '0001-avbin-remove-unwanted-optimization.patch'
        '0002-avbin-fix-link-and-add-full-relro.patch'
        '0003-avbin-faster-build.patch'
        'avbin.pc')
sha256sums=('SKIP'
            'SKIP'
            'cd44745477803d96d9cf762c4004b7d53c0b84e5a6ba4a3c1f5ce46f4572a2ca'
            'a177c0906928338113469c688d309ae8e95a753de35c2a73bff02b6d99de6008'
            'c86083e6286af140dbb97b39a06c778bffad5557bb9f46465f6b7a2e050cbe97'
            'd601ceed81c584d7af1d4cb0217e7ab34b7973232a81a09ce24eb620b4796199')

prepare() {
    git -C AVbin submodule init
    git -C AVbin config --local "submodule.libav.url" "${srcdir}/libav-avbin"
    git -C AVbin -c protocol.file.allow='always' submodule update
    
    patch -d AVbin -Np1 -i "${srcdir}/0001-avbin-remove-unwanted-optimization.patch"
    patch -d AVbin -Np1 -i "${srcdir}/0002-avbin-fix-link-and-add-full-relro.patch"
    patch -d AVbin -Np1 -i "${srcdir}/0003-avbin-faster-build.patch"
}

pkgver() {
    git -C AVbin describe --long --tags | sed 's/^avbin-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
    local _sover
    _sover="$((${pkgver%%.*} + 1))"
    install -D -m755 "AVbin/dist/linux-x86-64/libavbin.so.${_sover}" -t "${pkgdir}/usr/lib"
    ln -s "libavbin.so.${_sover}" "${pkgdir}/usr/lib/libavbin.so"
    
    # pkgconfig
    install -D -m644 avbin.pc -t "${pkgdir}/usr/lib/pkgconfig"
}
