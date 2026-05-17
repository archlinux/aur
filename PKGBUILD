# Contributor: haxibami <contact at haxibami dot net>
# Contributor: jerry73204 <jerry73204 at google gmail>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-asn1
pkgver=3.3.0
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
sha256sums=('315936416524cdb742e12fa7056a48171c406ee1b78994fbba742edd9834fa8a')

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
