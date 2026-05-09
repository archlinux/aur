# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pypi_name=sqliteschema
_name=${_pypi_name,,}

pkgname=python-${_name,,}
pkgver=2.0.1
pkgrel=1
pkgdesc='Dump table schema of a SQLite database file'
arch=('any')
url="https://github.com/thombashi/${_pypi_name}"
license=('MIT')
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel')
depends=(
  'python-pytablewriter'
  'python-mbstrdecoder'
  'python-tabledata'
  'python-typepy')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('d70a02d80f5c09d321632213bf957467909593fd462e5a37df66244ab6304c33')
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
