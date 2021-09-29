# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgbase=dune-common
pkgname=(${pkgbase} python-${pkgbase})
_tarver=2.8.0
_tar="${_tarver}/${pkgbase}-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="Build system, infrastructure and foundation classes"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgbase}"
license=('custom:GPL2 with runtime exception')
makedepends=('cmake' 'openmpi' 'tbb' 'texlive-latexextra' 'biber' 'doxygen' 'graphviz' 'python-sphinx' 'python-setuptools' 'python-portalocker')
optdepends=('vc: C++ Vectorization library'
  'texlive-latexextra: Type setting system'
  'doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'inkscape: Conversion routines for generate PNG images'
  'bash-completion: for completion when using bash'
  'openmpi: for mpi support'
  'parmetis: Parallel Graph Partitioning and Fill-reducing Matrix Ordering'
  'scotch: Software package and libraries for graph, mesh and hypergraph partitioning, static mapping, and sparse matrix block ordering'
  'man-db: manual pages for dune'
  'python-ufl: for dunepackaging.py'
  'python-requests: for dunepackaging.py'
  'python-pip: for dunepackaging.py'
  'python-scipy: for dunepackaging.py'
  'python-scikit-build: for dunepackaging.py')
source=(https://dune-project.org/download/${_tar}{,.asc})
sha512sums=('81a9f2bd38aa158134ec7306d2b838d1330ce5410de78ca0b7f9d42e27af7324757a3c01fcffe948e58dc8f6fe9f78c33fd840d9ccc98a18f3565b5de35c2f59' 'SKIP')
validpgpkeys=('ABE52C516431013C5874107C3F71FE0770D47FFB') # Markus Blatt (applied mathematician and DUNE core developer) <markus@dr-blatt.de>

prepare() {
  # https://salsa.debian.org/science-team/dune-common/-/blob/master/debian/patches/skip-dirs-starting-with-dot.patch
  sed -i 's/^        $(find -H "$dir" -name $CONTROL | $GREP -v '\''dune-\[-_a-zA-Z\]\/dune-\[-a-zA-Z_\]\*-\[0-9\]\\{1,\\}.\[0-9\]\\{1,\\}\/'\'')/        $(find -H "$dir" -name '\''.?\*'\'' -prune -o -name $CONTROL -print | $GREP -v '\''dune-\[-_a-zA-Z\]\/dune-\[-a-zA-Z_\]\*-\[0-9\]\\{1,\\}.\[0-9\]\\{1,\\}\/'\'')/' ${pkgbase}-${_tarver}/lib/dunemodules.lib
}

build() {
  cmake \
    -S ${pkgbase}-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -DDUNE_ENABLE_PYTHONBINDINGS=ON \
    -DDUNE_PYTHON_INSTALL_LOCATION='none' \
    -DCMAKE_DISABLE_FIND_PACKAGE_Vc=TRUE \
    -DCMAKE_DISABLE_FIND_PACKAGE_PTScotch=TRUE \
    -Wno-dev
  cmake --build build-cmake --target all
  cd "build-cmake/python"
  python setup.py build
}

package_dune-common() {
  depends=('cmake' 'openmpi' 'python-docutils' 'git' 'lapack' 'tbb')
  provides=('dune-ctest' 'duneproject' 'dunecontrol' 'dunepackaging.py' 'dune-git-whitespace-hook' 'rmgenerated.py' 'setup-dunepy.py')
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install sphinx_html
  install -d ${pkgdir}/usr/share/doc/${pkgbase}/buildsystem
  mv build-cmake/doc/buildsystem/html/* ${pkgdir}/usr/share/doc/${pkgbase}/buildsystem
  install -Dm644 ${pkgbase}-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  cd "${pkgdir}"
  rm -rf usr/python
  find "${pkgdir}" -type d -empty -delete
}

package_python-dune-common() {
  depends=('dune-common>=2.8.0' 'python-portalocker' 'python-mpi4py' 'python-matplotlib')
  pkgdesc+=" (python bindings)"
  cd "build-cmake/python"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
