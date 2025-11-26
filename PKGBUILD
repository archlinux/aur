# Maintainer: Smoolak <smoolak [at] gmail.com>.

_pkgname=imagededup
pkgname=python-imagededup-git
pkgver=0.3.3.post2.0.gf0534a6
pkgrel=1
pkgdesc="Python library to find duplicate images using hashing and CNNs"
arch=('x86_64')
url="https://github.com/idealo/imagededup"
license=('Apache')
depends=(
  'python'
  'python-numpy'
  'python-scipy'
  'python-scikit-learn'
  'python-pillow'
  'python-pytorch'
  'python-torchvision'
  'python-pywavelets'
  'python-tqdm'
  'python-matplotlib'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'cython'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
)
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("git+https://github.com/idealo/imagededup.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver
  ver=$(git describe --tags --long 2>/dev/null | sed 's/^v//' || git rev-parse --short HEAD)
  printf '%s\n' "${ver//-/.}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}"

  local build_lib
  build_lib=$(find build -maxdepth 2 -type d -name "lib.*" | head -n1)

  if [[ -n "$build_lib" ]]; then
    export PYTHONPATH="${build_lib}:${PWD}:${PYTHONPATH}"
  else
    echo "WARNING: could not find build lib directory; tests may fail."
  fi

  pytest
}

package() {
  cd "${srcdir}/${_pkgname}"

  local wheel
  wheel=$(ls dist/*.whl | head -n1)
  python -m installer --destdir="${pkgdir}" "${wheel}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
