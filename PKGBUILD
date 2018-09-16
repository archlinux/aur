# Maintainer: Mattéo Delabre <bonjour@matteodelabre.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfigstudio
pkgver=1.2.2
pkgrel=1
pkgdesc="Professional vector animation program (GUI)"
arch=(x86_64)
url="https://synfig.org"
license=('GPL2')
depends=('gtkmm3' 'synfig' 'sdl_image')
makedepends=('openexr' 'libmagick6' 'xorg-fonts-100dpi' 'xorg-fonts-75dpi'
             'xorg-fonts-misc' 'xorg-fonts-type1' 'intltool' 'imagemagick')
source=(
    "https://github.com/synfig/synfig/releases/download/v$pkgver/source-ETL-$pkgver.tar.gz"
    "https://github.com/synfig/synfig/releases/download/v$pkgver/source-$pkgname-$pkgver.tar.gz")
sha256sums=(
    '0dc19c5a6c9e964054ca3af6dacd6ab0c198d78071cfab2aebac178afe454d8b'
    '76fa37998af634cf694f9b5bdfcb90220bc88f8527df117d9282a39fe01489e2')

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
