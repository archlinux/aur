# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pypi_name=DataProperty
_name=${_pypi_name,,}

pkgname=python-${_name,,}
pkgver=1.1.1
pkgrel=1
pkgdesc='Extract properties from data'
arch=('any')
url="https://github.com/thombashi/${_pypi_name}"
license=('MIT')
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-docutils'
  'python-pygments')
checkdepends=(
  'python-pytest'
  'python-termcolor'
  'python-dateutil'
  'python-pytz')
depends=(
  'python-mbstrdecoder'
  'python-typepy')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('a83af82a234edda5378a36fb092bc90dd554646c5e58202a310acf468ae81bc8')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "${_name}-$pkgver"

  python -m build --wheel --no-isolation

  rst2man README.rst "$pkgname.7"
}

check() {
  cd "${_name}-$pkgver"

  PYTHONPATH=./ pytest -x --disable-warnings
}

package() {
  cd "${_name}-$pkgver"

  export PYTHONHASHSEED=0
  python -m installer --destdir="$pkgdir/" dist/*.whl

  install -Dm644 "$pkgname.7" -t "$pkgdir/usr/share/man/man7/"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
