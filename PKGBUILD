# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libheif-git
pkgver=1.16.2.r88.g003a55e
pkgrel=1
pkgdesc='HEIF and AVIF file format decoder and encoder (git version)'
arch=('x86_64')
url='https://github.com/strukturag/libheif/'
license=('LGPL3' 'MIT')
depends=('aom' 'dav1d' 'libde265' 'libwebp' 'x265')
makedepends=('git' 'cmake' 'gdk-pixbuf2' 'libjpeg' 'libpng' 'rav1e' 'svt-av1')
optdepends=('gdk-pixbuf2: for gdk-pixbuf loader'
            'libjpeg: for heif-convert and heif-enc'
            'libpng: for heif-convert and heif-enc'
            'svt-av1: for svt-av1 encoder'
            'rav1e: for rav1e encoder')
provides=('libheif')
conflicts=('libheif')
source=('git+https://github.com/strukturag/libheif.git')
sha256sums=('SKIP')

pkgver() {
    git -C libheif describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libheif \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTING:BOOL='OFF' \
        -DWITH_KVAZAAR:BOOL='OFF' \
        -Wno-dev
    cmake --build build
    
    # create a license file for the executable tools (lincensed under the MIT license)
    # https://github.com/strukturag/libheif/blob/003a55e13274b88dbf4d1162bb3402205038ce93/COPYING#L1-L2
    sed -n '/MIT[[:space:]]License$/,/^[[:space:]]*SOFTWARE\.$/p' libheif/examples/heif_convert.cc > build/LICENSE.tools
    sed -i 's/^[[:space:]]*//' build/LICENSE.tools
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 build/LICENSE.tools -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
