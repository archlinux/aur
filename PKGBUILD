# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>
_base=sphinxcontrib-katex
pkgname=python-${_base}
pkgver=0.9.10
pkgrel=1
pkgdesc="A Sphinx extension for rendering math in HTML pages"
arch=(any)
url="https://github.com/hagenw/${_base}"
license=(MIT)
depends=(python-sphinx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-sphinx-insipid-theme)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f48e7ecdaea9e274ce7c2ae8695c81d99c6f520d14c948d75cf4179f0851e75510bfb39b63dbf61c7b9d342dbb740025d5af877ef17b9f87e5659c470dd22ee3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m sphinx docs docs/_build/ -c docs/ -b html -W
#   test-env/bin/python -m sphinx docs docs/_build/ -c docs/ -b latex -W
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # https://github.com/hagenw/sphinxcontrib-katex/issues/86
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "${pkgdir}${site_packages}"/docs

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
