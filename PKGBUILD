pkgname=git-deps
depends=(git python python-flask python-pygit2 python-setuptools python-wheel)
pkgver=1.1.0
pkgrel=1
pkgdesc='git commit dependency analysis tool'
arch=(any)
url=https://github.com/aspiers/git-deps
license=(GPL2)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.zip)
sha512sums=('74880f9427cc94a1cc14236334774f09b5005f29d8310ea8cd75c9d8045018c5618090c5d8aa44e13f70c37d14c6a693db1054c968d936ca69d3971103c61d5a')

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
