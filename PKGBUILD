# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pypi_name=pytablereader
_name=${_pypi_name,,}

pkgname=python-${_name,,}
pkgver=0.31.4
pkgrel=1
pkgdesc='Python library to read a table in various formats'
arch=('any')
url="https://github.com/thombashi/${_pypi_name}"
license=('MIT')
makedepends=(
  'git'
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-sphinx'
  'python-sphinx_rtd_theme')
depends=(
  'python-dataproperty'
  'python-mbstrdecoder'
  'python-pathvalidate'
  'python-tabledata'
  'python-tcolorpy'
  'python-typepy'
  'python-xlsxwriter'
  'python-simplejson'
  'python-yaml'
  'python-toml'
  'python-xlwt'
  'python-ipykernel'
  ## for python-typepy['dateutil']
  'python-pytz'
  'python-pytest'
  'python-dateutil')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('ad97308308525cafe0eaa4b6a80a02499e0b4c6c979efb17452d302ad78bd5b1')
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
