# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=diesel
pkgver=3.0.24
pkgrel=1
pkgdesc="Greenlet-based event I/O Framework for Python"
arch=('any')
depends=('libffi'
         'python2'
         'python2-dnspython'
         'python2-flask'
         'python2-greenlet'
         'python2-http-parser'
         'python2-pyopenssl'
         'python2-twiggy')
makedepends=('make' 'python2-distribute' 'python2-sphinx')
optdepends=('python2-palm: lightweight, fast library for using protobufs in Python')
url="http://diesel.io"
license=('custom')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/dieseldev/$pkgname/tar.gz/$pkgname-$pkgver)
sha256sums=('75a5f63a93755aa12f39a3dacff95b854738c77b0f26cf94efa8c973f5adf1fb')

prepare() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg2 'Building...'
  python2 setup.py build

  msg2 'Building man pages...'
  make man -C doc/
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg2 'Installing user manual...'
  for _manpage in `find doc/_build/man/ -type f -name "*.1" -printf '%f\n'`; do
    install -Dm 644 doc/_build/man/$_manpage "$pkgdir/usr/share/man/man1/$_manpage"
  done

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
  cp -dpr --no-preserve=ownership doc examples README.rst TODO TOTEST \
    "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
