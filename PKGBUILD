# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
_base=SciencePlots
pkgname=python-${_base,,}
pkgdesc="Format Matplotlib for scientific plotting"
pkgver=2.2.0
pkgrel=4
arch=(any)
url="https://github.com/garrettj403/${_base}"
license=(MIT)
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest texlive-latexextra texlive-fontsrecommended)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz
  styles.patch::${url}/pull/152.patch)
sha512sums=('f8bd91f86f4034ea5d4fc2343649553c95be7d88c80e42d0506193ef8aef4a6ebb35cbb7413c93b15490d8db89c3eb8bfb268a7fc60b5404d572e33d9c3cf055'
  '0e3c7f92e949df525925b972f9e94b31bafe76cfe08f9772e5f3cf944746e65ff093aa305d368433441c20317d73ed7a126a972b6cb357d3059419cfef71106f')
conflicts=(python-${_base,,}-git)

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../styles.patch
}

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
