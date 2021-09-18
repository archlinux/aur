# Maintainer: Mitch Bigelow <mitch.bigelow at gmail.com>
# Contributer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=geeqie-git
pkgver=20210917
pkgrel=1
pkgdesc='Lightweight image viewer'
arch=('x86_64')
url="http://www.geeqie.org/"
license=('GPL2')
depends=('exiv2' 'gtk3' 'ffmpegthumbnailer'
         'djvulibre' 'libheif' 'libchamplain'
         'poppler-glib' 'libarchive')
makedepends=('git'
             'intltool' 'python' 'librsvg'
             'libwmf' 'libwebp' 'imagemagick'
             'fbida' 'gawk' 'perl-image-exiftool')
optdepends=('librsvg: SVG rendering'
            'fbida: for jpeg rotation'
            'gawk: to use the geo-decode function'
            'perl-image-exiftool: for the jpeg extraction plugin'
            'gphoto2: command-line tools for various (plugin) operations'
            'imagemagick: command-line tools for various (plugin) operations')
provides=('geeqie')
conflicts=('geeqie')
source=("git+git://git.geeqie.org/geeqie.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/geeqie"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
    cd "${srcdir}/geeqie"

    # Remove Werror
    sed -i 's|^CFLAGS+=" -Werror|# CFLAGS+=" -Werror|' configure.ac

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/geeqie"

    ./configure \
        --prefix=/usr \
        --disable-lirc \
        --disable-lua
    make
}

package() {
    cd "${srcdir}/geeqie"
    make DESTDIR="${pkgdir}" install
}
