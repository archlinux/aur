# Maintainer: Mattéo Delabre <bonjour@matteodelabre.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfigstudio
pkgver=1.2.1
pkgrel=4
pkgdesc="Professional vector animation program (GUI)"
arch=(x86_64)
url="https://synfig.org"
license=('GPL2')
depends=('gtkmm3' 'synfig' 'sdl_image')
makedepends=('openexr' 'libmagick6' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi'
             'xorg-fonts-misc' 'xorg-fonts-type1' 'intltool' 'imagemagick')
source=(
    "https://github.com/synfig/synfig/releases/download/v$pkgver/ETL-$pkgver.tar.gz"
    "https://github.com/synfig/synfig/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
    'ETL-1.2.1.patch')
sha256sums=(
    '754d88c5ddfdef54f27d1e17f62a902eb9f09fbe7ef9aebded34541b4c1700e6'
    '1a97875e0039895604085649bcd30cf0d6165f4c865299ca13d45d2dfbfab05d'
    '35e218317050430ebae667d26269903ad1c377407b9a75feb48a9138af131cb0')

prepare() {
    # Fix const-invalid method in ETL 1.2.1 using the patch which is included
    # in ETL ≥ 1.3.9. This makes building with GCC possible.
    # (see <https://github.com/synfig/synfig/commit/cb05b072>)
    cd "$srcdir"/ETL-$pkgver
    patch -p1 -i "$srcdir"/ETL-1.2.1.patch
}

build() {
    # Build a local ETL version
    cd "$srcdir"/ETL-$pkgver
    ./configure --prefix="$srcdir/ETL-$pkgver/build"
    make
    make install

    # Build Synfig Studio using the local ETL version
    # (do not use the system-wide one as it probably
    # contains the bug we want to patch)
    cd "$srcdir"/$pkgname-$pkgver

    PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig:/usr/lib/ffmpeg0.10/pkgconfig:$srcdir/ETL-$pkgver" \
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --with-libavcodec \
        --with-libdv

    make
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install

    rm -f "$pkgdir"/usr/share/pixmaps/$pkgname/*.mng
    install -m644 images/*.png -t "$pkgdir"/usr/share/pixmaps/$pkgname/

    rm -f "$pkgdir"/usr/share/mime/XMLnamespaces
    rm -f "$pkgdir"/usr/share/mime/aliases
    rm -f "$pkgdir"/usr/share/mime/generic-icons
    rm -f "$pkgdir"/usr/share/mime/globs
    rm -f "$pkgdir"/usr/share/mime/globs2
    rm -f "$pkgdir"/usr/share/mime/icons
    rm -f "$pkgdir"/usr/share/mime/magic
    rm -f "$pkgdir"/usr/share/mime/mime.cache
    rm -f "$pkgdir"/usr/share/mime/subclasses
    rm -f "$pkgdir"/usr/share/mime/treemagic
    rm -f "$pkgdir"/usr/share/mime/types
    rm -f "$pkgdir"/usr/share/mime/version
}
