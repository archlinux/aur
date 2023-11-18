# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: aksr <aksr at t-com dot me>
pkgname=fbpdf-git
pkgver=r102.6276360
pkgrel=2
pkgdesc="A small framebuffer pdf viewer, based on MuPDF."
arch=('i686' 'x86_64')
url="https://github.com/aligrudi/fbpdf"
license=('ISC')
depends=('libmupdf' 'poppler' 'mujs' 'freetype2' 'gumbo-parser' 'harfbuzz' 'jbig2dec' 'libjpeg' 'djvulibre' 'openjpeg2')
makedepends=('git')
provides=('fbpdf')
conflicts=('fbpdf')
source=(
    "$pkgname::git+git://repo.or.cz/fbpdf.git"
    "build.patch"
)
sha256sums=('SKIP' '660ab4a0a459a00abeeab14547c093fcb21de79df230dcf40a12df5d13b65171')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < ../build.patch
}

build() {
    cd "$srcdir/$pkgname"
    make fbpdf fbpdf2 fbdjvu
}

package() {
    cd "$srcdir/$pkgname"
    # avoid conflict with fbida package
    install -Dm755 fbpdf $pkgdir/usr/bin/fbpdf-mupdf
    install -Dm755 fbpdf2 $pkgdir/usr/bin/fbpdf2
    ln -sf $pkgdir/usr/bin/fbpdf2 $pkgdir/usr/bin/fbpdf-poppler
    install -Dm755 fbdjvu $pkgdir/usr/bin/fbdjvu
    install -Dm644 fbpdf.1 $pkgdir/usr/share/man/man1/fbpdf.1
}
