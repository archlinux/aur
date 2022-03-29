# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_name=SimpleSQLite

pkgname=python-simplesqlite
pkgver=1.3.0
pkgrel=2
pkgdesc='Simplify SQLite database operations'
arch=('any')
url='https://github.com/thombashi/SimpleSQLite'
license=('MIT')
depends=(
  'python-dataproperty'
  'python-mbstrdecoder'
  'python-pathvalidate'
  'python-sqliteschema'
  'python-tabledata'
  'python-typepy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=(
  'python-pytablereader'
  'python-pytablewriter'
  'python-pytest'
  'python-dateutil'
  'python-pytz'
  # 'python-path<13'
  ## yes these are required...
  'python-pytest-md-report'
  'python-pytest-discord')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz.asc")
sha256sums=('f7e862bec5982059e665cc73b6fdb4c8340a1f565ba3497387c3c48f10d43bf8'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

## FIXME: pytest pulls path.py<13 because Arch no longer packages this version
check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/$_name-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
