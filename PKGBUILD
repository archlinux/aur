# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Ben Greiner <code-arch@bnavigator.de>

pkgname=python38-scikit-build
pkgver=0.16.2
pkgrel=1
pkgdesc="Improved build system generator for CPython C, C++, Cython and Fortran extensions"
arch=(any)
url="https://scikit-build.org"
license=(MIT)
depends=(cmake python38-distro python38-packaging python38-setuptools python38-wheel)
makedepends=(git python38-setuptools-scm)
checkdepends=(
    cython
    gcc
    gcc-fortran
    ninja
    python38-build
    python38-path
    python38-pytest
    python38-pytest-mock
    python38-pytest-runner
    python38-pytest-virtualenv
    python38-requests
    python38-six
    python38-virtualenv
)
_tag=f15effa826c77c8be7b208d6681c87086ba461fb # git rev-parse ${pkgver}
source=(git+https://github.com/scikit-build/scikit-build.git#tag=${_tag}?signed)
sha256sums=('SKIP')
validpgpkeys=(2FDEC9863E5E14C7BC429F27B9D0E45146A241E8) # Henry Schreiner <hschrein@cern.ch>

build() {
  cd scikit-build
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python3.8 setup.py build_ext --inplace
  python3.8 setup.py build
}

check() {
  cd scikit-build
  # Disable coverage
  sed -i 's|\"--cov\"\, \"--cov-report=xml\"||' noxfile.py
  # Tests need a rw version of site-packages
  python3.8 -m venv --system-site-packages test-env
  # https://github.com/scikit-build/scikit-build/issues/727
  test-env/bin/python /usr/bin/pytest -vv --color=yes || echo "Tests failed"
}

package() {
  cd scikit-build
  python3.8 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
