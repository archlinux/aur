# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=imagededup
pkgname=python-imagededup-git
pkgver=0.3.3.post2.0.gf0534a6
pkgrel=2
pkgdesc="Python library to find duplicate images using hashing and CNNs"
arch=('x86_64')
url="https://github.com/idealo/imagededup"
license=('Apache-2.0')
depends=(
  'python'
  'python-numpy'
  'python-scipy'
  'python-scikit-learn'
  'python-pillow'
  'python-pytorch>=2.1.2'
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
sha256sums=('SKIP')

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

  local site_packages
  site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  rm -rf "$srcdir/_check" "$srcdir/_test-run"
  python -m installer --destdir="$srcdir/_check" dist/*.whl
  install -d "$srcdir/_test-run"
  cp -a tests "$srcdir/_test-run/"
  cd "$srcdir/_test-run"

  # CNN and CNN data-loader tests download pretrained model weights. Keep the
  # offline hashing, search and utility suite independent of that network access.
  PYTHONPATH="$srcdir/_check$site_packages" pytest -o pythonpath='' \
    --ignore=tests/test_cnn.py --ignore=tests/test_data_generator.py tests
}

package() {
  cd "${srcdir}/${_pkgname}"

  local wheel
  wheel=$(ls dist/*.whl | head -n1)
  python -m installer --destdir="${pkgdir}" "${wheel}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
