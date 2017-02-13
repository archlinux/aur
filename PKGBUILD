# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrdocs
pkgver=20170209
pkgrel=1
pkgdesc="Documentation for Decred"
arch=('any')
makedepends=('git' 'python')
optdepends=('darkhttpd: serve static webpages')
groups=('decred')
url="https://docs.decred.org"
license=('ISC')
source=(git+https://github.com/decred/dcrdocs)
sha256sums=('SKIP')
install=dcrdocs.install

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "$srcdir/$pkgname"

  msg2 'Building...'
  python -m venv .
  bin/pip \
    --isolated \
    --no-cache-dir \
    --disable-pip-version-check \
    install \
    https://github.com/mkdocs/mkdocs/archive/master.zip \
    fontawesome-markdown \
    mkdocs-bootswatch \
    python-markdown-math
  bin/mkdocs build --clean
}

package() {
  cd "$srcdir/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/dcrdocs"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/srv/http/dcrdocs"
  cp -dpr --no-preserve=ownership site/* "$pkgdir/srv/http/dcrdocs"
}
