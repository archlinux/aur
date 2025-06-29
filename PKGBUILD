# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>
_base=sphinxcontrib-katex
pkgname=python-${_base}
pkgver=0.9.11
pkgrel=1
pkgdesc="A Sphinx extension for rendering math in HTML pages"
arch=(any)
url="https://github.com/hagenw/${_base}"
license=(MIT)
depends=(python-sphinx)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-sphinx-insipid-theme)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('64f29bbd31f95669be86b1bee7bb09ef4e45be578e6b04670bcb476a77d85101dedbdb519fc71c212bad9785ef754bae7b6d59801be5343e1ce236dc10c8a128')

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
