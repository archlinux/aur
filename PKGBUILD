# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-opack
_pkgname="${pkgname#python-}"
pkgver=0.1.0
pkgrel=1
pkgdesc='Python library for parsing the opack format'
arch=('any')
url='https://github.com/loriwitt/opack'
license=('GPL3')
depends=('python' 'python-arrow' 'python-construct')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('96c389f7f96aeb64d07a2b220acdacead9b971d6490260747c7d7bc76a778b4e')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # See: https://github.com/loriwitt/opack/issues/6
  sed -i 's|pymobiledevice3|opack|g' pyproject.toml
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
