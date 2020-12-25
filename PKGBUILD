# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=libheif-git
pkgver=1.10.0.r0.g667eeab
pkgrel=1
pkgdesc='HEIF and AVIF file format decoder and encoder (git version)'
arch=('x86_64')
url='https://github.com/strukturag/libheif/'
license=('LGPL3' 'MIT')
depends=('aom' 'dav1d' 'libde265' 'rav1e' 'x265')
makedepends=('git' 'cmake' 'gdk-pixbuf2' 'libjpeg' 'libpng')
optdepends=('gdk-pixbuf2: for gdk-pixbuf loader'
            'libjpeg: for heif-convert and heif-enc'
            'libpng: for heif-convert, heif-enc and heif-thumbnailer')
provides=('libheif')
conflicts=('libheif')
source=('git+https://github.com/strukturag/libheif.git')
sha256sums=('SKIP')

prepare() {
    cd libheif
    ./autogen.sh
}

pkgver() {
    git -C libheif describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd libheif
    ./configure --prefix='/usr' --enable-static='no'
    make
    
    # create a license file for the executable tools (lincensed under the MIT license)
    sed -n '/MIT[[:space:]]License$/,/^[[:space:]]*SOFTWARE\.$/p' examples/encoder.cc > LICENSE.tools
    sed -i 's/^[[:space:]]*//' LICENSE.tools
}

package() {
    make -C libheif DESTDIR="$pkgdir" install
    install -D -m644 libheif/LICENSE.tools -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
