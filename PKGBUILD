# Maintainer: Mattéo Delabre <bonjour@matteodelabre.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfig
pkgver=1.2.1
pkgrel=5
pkgdesc="Professional vector animation program (CLI renderer only)"
arch=(x86_64)
url="https://synfig.org"
license=('GPL2')
depends=('libxml++2.6' 'libsigc++2.0' 'libmagick6' 'ffmpeg' 'fontconfig'
         'libpng' 'libtiff' 'libdv' 'libmng' 'cairo' 'pango' 'boost-libs' 'mlt'
         'fftw' 'intltool')
makedepends=('boost')
optdepends=('openexr' 'libsigc++')
source=(
    "https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/ETL-$pkgver.tar.gz"
    "https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
    'ETL-1.2.1.patch'
    'ffmpeg-3.0.patch')
sha256sums=(
    '754d88c5ddfdef54f27d1e17f62a902eb9f09fbe7ef9aebded34541b4c1700e6'
    '4d8bada4e99f05ee16b4256fc3f5a551d00a745347944837bbd6fa158b57e457'
    '35e218317050430ebae667d26269903ad1c377407b9a75feb48a9138af131cb0'
    '424b3cc38809038c3b015ce2a6d3a006d73aefe0445d0090fae45e8eb69b2b55')

prepare() {
    # Fix const-invalid method in ETL 1.2.1 using the patch which is included
    # in ETL ≥ 1.3.9. This makes building with GCC possible.
    # (see <https://github.com/synfig/synfig/commit/cb05b072>)
    cd "$srcdir"/ETL-$pkgver
    patch -p1 -i "$srcdir"/ETL-1.2.1.patch

    # Workaround usage of deprecated ffmpeg constants by manually defining
    # them, and other deprecation workarounds
    cd "$srcdir"/$pkgname-$pkgver
    patch -p1 -i "$srcdir"/ffmpeg-3.0.patch
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
