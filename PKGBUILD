pkgname=git-deps
depends=(git python python-flask python-pygit2 python-setuptools)
pkgver=1.0.1
pkgrel=1
pkgdesc='git commit dependency analysis tool'
arch=(any)
url=https://github.com/aspiers/git-deps
license=(GPL2)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('e298304442184362cf4bb2216314c1d4bbdb9a69a3197b32b6a7d62ba630a73f60e531b5e2c0ad169885cab2fbecabe3a20cc5cdfba505570bc76bf3b997ef1b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README"

  # The only thing from node_modules that is actually required is d3.min.js, so
  # nuke the rest.
  find "$pkgdir" -path '*/node_modules/*' \
    \( -type f ! -name d3.min.js -delete -o \
       -type d ! -path '*/node_modules/d3' -exec rmdir {} + \)
}

# Depends on having the git repo instead of just the source tarball.
#
#checkdepends=(python-pytest python-pytest-cov)
#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  python setup.py test
#}
