# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
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
pkgver=157.r2932.g303c484e
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Open Source H264/AVC video encoder (git version)'
url='https://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('libavcodec.so' 'libavformat.so' 'libavutil.so' 'liblsmash.so'
         'libswscale.so')
makedepends=('git' 'nasm' 'ffmpeg' 'l-smash')
provides=('x264' 'libx264' 'libx264-git' 'libx264.so')
conflicts=('x264' 'libx264' 'libx264-10bit' 'libx264-all'
           'libx264-git' 'libx264-10bit-git' 'libx264-all-git')
replaces=('libx264-git' 'libx264-10bit-git' 'libx264-all-git')
source=("$pkgname"::'git+https://git.videolan.org/git/x264.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    local _version
    local _revision
    local _shorthash
    
    _version="$(grep '#define X264_BUILD' x264.h | awk '{ print $3 }')"
    _revision="$( git rev-list  --count HEAD)"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    mkdir -p "$pkgname"/build-{8,10}bit
    
    msg2 'Building for 8-bit...'
    cd "${pkgname}/build-8bit"
    ../configure \
        --prefix='/usr' \
        --enable-shared \
        --bit-depth='8' \
        --enable-lto \
        --enable-pic \
        --disable-gpac
    make
    
    msg2 'Building for 10-bit...'
    cd ../build-10bit
    ../configure \
        --prefix='/usr' \
        --libdir='/usr/lib/x264-10bit' \
        --includedir='/usr/include/x264-10bit' \
        --enable-shared \
        --bit-depth='10' \
        --enable-lto \
        --enable-pic \
        --disable-gpac
    make
}

package() {
    cd "$pkgname"
    
    local _depth
    
    for _depth in 10 8
    do
        msg2 "Installing for ${_depth}-bit..."
        make -C "build-${_depth}bit" DESTDIR="$pkgdir" install-cli install-lib-shared
        
        if [ "$_depth" -eq '10' ] 
        then
            mv "${pkgdir}/usr/bin/x264" "${pkgdir}/usr/bin/x264-${_depth}bit"
        fi
    done
}
