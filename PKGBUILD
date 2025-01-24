# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: aksr <aksr at t-com dot me>
pkgname=fbpdf-git
pkgver=r107.6a0d77f
pkgrel=1
pkgdesc="A small framebuffer pdf viewer, based on MuPDF."
arch=('i686' 'x86_64')
url="https://github.com/aligrudi/fbpdf"
license=('ISC')
depends=('libmupdf' 'djvulibre')
makedepends=('git')
provides=('fbpdf')
conflicts=('fbpdf')
source=(
    "$pkgname::git+git://repo.or.cz/fbpdf.git"
    "build.patch"
)
sha256sums=('SKIP' 'c1994cb64bd67112640e2d895caf5bbd52bbc4581f8fcc6691f57df5405b2374')

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
    make fbpdf fbdjvu
}

package() {
    cd "$srcdir/$pkgname"
    # avoid conflict with fbida package
    install -Dm755 fbpdf $pkgdir/usr/bin/fbpdf-mupdf
    install -Dm755 fbdjvu $pkgdir/usr/bin/fbdjvu
    install -Dm644 fbpdf.1 $pkgdir/usr/share/man/man1/fbpdf.1
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
