# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
pkgname=python-pymesh-git
pkgver=r2064.384ba882
pkgrel=1
epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('MPL')
groups=()
depends=()
# FIXME: cork-git doesn't seem to provide cork
makedepends=('git' 'cmake' 'python' 'python-scipy' 'python-nose' 'python-numpy' 'pybind11' 'libigl'
             #'cork-git'
             'cgal' "eigen"
             #"tetgen" # complicated so we rather use linked submodule
             "triangle" "qhull" "draco" "tbb" "mmg" "nlohmann-json" )
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+https://github.com/PyMesh/PyMesh.git"
        "disable_third_party.patch"
        "mitigate_compile_errors.patch"
        "fix_external_pybind11.patch"
# "third_party/Clipper::git+https://github.com/PyMesh/Clipper.git"
# "third_party/TetWild::git+https://github.com/PyMesh/TetWild.git"
# "third_party/WindingNumber::git+https://github.com/PyMesh/WindingNumber.git"
# "third_party/carve::git+https://github.com/PyMesh/carve.git"
# "third_party/cgal::git+https://github.com/PyMesh/cgal.git"
"third_party/cork::git+https://github.com/PyMesh/cork.git"
# "third_party/draco::git+https://github.com/PyMesh/draco.git"
# "third_party/eigen::git+https://github.com/PyMesh/eigen.git"
# "third_party/fmt::git+https://github.com/fmtlib/fmt.git"
# "third_party/geogram::git+https://github.com/PyMesh/geogram.git"
# "third_party/jigsaw::git+https://github.com/PyMesh/jigsaw.git"
# "third_party/json::git+https://github.com/nlohmann/json.git"
# "third_party/libigl::git+https://github.com/PyMesh/libigl.git"
# "third_party/mmg::git+https://github.com/PyMesh/mmg.git"
#"third_party/pybind11::git+https://github.com/PyMesh/pybind11.git"
"third_party/qhull::git+https://github.com/PyMesh/qhull.git"
# "third_party/quartet::git+https://github.com/PyMesh/quartet.git"
# "third_party/spdlog::git+https://github.com/gabime/spdlog.git"
# "third_party/tbb::git+https://github.com/PyMesh/tbb.git"
"third_party/tetgen::git+https://github.com/PyMesh/tetgen.git"
# "third_party/triangle::git+https://github.com/PyMesh/triangle.git"
)
md5sums=('SKIP'
         '005379f9e01b1ecc83964cefa9e123d7'
         'fe3c9982fd5bd89b55642d969f82976d'
         '72b6b751eda7bf33bd21654ef19b955f'
         'SKIP'
         'SKIP'
         'SKIP')

noextract=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"
  # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
  set -ex
  for patch in "disable_third_party.patch" "mitigate_compile_errors.patch" "fix_external_pybind11.patch"
  do
    git apply "$SRCDEST/$patch"
  done

  for submodule in "tetgen" "qhull" "cork"
  do
    submodule_dir="third_party/$submodule"
    git submodule init "$submodule_dir"
    git config "submodule.third_party/$submodule.url" "$SRCDEST/third_party/$submodule"
    git submodule update "$submodule_dir"
  done

  # git config submodule.third_party/Clipper.url $SRCDEST/Clipper
  # git config submodule.third_party/TetWild.url $SRCDEST/TetWild
  # git config submodule.third_party/WindingNumber.url $SRCDEST/WindingNumber
  # git config submodule.third_party/carve.url $SRCDEST/carve
  # git config submodule.third_party/cgal.url $SRCDEST/cgal
  # git config submodule.third_party/cork.url $SRCDEST/cork
  # git config submodule.third_party/draco.url $SRCDEST/draco
  # git config submodule.third_party/eigen.url $SRCDEST/eigen
  # git config submodule.third_party/fmt.url $SRCDEST/fmt
  # git config submodule.third_party/geogram.url $SRCDEST/geogram
  # git config submodule.third_party/jigsaw.url $SRCDEST/jigsaw
  # git config submodule.third_party/json.url $SRCDEST/json
  # git config submodule.third_party/libigl.url $SRCDEST/libigl
  # git config submodule.third_party/mmg.url $SRCDEST/mmg
  #git config submodule.third_party/pybind11.url $SRCDEST/pybind11
  # git config submodule.third_party/qhull.url $SRCDEST/qhull
  # git config submodule.third_party/quartet.url $SRCDEST/quartet
  # git config submodule.third_party/spdlog.url $SRCDEST/spdlog
  # git config submodule.third_party/tbb.url $SRCDEST/tbb
  # git config submodule.third_party/tetgen.url $SRCDEST/tetgen
  # git config submodule.third_party/triangle.url $SRCDEST/triangle
  # git submodule update
  set +ex

}

build() {
	cd "$srcdir/${pkgname%-git}"
  #cd third_party
  #./build.py clipper

  # mmg and cork failed to compile
  #cmake -B "$srcdir/build" -S "$srcdir/${pkgname%-git}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPYMESH_USE_CORK=Off -DPYMESH_USE_MMG=Off #-Wno-dev
  #make -C "$srcdir/build"
  #cmake --build "$srcdir/build" --config Release -- -j12

  TRIANGLE_PATH=/usr/ QHULL_ROOT=/usr/ python setup.py build
}

check() {
  echo test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	#make -C "$srcdir/build" DESTDIR="$pkgdir/" install
  #cmake --build "$srcdir/build" --target install -DDESTDIR="$pkdir/"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
