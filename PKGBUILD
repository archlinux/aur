# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pypi_name=SimpleSQLite
_name=${_pypi_name,,}

pkgname=python-${_name,,}
pkgver=1.5.4
pkgrel=1
pkgdesc='Simplify SQLite database operations'
arch=('any')
url="https://github.com/thombashi/${_pypi_name}"
license=('MIT')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
depends=(
  'python-dataproperty'
  'python-mbstrdecoder'
  'python-pathvalidate'
  'python-sqliteschema'
  'python-tabledata'
  'python-typepy')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('7007d2abed75f2f9b0f1e544a9af2b6d0bd341d8b5519446708e6595ea092d4c')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "${_name}-$pkgver"

  python -m build --wheel --no-isolation

  rst2man README.rst "$pkgname.7"
}

package() {
  cd "${_name}-$pkgver"

  export PYTHONHASHSEED=0
  python -m installer --destdir="$pkgdir/" dist/*.whl

  install -Dm644 "$pkgname.7" -t "$pkgdir/usr/share/man/man7/"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/${_name}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
