# Maintainer: Hans Kramer <aur@tiefengrund.info>

pkgname=pdfcrack-git
pkgver=0.21.1.r0.g6b340d7
pkgrel=1
pkgdesc="PDF files password cracker"
arch=('x86_64')
url="http://pdfcrack.sf.net/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('pdfcrack')
conflicts=('pdfcrack')

source=("git+https://salsa.debian.org/debian/pdfcrack.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pdfcrack"

  local d
  d=$(git describe --long --tags --abbrev=7 2>/dev/null) || {
    printf "0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    return
  }

  d=${d##*/}

  printf '%s' "$d" \
    | sed -E 's/^v//; s/([^-]+)-([0-9]+)-g([0-9a-f]+)/\1.r\2.g\3/; s/[^0-9A-Za-z.+~]/./g'
}

build() {
  cd "$srcdir/pdfcrack"
  make
}



package() {
  install -Dm755 "$srcdir/pdfcrack/pdfcrack" "$pkgdir/usr/bin/pdfcrack"

  # docs (optional)
  install -Dm644 "$srcdir/pdfcrack/README" "$pkgdir/usr/share/doc/$pkgname/README" || true
  install -Dm644 "$srcdir/pdfcrack/TODO"   "$pkgdir/usr/share/doc/$pkgname/TODO"   || true
  install -Dm644 "$srcdir/pdfcrack/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING" || true
}

