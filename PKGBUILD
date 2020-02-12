# Maintainer: Kazuki Sawada <kazuki@6715.jp>
# Contributor: William J. Bowman <aur@williamjbowman.com>

_pkgname=s3ql
pkgname=$_pkgname-git
pkgver=3.3.2.22.gfa48c94d
pkgrel=1
pkgdesc="A full-featured file system for online data storage."
arch=('i686' 'x86_64')
url="https://github.com/s3ql/s3ql/"
license=('GPL3')
depends=(
  'python'
  'python-cryptography'
  'python-defusedxml'
  'python-apsw'
  'python-trio'
  'python-pyfuse3'
  'python-dugong'
  'python-systemd'
  'python-requests'
  'python-google-auth'
  'python-google-auth-oauthlib'
)
makedepends=(
  'gcc'
  'cython'
  'python-sphinx'
  'texlive-latexextra'
)
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname-hg)
source=(git+https://github.com/s3ql/s3ql.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe | sed 's/release-//; s/[_-]/./g'
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
