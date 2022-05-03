# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: Greg Fitzgerald <gregf@hugops.pw>

pkgname=python-pocket
_pkg=${pkgname#python-}
pkgver=0.3.7
pkgrel=2
pkgdesc="API wrapper for getpocket.com"
url='https://github.com/tapanpandita/pocket'
license=('BSD')
arch=('any')
depends=('python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('43af3e06769bb6b65f2145802fdaf60e92b34135813f2b01c3e736d89d90d22f')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg-$pkgver"
  python -m unittest test_pocket.py
}

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/$_pkg-$pkgver.dist-info/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: sts=2 sw=2 et ft=PKGBUILD
