# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-base-url
pkgname=python-${_base}
pkgdesc="pytest plugin for URL based testing"
pkgver=2.1.0
pkgrel=1
arch=(any)
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest python-requests)
makedepends=(python-build python-installer python-hatch-vcs python-wheel)
checkdepends=(python-pytest-localserver)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d5747f7ab7f7995f3b822b9770f9194132f1fff5636c5deaf24fae4d5be054a3eb6512ac09b1e9fc5a6d93d31ab05f9ee4df76f1c2d00c5cb200b81ef2750b43')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not metadata and not url_fails'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
