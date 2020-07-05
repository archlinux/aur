# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=libheif-git
pkgver=1.7.0.r0.g82eccc9
pkgrel=1
pkgdesc='HEIF file format decoder and encoder (git version)'
arch=('x86_64')
url='https://github.com/strukturag/libheif/'
license=('GPL3')
depends=('libde265' 'x265' 'gdk-pixbuf2' 'shared-mime-info')
makedepends=('git' 'cmake' 'libjpeg' 'libpng')
optdepends=('libjpeg: for heif-convert and heif-enc'
            'libpng: for heif-convert and heif-enc')
provides=('libheif')
conflicts=('libheif')
source=('git+https://github.com/strukturag/libheif.git')
sha256sums=('SKIP')

pkgver() {
    git -C libheif describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libheif \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m755 build/examples/heif-{convert,enc,info,test,thumbnailer} -t "${pkgdir}/usr/bin"
    install -D -m644 libheif/examples/heif-{convert,enc,info,thumbnailer}.1  -t "${pkgdir}/usr/share/man/man1"
    install -D -m644 libheif/gnome/heif.xml -t "${pkgdir}/usr/share/mime/packages"
    install -D -m644 libheif/gnome/heif.thumbnailer -t "${pkgdir}/usr/share/thumbnailers"
}
