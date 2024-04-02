# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=arm-preprocessing
pkgname=python-${_base}
pkgver=0.2.2
pkgrel=1
pkgdesc="Implementation of several preprocessing techniques for Association Rule Mining"
url="https://github.com/firefly-cpp/${_base}"
arch=(any)
license=(MIT)
depends=(python-niaarm python-sport-activities-features python-scikit-learn)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ad362a1ffa2b493b55f8a150b5febb6b9289c6badf6411ae7b997bb64e6ed52597c007b8c26ea8d6770e2a4ccf3b4fedf7099f7c48135f856be45c89fdccc346')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
