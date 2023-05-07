# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=nbtutor
pkgdesc="Visualize Python code execution in Jupyter Notebook cells"
pkgver=2.0.3
pkgrel=3
arch=(any)
url="https://github.com/lgpage/${pkgname}"
license=('custom:BSD-3-clause')
depends=(jupyter-notebook)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f55b69ce96c449ad7a1a623135ef94c6b54894680925cce14ea08ab5d1f409a17cd6c59876a8a2f6e8b63206b58c5afb2610c60c2fb2aebe0c0a8084599aebfd')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  env PYTHONPATH="$pkgdir${site_packages}:PYTHONPATH" \
    JUPYTER_PATH="$pkgdir/usr/" \
    jupyter-nbextension install ${pkgname} --py --prefix="$pkgdir/usr/" --overwrite
  install -Dm 644 LICENCE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
