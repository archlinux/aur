# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonopy')
pkgver=4.3.1
pkgrel=2
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://github.com/phonopy/phonopy"
license=('BSD')
depends=(
    "python-numpy"
    "python-yaml"
    "python-matplotlib"
    "spglib"
    "python-h5py"
    "python-symfc"
)
optdepends=(
    "python-seekpath"
)
makedepends=(
    python-pip
    cmake
    gcc
    ninja
)

source=("git+https://github.com/phonopy/phonopy.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"/phonopy
  sed -i 's/cmake\.verbose/build.verbose/g' pyproject.toml
}

build() {
  cd "$srcdir"/phonopy
  rm -rf dist

  python -m venv _buildenv
  _buildenv/bin/pip install --upgrade pip
  _buildenv/bin/pip install \
    numpy \
    scikit-build-core \
    "nanobind<2.10.0" \
    setuptools-scm \
    build

  _buildenv/bin/python -m build --wheel --no-isolation
}


package() {
  cd "$srcdir"/phonopy
  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated --root="$pkgdir" \
    --ignore-installed --no-deps dist/*.whl
}
