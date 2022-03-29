# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sqlitebiter
pkgver=0.36.1
pkgrel=1
pkgdesc='Converts tabular formats into a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqlitebiter'
license=('MIT')
depends=(
  'jupyter-nbformat'
  'python-appconfigpy'
  'python-click'
  'python-envinfopy'
  'python-loguru'
  'python-msgfy'
  'python-path'
  'python-pathvalidate'
  'python-pytablereader'
  'python-retryrequests'
  'python-simplesqlite'
  'python-tcolorpy'
  'python-typepy')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
checkdepends=(
  'python-pytest'
  'python-responses'
  'python-sqliteschema' ## AUR
  'python-xlrd'
  'python-xlsxwriter')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('60516bda8aa5f2b560359538f289b6453dad2f05cf491ff81d4294859b2ce3ba'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

## FIXME: upstream tests fail
check() {
  cd "$pkgname-$pkgver"
  PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/$pkgname-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
