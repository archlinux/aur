# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=avbin-git
pkgver=10.r60.g6a8ea87
pkgrel=1
pkgdesc='A C library that provides a wrapper around Libav’s video and audio decoding functionality (git version)'
arch=('x86_64')
url='https://avbin.github.io/'
license=('LGPL3')
depends=('bzip2' 'zlib')
makedepends=('git' 'yasm')
provides=('avbin')
conflicts=('avbin')
source=('git+https://github.com/AVbin/AVbin.git'
        'libav-avbin'::'git+https://github.com/AVbin/libav.git'
        '0001-avbin-remove-unwanted-optimization.patch'
        '0002-avbin-fix-link-and-add-full-relro.patch'
        '0003-avbin-faster-build.patch'
        'avbin.pc')
sha256sums=('SKIP'
            'SKIP'
            '8f8b20d6e57bdc6bf73723691740ae35b157785ebda5764a7611a68df427c30a'
            'fa8f7263326b10f968836f5fe7ae9efef04cdce58a28cfd3f7cb93985fffb469'
            '5629f9f239b5dafb8ded30224136854ee8fda537d5e528f9db35450bf057a5ad'
            'd601ceed81c584d7af1d4cb0217e7ab34b7973232a81a09ce24eb620b4796199')

prepare() {
    cd AVbin
    
    git submodule init
    git config --local "submodule.libav.url" "${srcdir}/libav-avbin"
    git submodule update
    
    patch -Np1 -i "${srcdir}/0001-avbin-remove-unwanted-optimization.patch"
    patch -Np1 -i "${srcdir}/0002-avbin-fix-link-and-add-full-relro.patch"
    patch -Np1 -i "${srcdir}/0003-avbin-faster-build.patch"
}

pkgver() {
    cd AVbin
    
    # git, tags available
    git describe --long --tags | sed 's/^avbin-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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
    local _sover
    _sover="$((${pkgver%%.*} + 1))"
    install -D -m755 "AVbin/dist/linux-x86-64/libavbin.so.${_sover}" -t "${pkgdir}/usr/lib"
    ln -s "libavbin.so.${_sover}" "${pkgdir}/usr/lib/libavbin.so"
    
    # pkgconfig
    install -D -m644 avbin.pc -t "${pkgdir}/usr/lib/pkgconfig"
}
