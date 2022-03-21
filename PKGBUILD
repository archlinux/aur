# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

pkgname=python-dataproperty
pkgver=0.55.0
pkgrel=1
pkgdesc='Extract properties from data'
arch=('any')
url='https://github.com/thombashi/DataProperty'
license=('MIT')
depends=('python-mbstrdecoder' 'python-typepy')
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/D/DataProperty/DataProperty-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/D/DataProperty/DataProperty-$pkgver.tar.gz.asc")
sha256sums=('73ccf10f8b123968210438a1a1aa859ea6d5a16b4e1f4d307da7a81b838e79fa'
            'SKIP')
validpgpkeys=('BCF9203E5E80B5607EAE6FDD98CDA9A5F0BFC367')

build() {
  cd "DataProperty-$pkgver"
  python -m build --wheel --no-isolation
  rst2man README.rst "$pkgname.7"
}

check() {
  cd "DataProperty-$pkgver"
  PYTHONPATH=./ pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "DataProperty-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 "$pkgname.7" -t "$pkgdir/usr/share/man/man7/"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/DataProperty-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
