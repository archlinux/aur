# Maintainer: William J. Bowman <aur@williamjbowman.com>

_pkgname=s3ql
pkgname=s3ql-hg
pkgver=r2760.bd156222419a
pkgrel=2
pkgdesc="A full-featured file system for online data storage."
arch=('i686' 'x86_64')
url="https://bitbucket.org/nikratio/s3ql/overview"
license=('GPL3')
depends=('python' 'python-apsw' 'python-crypto' 'python-defusedxml' 'python-dugong>=3.2'
         'python-llfuse>=0.43' 'python-requests')
makedepends=('gcc' 'cython' 'python-sphinx')
source=(s3ql::hg+https://bitbucket.org/nikratio/s3ql)
md5sums=('SKIP')
provides=('s3ql')
conflicts=('s3ql')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$_pkgname"

  python setup.py build_cython
  python setup.py build_ext --inplace
  python setup.py build_sphinx
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir" --optimize=1

  install -d -m 755 "$pkgdir/usr/share/doc/$_pkgname"
  install    -m 744 doc/manual.pdf "$pkgdir/usr/share/doc/$_pkgname/manual.pdf"

  # Install the text versions of the docs and contrib. These can be recursive, so
  # `install' isn't particularly useful.
  cp -r contrib rst "$pkgdir/usr/share/doc/$_pkgname/"
  chown -R root:root "$pkgdir/usr/share/doc/$_pkgname/"
  find "$pkgdir/usr/share/doc/$_pkgname" -type f -exec chmod 'g-w,g+r,o-w,o+r' '{}' ';'
}
