# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ninja-python-distributions
pkgname=python-${_base%%-*}
pkgdesc="Ninja is a small build system with a focus on speed"
pkgver=1.11.1.1
pkgrel=1
arch=(any)
url="https://github.com/scikit-build/${_base}"
license=(Apache)
depends=(python)
makedepends=(python-build python-installer python-scikit-build)
provides=(${_base%%-*})
conflicts=(${_base%%-*})
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d76c472917fb89a70ab42b89106b6869bc721e01cde18387f12f8c8c493f7119b234f5857d616da4016406486bd2644f8126ae097f9924c4b894b173a09ee7df')

build() {
  cd ${_base}-${pkgver}
  CMAKE_GENERATOR="Unix Makefiles" python -m build --wheel --skip-dependency-check --no-isolation
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
