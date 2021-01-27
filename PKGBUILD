# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili at-gmail a-dot com>
# Contributor: PelPix <kylebloss[at]pelpix[dot]info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>
# Contributor: zhuqin <zhuqin83[at]gmail>
# Contributor: pressh <pressh[at]gmail>

# NOTE:
# This package provides both 8 and 10-bit support in a single package.
# x264 from the [extra] official repository is currently 8-bit only.
# When used "normally", this package is just like x264 from [extra],
# acting as 8-bit. For explanation and comparison about 8-bit and
# 10-bit, please see, e.g.: https://gist.github.com/l4n9th4n9/4459997

pkgname=x264-git
pkgver=161.r3042.gb3aadb76
pkgrel=1
arch=('x86_64')
pkgdesc='Open Source H.264/AVC video encoder (git version)'
url='https://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('liblsmash.so')
makedepends=('git' 'nasm' 'l-smash')
provides=('x264' 'libx264' 'libx264-git' 'libx264.so')
conflicts=('x264' 'libx264' 'libx264-10bit' 'libx264-all')
replaces=('libx264-git' 'libx264-10bit-git' 'libx264-all-git')
source=('git+https://code.videolan.org/videolan/x264.git')
sha256sums=('SKIP')

prepare() {
    mkdir -p x264/build-{8,10}bit
}

pkgver() {
    printf '%s.r%s.g%s' "$(grep '#define X264_BUILD' x264/x264.h | awk '{ print $3 }')" \
                        "$(git -C x264 rev-list  --count HEAD)" \
                        "$(git -C x264 rev-parse --short HEAD)"
}

build() {
    printf '%s\n' '  -> Building for 8-bit...'
    cd x264/build-8bit
    ../configure \
        --prefix='/usr' \
        --enable-shared \
        --bit-depth='8' \
        --enable-lto \
        --enable-pic \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-gpac
    make
    
    printf '%s\n' '  -> Building for 10-bit...'
    cd "${srcdir}/x264/build-10bit"
    ../configure \
        --prefix='/usr' \
        --libdir='/usr/lib/x264-10bit' \
        --includedir='/usr/include/x264-10bit' \
        --enable-shared \
        --bit-depth='10' \
        --enable-lto \
        --enable-pic \
        --disable-avs \
        --disable-swscale \
        --disable-lavf \
        --disable-gpac
    make
}

package() {
    cd x264
    
    local _depth
    for _depth in 10 8
    do
        printf '%s\n' "  -> Installing for ${_depth}-bit..."
        make -C "build-${_depth}bit" DESTDIR="$pkgdir" install-cli install-lib-shared
        
        if [ "$_depth" -eq '10' ] 
        then
            mv "${pkgdir}/usr/bin/x264" "${pkgdir}/usr/bin/x264-${_depth}bit"
        fi
    done
}
