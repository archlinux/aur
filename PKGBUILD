# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libheif-git
pkgver=1.20.1.r129.g0e043e64
pkgrel=1
pkgdesc='HEIF and AVIF file format decoder and encoder (git version)'
arch=('x86_64')
url='https://github.com/strukturag/libheif/'
license=('LGPL-3.0-or-later' 'MIT')
depends=(
    'gcc-libs'
    'glibc'
    'libde265'
    'libjpeg'
    'libpng'
    'libtiff'
    'libwebp'
    'openh264'
    'sdl2-compat'
    'x265')
makedepends=(
    'cmake'
    'dav1d'
    'ffmpeg'
    'git'
    'openjpeg2'
    'rav1e'
    'svt-av1')
optdepends=(
    'dav1d: dav1d encoder'
    'ffmpeg: hardware decode'
    'openjpeg2: JPEG2000 decoder'
    'rav1e: rav1e encoder'
    'svt-av1: svt-av1 encoder')
provides=('libheif')
conflicts=('libheif')
source=('git+https://github.com/strukturag/libheif.git')
sha256sums=('SKIP')

pkgver() {
    git -C libheif describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/'
}

build() {
    cmake -B build -S libheif \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTING:BOOL='OFF' \
        -DWITH_AOM_DECODER:BOOL='OFF' \
        -DWITH_AOM_ENCODER:BOOL='OFF' \
        -DWITH_DAV1D:BOOL='ON' \
        -DWITH_KVAZAAR:BOOL='OFF' \
        -DWITH_RAV1E:BOOL='ON' \
        -DWITH_FFMPEG_DECODER:BOOL='ON' \
        -DWITH_FFMPEG_DECODER_PLUGIN:BOOL='ON' \
        -DWITH_GDK_PIXBUF:BOOL='OFF' \
        -DWITH_OpenJPEG_DECODER:BOOL='ON' \
        -DWITH_RAV1E:BOOL='ON' \
        -DWITH_SvtEnc:BOOL='ON' \
        -Wno-dev
    cmake --build build
    
    # create license files for the executable tools (lincensed under the MIT license)
    # https://github.com/strukturag/libheif/blob/0e043e64bf7038e4feefbcd24ca88d46db93d94c/COPYING#L1-L2
    local _tool
    for _tool in dec enc info thumbnailer
    do
        sed -n '/MIT[[:space:]]License$/,/^[[:space:]]*SOFTWARE\.$/p' "libheif/examples/heif_${_tool}.cc" > "build/LICENSE-${_tool}-tool"
        sed -i 's/^[[:space:]]*//' "build/LICENSE-${_tool}-tool"
    done
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 build/LICENSE-{dec,enc,info,thumbnailer}-tool -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
