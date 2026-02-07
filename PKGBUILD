# Contributor: haxibami <contact at haxibami dot net>
# Contributor: jerry73204 <jerry73204 at google gmail>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-asn1
pkgver=3.2.0
pkgrel=1
pkgdesc='ASN.1 encoder/decoder'
arch=('any')
url='https://github.com/andrivet/python-asn1'
license=('MIT')
depends=('python')
makedepends=(
  'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2d67c5e8f0c88c0612e321af84e8d598bfa51869f9a9597b8d08d355880e9d3e')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '1,3d' setup.cfg
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
  sphinx-build -b man docs/ docs/_build/man
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH="$PWD/src" pytest -x tests
}

package_python-asn1() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "docs/_build/man/${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
