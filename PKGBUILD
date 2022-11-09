# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ninja-python-distributions
pkgname=python-${_base%%-*}
pkgdesc="Ninja is a small build system with a focus on speed"
pkgver=1.11.1
pkgrel=1
arch=(any)
url="https://github.com/scikit-build/${_base}"
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-scikit-build)
provides=(${_base%%-*})
conflicts=(${_base%%-*})
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('741b33d0f065dfccf6164c3436d88b770ca0307d4d71932f1ab63cc3335cba49a6639c6e15277f3c16de0246bd79dadf4ae0e9d34533a505dcd9d101703dbf0b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base%%-*}-${pkgver}.dist-info/LICENSE_Apache_20" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
