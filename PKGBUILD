# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libvpx-full-git
pkgver=1.6.1.r442.gff1fef9607
pkgrel=1
pkgdesc="VP8 and VP9 video codecs (Git version with all possible options)"
arch=('i686' 'x86_64')
url="http://www.webmproject.org/code/"
license=('BSD')
makedepends=('git' 'yasm')
provides=('libvpx' 'libvpx-git' 'libvpx.so')
conflicts=('libvpx' 'libvpx-git')
source=("$pkgname"::'git+https://chromium.googlesource.com/webm/libvpx') # official repo
#source=("$pkgname"::'git+https://github.com/webmproject/libvpx.git') # mirror
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    
    # Git, tags available
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
}

build() {
    cd "${srcdir}/${pkgname}"
    
    # Select target architecture
    if [ "$CARCH" = "x86_64" ] 
    then
        _target="--target=x86_64-linux-gcc"
        
    elif [ "$CARCH" = "i686" ] 
    then
        _target="--target=x86-linux-gcc"
        
    else
        _target=""
        
    fi
    
    ./configure \
        --prefix=/usr \
        $_target \
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
        --as=yasm \
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
        --enable-spatial-svc \
        --enable-webm-io \
        --enable-libyuv \
        --enable-vp8-encoder \
        --enable-vp8-decoder \
        --enable-vp9-encoder \
        --enable-vp9-decoder
        
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir/" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 PATENTS "${pkgdir}/usr/share/licenses/${pkgname}/PATENTS"
}
