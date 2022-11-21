# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
_base=SciencePlots
pkgname=python-${_base,,}-git
pkgdesc="Matplotlib styles for scientific plotting"
pkgver=2.0.0.r0.g65da69c
pkgrel=1
arch=(any)
url="https://github.com/garrettj403/${_base}"
license=(MIT)
depends=(python-matplotlib python-setuptools)
makedepends=(python-build python-installer python-wheel git)
source=(git+${url}.git#branch=master)
sha512sums=('SKIP')
provides=(python-${_base,,})
conflicts=(python-${_base,,})

pkgver() {
  cd ${_base}
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}"-*.dist-info/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
