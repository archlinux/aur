# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: aksr <aksr at t-com dot me>
pkgname=fbpdf-git
pkgver=r102.6276360
pkgrel=1
pkgdesc="A small framebuffer pdf viewer, based on MuPDF."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('ISC')
depends=('libmupdf' 'mujs' 'freetype2' 'gumbo-parser' 'harfbuzz' 'jbig2dec' 'libjpeg' 'djvulibre' 'openjpeg2')
makedepends=('git')
provides=('fbpdf')
conflicts=('fbpdf')
source=("$pkgname::git+git://repo.or.cz/fbpdf.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    sed -i 's/-lmupdf-pkcs7 -lmupdf-threads/-lfreetype -lharfbuzz -lz -ljbig2dec -ljpeg -lopenjp2 -lgumbo/' Makefile
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    # avoid conflict with fbida package
    install -Dm755 fbpdf $pkgdir/usr/bin/fbpdf-mupdf
    install -Dm755 fbdjvu $pkgdir/usr/bin/fbdjvu
    install -Dm644 fbpdf.1 $pkgdir/usr/share/man/man1/fbpdf.1
}
