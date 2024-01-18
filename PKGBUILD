# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>
_base=uqbar
pkgname=python-${_base}
pkgver=0.7.1
pkgrel=1
pkgdesc="Tools for building documentation with Sphinx, Graphviz and LaTeX"
arch=(any)
url="https://github.com/josiah-wolf-oberholtzer/${_base}"
license=(MIT)
depends=(python-sphinx python-unidecode python-black)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov graphviz)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('78023f79d793763723203f056476181cf2cfe4bd93ceda60efafbc975635c8023d2323c4e7be2fc6700d3b30381c79aa7683f36991d0da6947776f219e0fdfe8')

prepare() {
  cd ${_base}-${pkgver}
  sed -i '/sphinx_immaterial/d' docs/source/conf.py
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  PYTHONPATH="$PWD" make -C docs man
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not find_executable'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "docs/build/man/${_base}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
