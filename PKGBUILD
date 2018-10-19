# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbpdf-git
pkgver=r94.dfe9f00
pkgrel=1
epoch=
pkgdesc="A small framebuffer pdf viewer, based on MuPDF."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('ISC')
groups=()
depends=('mupdf' 'libmupdf' 'mujs' 'poppler' 'djvulibre' 'openjpeg2')
makedepends=('git')
optdepends=('poppler' 'djvulibre')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=fbpdf-git.install
source=("$pkgname::git+git://repo.or.cz/fbpdf.git"
        'fbpdf.1')
noextract=()
md5sums=('SKIP'
         'ae7299de0fcd8e945940b014ba335c1b')
sha1sums=('SKIP'
          'f9a0cc6beb0e118b1116e08c5a0b91a028f8177e')
sha256sums=('SKIP'
            '157e29d7bacf906762a003271b189ca93f51c5f5cfad25e469ec4936c4d8cf5e')
pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's/-lmupdf-pkcs7 -lmupdf-threads/-lfreetype -lharfbuzz -lz -ljbig2dec -ljpeg -lopenjp2/' Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make LDFLAGS="-lharfbuzz" all
  make fbpdf2
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 fbpdf $pkgdir/usr/bin/neatfbpdf
  install -Dm755 fbpdf2 $pkgdir/usr/bin/fbpdf2
  install -Dm755 fbdjvu $pkgdir/usr/bin/fbdjvu
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 $srcdir/fbpdf.1 $pkgdir/usr/share/man/man1/fbpdf.1
}

