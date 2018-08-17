# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# This package provides both 8 and 10-bit support in a single package.
# x264 from the [extra] official repository is currently 8-bit only.
# When used "normally", this package is just like x264 from [extra]
# in terms of bith depth, acting as 8-bit. For explanation and
# comparison about 8-bit and 10-bit, please see, e.g.:
# https://gist.github.com/l4n9th4n9/4459997

_commit='0a84d986e7020f8344f00752e3600b9769cc1e85'

pkgname=x264-noffmpeg
pkgver=155.r2917.g0a84d986
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Open Source H264/AVC video encoder (no ffmpeg dependency)'
url='https://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('liblsmash.so')
makedepends=('git' 'nasm' 'l-smash')
provides=('x264' 'libx264' 'libx264.so')
conflicts=('x264' 'x264-git' 'x264-noffmpeg-git' 'libx264' 'libx264-10bit'
           'libx264-all' 'libx264-git' 'libx264-10bit-git' 'libx264-all-git')
source=("$pkgname"::"git+https://git.videolan.org/git/x264.git#commit=${_commit}")
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
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
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
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
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
