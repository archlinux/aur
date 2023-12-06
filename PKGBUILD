# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-mmesh
_dunever=2.9.0
_tarver=1.4
_tar="${_tarver}/${pkgname}-release-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=2
pkgdesc="MMesh is a grid implementation based on CGAL triangulations"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(GPL3)
depends=("dune-grid>=${_dunever}" cgal)
makedepends=(texlive-basic doxygen graphviz python-scikit-build)
optdepends=('vc: C++ Vectorization library'
  'doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'dune-fem: for store static information about grid implementation or support type of boundary id provider specialized for each grid type')
source=(https://gitlab.dune-project.org/samuel.burbulla/${pkgname}/-/archive/release/${_tar})
sha512sums=('1c5d085fcba29051e9981b31c5d7bc2f52aff4f15f9bb1700cc9d017de8d084a4e88c82a9adab9437d4c607535a2f061b7d1d32352a7f4760925e900aaca3492')

prepare() {
  cd ${pkgname}-release-${_tarver}
  export _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  # Use system-wide CGAL installation
  sed -i '/install/,+2 s/^/#/' CMakeLists.txt
  rm -r CGAL
  python -m venv --system-site-packages _skbuild/linux-${CARCH}-${_pyversion}/cmake-build/dune-env
}

build() {
  cd ${pkgname}-release-${_tarver}

  XDG_CACHE_HOME="${PWD}" \
    python setup.py build \
    --build-type=None \
    -G 'Unix Makefiles' \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-O2 -Wno-narrowing -Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DALLOW_CXXFLAGS_OVERWRITE=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_LATEX=FALSE \
    -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=FALSE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DDUNE_PYTHON_WHEELHOUSE="dist"
}

package() {
  cd ${pkgname}-release-${_tarver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py --skip-cmake install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type d -empty -delete
}
