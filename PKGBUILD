# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Plano-Lesay <kernald@enoent.fr>
_base=url-normalize
pkgname=python-${_base}
pkgdesc="URL normalization for Python"
pkgver=1.4.3
pkgrel=3
arch=('x86_64')
url="https://github.com/niksite/${_base}"
license=(MIT)
depends=(python-six)
makedepends=(
  python-pip
  python-poetry
)
checkdepends=(
  python-pytest
  python-tox
)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('46eaa1753b37e89d56cb19818144a7cf5b38653811720eb506732c35bb3732ef0c556420b22a9ee2c08e70e5b408aab7f44cea5e15d1ebe3d717c0c77706bfb8')

build() {
  cd "${_base}-${pkgver}"
  poetry build --format wheel
}

check() {
  cd "${_base}-${pkgver}"
  tox -e py39
}

package() {
  cd "${_base}-${pkgver}"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
