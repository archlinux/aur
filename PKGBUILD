# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=finitediffx
pkgname=python-${_base}
pkgdesc="Finite difference tools in JAX"
pkgver=0.1.0
pkgrel=1
arch=(any)
url="https://github.com/ASEM000/${_base}"
license=(Apache-2.0)
depends=(python-jax)
makedepends=(python-build python-setuptools python-installer python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('7e85c4edf20422c38563be5e0b9b3bef76c64a001959b57bd65fc2f6495b1da8f47236cb36bae2c73898680b48326c8bb468a80304c225149f5f1f9a1d41c4b3')

prepare() {
  # WARNING Found 'build-systems' in pyproject.toml, did you mean 'build-system'?
  sed -i 's/systems/system/' ${_base}-${pkgver}/pyproject.toml
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
