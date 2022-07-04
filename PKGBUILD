# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=python-datetimerange
_pkg=DateTimeRange
pkgver=1.2.0
pkgrel=2
pkgdesc='Python library for handling time ranges'
arch=('any')
url='https://github.com/thombashi/DateTimeRange'
license=('MIT')
depends=('python-dateutil' 'python-typepy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/D/$_pkg/$_pkg-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/D/$_pkg/$_pkg-$pkgver.tar.gz.asc")
sha256sums=('47bc10e5df23bb1f0d3ee493a26cb8d1d99e179884aabff62d3e51033b6a73ce'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

## FIXME: test downloads external dependencies
check() {
  cd "$_pkg-$pkgver"
  PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
