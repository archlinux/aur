# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libheif-git
pkgver=1.18.0rc1.r0.g7b6c39c2
pkgrel=1
pkgdesc='HEIF and AVIF file format decoder and encoder (git version)'
arch=('x86_64')
url='https://github.com/strukturag/libheif/'
license=('LGPL-3.0-or-later' 'MIT')
depends=('aom'
         'libde265'
         'libjpeg'
         'libpng'
         'libwebp'
         'x265'
)
makedepends=('git'
             'cmake'
             'dav1d'
             'ffmpeg'
             'gdk-pixbuf2'
             'rav1e'
             'svt-av1'
)
optdepends=('dav1d: dav1d encoder'
            'ffmpeg: hardware decode'
            'gdk-pixbuf2: for gdk-pixbuf loader'
            'rav1e: rav1e encoder'
            'svt-av1: svt-av1 encoder'
)
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
        -DWITH_DAV1D:BOOL='ON' \
        -DWITH_KVAZAAR:BOOL='OFF' \
        -DWITH_RAV1E:BOOL='ON' \
        -DWITH_FFMPEG_DECODER:BOOL='ON' \
        -DWITH_FFMPEG_DECODER_PLUGIN:BOOL='ON' \
        -DWITH_SvtEnc:BOOL='ON' \
        -Wno-dev
    cmake --build build
    
    # create license files for the executable tools (lincensed under the MIT license)
    # https://github.com/strukturag/libheif/blob/7b6c39c2427f711f15c3d332e6ed6245d180fc43/COPYING#L1-L2
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
