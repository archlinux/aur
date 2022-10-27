# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nutils-SI
pkgname=python-${_base,,}-git
pkgdesc="Framework for physical units"
pkgver=20220909
pkgrel=1
arch=('x86_64')
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-flit-core python-installer git)
checkdepends=(python-numpy python-pytest)
source=(git+${url}.git#branch=main)
sha512sums=('SKIP')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})

pkgver() {
  cd ${_base}
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
