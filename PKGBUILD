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
pkgver=165.r3223.g0480cb05
pkgrel=1
arch=('x86_64')
pkgdesc='Open Source H.264/AVC video encoder (git version)'
url='https://www.videolan.org/developers/x264.html'
license=('GPL-2.0-only')
depends=(
    'glibc'
    'liblsmash.so')
makedepends=(
    'git'
    'nasm')
provides=('x264' 'libx264' 'libx264-git' 'libx264.so')
conflicts=('x264' 'libx264' 'libx264-10bit' 'libx264-all')
replaces=('libx264-git' 'libx264-10bit-git' 'libx264-all-git')
source=('git+https://code.videolan.org/videolan/x264.git')
sha256sums=('SKIP')

prepare() {
    mkdir -p build-{8,10}bit
}

pkgver() {
    printf '%s.r%s.g%s' "$(grep '#define X264_BUILD' x264/x264.h | awk '{ print $3 }')" \
                        "$(git -C x264 rev-list  --count HEAD)" \
                        "$(git -C x264 rev-parse --short HEAD)"
}

build() {
    local -a _common_opts=(
        '--prefix=/usr'
        '--enable-shared'
        '--enable-lto'
        '--enable-pic'
        '--disable-avs'
        '--disable-swscale'
        '--disable-lavf'
        '--disable-gpac')
    
    printf '%s\n' '  -> Building for 8-bit...'
    cd build-8bit
    ../x264/configure \
        "${_common_opts[@]}" \
        --bit-depth='8'
    make
    
    printf '%s\n' '  -> Building for 10-bit...'
    cd "${srcdir}/build-10bit"
    ../x264/configure \
        "${_common_opts[@]}" \
        --libdir='/usr/lib/x264-10bit' \
        --includedir='/usr/include/x264-10bit' \
        --bit-depth='10'
    make
}

package() {
    export BASHCOMPLETIONSDIR='/usr/share/bash-completion/completions'
    
    local _depth
    for _depth in 10 8
    do
        printf '%s\n' "  -> Installing for ${_depth}-bit..."
        make -C "build-${_depth}bit" DESTDIR="$pkgdir" install-cli install-lib-shared install-bashcompletion
        
        if [ "$_depth" -eq '10' ]
        then
            mv "${pkgdir}/usr/bin/x264"{,"-${_depth}bit"}
            mv "${pkgdir}/usr/share/bash-completion/completions/x264"{,"-${_depth}bit"}
        fi
    done
}
