# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=3.2.1
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
md5sums=('682fe6a11ba004728aad1784e4a3da09')
sha256sums=('7b30a59cf663489b19edc3109909ab6a05ad4c78e4b781c97e92ab9b819837d1')

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
