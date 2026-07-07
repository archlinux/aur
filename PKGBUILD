pkgname=('phono3py')
pkgver=4.3.3
pkgrel=2
pkgdesc="A simulation package of phonon-phonon interaction related properties"
arch=('any')
url="https://github.com/phonopy/phono3py"
license=('BSD')
depends=(
    # "python-phonopy>=2.46.0"
    # "python-phonopy<2.47"
    "python-phonopy"
    "python-scipy"
)
makedepends=(
    python-pip
    cmake
    gcc
    ninja
)


source=(
    "git+https://github.com/phonopy/phono3py.git#tag=v${pkgver}"
    # "lammps.patch"
)
sha256sums=(
    'SKIP'
    # 'SKIP'
)

prepare() {
  cd "$srcdir"/phono3py
  sed -i 's/cmake\.verbose/build.verbose/g' pyproject.toml
}


build() {
  cd "$srcdir"/phono3py
  rm -rf dist

  python -m venv _buildenv
  _buildenv/bin/pip install --upgrade pip
  _buildenv/bin/pip install \
    numpy \
    "scikit-build-core" \
    "nanobind<2.10.0" \
    setuptools-scm \
    build

  _buildenv/bin/python -m build --wheel --no-isolation
}


package() {
  cd "$srcdir"/phono3py
  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated --root="$pkgdir" \
    --ignore-installed --no-deps dist/*.whl
}
