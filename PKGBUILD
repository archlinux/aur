# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dcrdocs
pkgver=20160623
pkgrel=1
pkgdesc="Documentation for Decred"
arch=('any')
makedepends=('git' 'python-virtualenv')
optdepends=('darkhttpd: serve static webpages')
groups=('decred')
url="https://docs.decred.org"
license=('ISC')
source=($pkgname-$pkgver::git+https://github.com/decred/dcrdocs)
sha256sums=('SKIP')
install=dcrdocs.install

pkgver() {
  cd "$srcdir/$pkgname-$pkgver"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  virtualenv .
  bin/pip \
    --isolated \
    --no-cache-dir \
    --disable-pip-version-check \
    install \
    https://github.com/mkdocs/mkdocs/archive/master.zip \
    python-markdown-math \
    mkdocs-bootswatch
  bin/mkdocs build --clean
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/dcrdocs"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/srv/http/dcrdocs"
  cp -dpr --no-preserve=ownership site/* "$pkgdir/srv/http/dcrdocs"
}
