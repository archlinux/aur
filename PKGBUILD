# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>
_base=uqbar
pkgname=python-${_base}
_pkgver=7.0.0
pkgver=0.7.0
pkgrel=1
pkgdesc="Tools for building documentation with Sphinx, Graphviz and LaTeX"
arch=(any)
url="https://github.com/josiah-wolf-oberholtzer/${_base}"
license=(MIT)
depends=(python-sphinx python-unidecode python-black)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov graphviz)
source=(${pkgname}-${_pkgver}.tar.gz::${url}/archive/v${_pkgver}.tar.gz)
sha512sums=('a63e9d6c805e77d98b2dd971b89d6d63f1dd80c4ce67a7df418246614348c5f9fa7361eb10acb983ca05357c51c637a4dd384b3789cbeddad3d8bf85ae9439aa')

prepare() {
  cd ${_base}-${_pkgver}
  sed -i '/sphinx_immaterial/d' docs/source/conf.py
}

build() {
  cd ${_base}-${_pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  PYTHONPATH="$PWD" make -C docs man
}

check() {
  cd ${_base}-${_pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not find_executable'
}

package() {
  cd ${_base}-${_pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "docs/build/man/${_base}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
