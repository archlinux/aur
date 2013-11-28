# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=3.5
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=('python2' 'python2-pillow' 'python2-pyqt4')
makedepends=('python2-cx_freeze')
optdepends=(
  'kindlegen: for .mobi generation'
  'unrar: for CBR/RAR support'
)
options=(!strip)
source=(https://github.com/ciromattia/$pkgname/archive/$pkgver.tar.gz)
md5sums=('dfa06844b8490af132d364b8481a56d5')
sha256sums=('0b892aa7461250ab4f186ce1d27289a1c81837a0238ced1902c9bd6cfca82b4c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  cd "$pkgdir/usr/bin"
  for s in comic2ebook comic2panel; do
    sed -i 's@^#!/usr/bin/env python$@#!/usr/bin/env python2@' \
      ../lib/python2.7/site-packages/kcc/$s.py
    ln -s ../lib/python2.7/site-packages/kcc/$s.py $s
    chmod +x $s
  done
}
