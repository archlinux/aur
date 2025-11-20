# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
_base=SciencePlots
pkgname=python-${_base,,}
pkgdesc="Format Matplotlib for scientific plotting"
pkgver=2.2.0
pkgrel=1
arch=(any)
url="https://github.com/garrettj403/${_base}"
license=(MIT)
depends=(python-matplotlib)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f8bd91f86f4034ea5d4fc2343649553c95be7d88c80e42d0506193ef8aef4a6ebb35cbb7413c93b15490d8db89c3eb8bfb268a7fc60b5404d572e33d9c3cf055')
conflicts=(python-${_base,,}-git)

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
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
