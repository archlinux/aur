# Maintainer: Mattéo Delabre <spam@delab.re>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfig
pkgver=1.2.2
pkgrel=2
pkgdesc="Professional vector animation program (CLI renderer only)"
arch=(x86_64)
url="https://synfig.org"
license=('GPL2')
depends=('libxml++2.6' 'libsigc++2.0' 'libmagick6' 'ffmpeg' 'fontconfig'
         'libpng' 'libtiff' 'libdv' 'libmng' 'cairo' 'pango' 'boost-libs' 'mlt'
         'fftw' 'intltool' 'sdl' 'sdl_mixer' 'sdl_image')
makedepends=('boost')
optdepends=('openexr' 'libsigc++')
source=(
    "https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/source-ETL-$pkgver.tar.gz"
    "https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/source-$pkgname-$pkgver.tar.gz"
    'ffmpeg-3.0.patch'
    'savecanvas-template.patch')
sha256sums=(
    '0dc19c5a6c9e964054ca3af6dacd6ab0c198d78071cfab2aebac178afe454d8b'
    '5f5f7b33483041165f9a63fe4d95eb815971c7444569e574206f6964e83cc2ef'
    'SKIP'
    'SKIP')

prepare() {
    # Workaround usage of deprecated ffmpeg constants by manually defining
    # them, and other deprecation workarounds
    cd "$srcdir"/$pkgname-$pkgver
    patch -p1 -i "$srcdir"/ffmpeg-3.0.patch

    # Fix invalid template inside “extern” C block
    patch -p1 -i "$srcdir"/savecanvas-template.patch

}

build() {
    # Build a local ETL version
    cd "$srcdir"/ETL-$pkgver
    ./configure --prefix="$srcdir/ETL-$pkgver/build"
    make
    make install

    # Build Synfig using the local ETL version
    # (do not use the system-wide one as it probably
    # contains the bug we want to patch)
    cd "$srcdir"/$pkgname-$pkgver

    PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig:$srcdir/ETL-$pkgver" \
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --disable-static \
        --with-imagemagick \
        --with-magickpp \
        --with-libavcodec \
        --with-libdv

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
