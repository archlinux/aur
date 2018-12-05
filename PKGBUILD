# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libvpx-full-git
_srcname=libvpx
pkgver=1.7.0.r1445.g5039d2d82b
pkgrel=1
pkgdesc='VP8 and VP9 video codecs (with all possible options, git version)'
arch=('i686' 'x86_64')
url='https://www.webmproject.org/code/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'yasm')
provides=('libvpx' 'libvpx-git' 'libvpx.so')
conflicts=('libvpx')
source=('git+https://chromium.googlesource.com/webm/libvpx') # official repo
#source=('git+https://github.com/webmproject/libvpx.git') # mirror
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    ./configure \
        --prefix='/usr' \
        --disable-werror \
        --enable-optimizations \
        --enable-pic \
        --disable-ccache \
        --disable-debug \
        --disable-gprof \
        --disable-gcov \
        --disable-thumb \
        --enable-dependency-tracking \
        --disable-install-docs \
        --enable-install-bins \
        --enable-install-libs \
        --disable-install-srcs \
        --enable-libs \
        --enable-examples \
        --disable-docs \
        --disable-unit-tests \
        --disable-decode-perf-tests \
        --disable-encode-perf-tests \
        --as='yasm' \
        --disable-codec-srcs \
        --disable-debug-libs \
        --enable-static-msvcrt \
        --enable-vp9-highbitdepth \
        --enable-better-hw-compatibility \
        --enable-vp8 \
        --enable-vp9 \
        --disable-internal-stats \
        --enable-postproc \
        --enable-vp9-postproc \
        --enable-multithread \
        --enable-spatial-resampling \
        --enable-onthefly-bitpacking \
        --enable-error-concealment \
        --enable-coefficient-range-checking \
        --enable-runtime-cpu-detect \
        --enable-shared \
        --disable-static \
        --disable-small \
        --enable-postproc-visualizer \
        --enable-multi-res-encoding \
        --enable-temporal-denoising \
        --enable-vp9-temporal-denoising \
        --enable-experimental \
        --enable-webm-io \
        --enable-libyuv \
        --enable-vp8-encoder \
        --enable-vp8-decoder \
        --enable-vp9-encoder \
        --enable-vp9-decoder
        
    make
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 PATENTS -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
