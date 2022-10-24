# Maintainer: otaj
# If you also want to test GPU portion of the package, set this to 1. Make sure you have a capable GPU with large enough memory 
TEST_GPU=0

pkgname=python-kornia-git
_name=kornia
pkgver=0.6.8.r9.g1d6923db
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pytest-runner')
depends=('python-pytorch')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mypy' 'python-pytest-flake8' 'python-scipy' 'python-opencv')
provides=('python-kornia')
conflicts=('python-kornia')
options=(!emptydirs)
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}"
  make test-cpu
  if ! [ "$TEST_GPU" -eq "0" ] ; then
    make test-cuda
  fi
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
