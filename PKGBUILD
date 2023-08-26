# Maintainer: Renato Caldas <renato@calgera.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=('dolfinx-git' 'python-fenics-dolfinx-git')
pkgdesc='Next generation FEniCS problem solving environment'
pkgver=0.7.0.dev0_r27526.18e0b13
pkgrel=1
arch=('x86_64')
url='https://fenicsproject.org'
license=('MIT')
depends=('basix-git' 'boost-libs' 'petsc' 'pugixml' 'hdf5-openmpi' 'adios2' 'scotch'
         'python-fenics-ufl-git' 'python-fenics-basix-git')
makedepends=('git' 'cmake' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
             'pybind11' 'chrpath' 'python-fenics-ffcx-git' 'python-mpi4py')
optdepends=('slepc: for use SLEPc eigen solver'
            'parmetis: for compute graph partition'
            'kahip: for compute graph partition')
source=('git+https://github.com/FEniCS/dolfinx')
sha512sums=('SKIP')

pkgver()  {
    cd "$srcdir/dolfinx"
    # The main repo unfortunately has no meaningful tags..
    printf "%s_r%s.%s" "$(sed -n -e 's/^VERSION *= \"*\(.*\)\"/\1/p' python/setup.py)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    git -C "${srcdir}/dolfinx" clean -dfx
}

build() {
    cd "$srcdir/dolfinx"
    source /etc/profile.d/petsc.sh

    # Build c++ library
    cmake -DCMAKE_BUILD_TYPE="Release" \
        -S cpp \
        -B build \
        -DBUILD_SHARED_LIBS=TRUE \
        -DCMAKE_CXX_STANDARD=20 \
        -DCMAKE_C_COMPILER=gcc \
        -DCMAKE_CXX_COMPILER=g++ \
        -DDOLFINX_ENABLE_KAHIP=ON \
        -DDOLFINX_ENABLE_PARMETIS=ON \
        -DDOLFINX_ENABLE_SCOTCH=ON \
        -DDOLFINX_ENABLE_SLEPC=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build


    # HACK: Install to temporary dir, required for building the wheel
    export DESTDIR="$srcdir/tmp"
    cmake --install build

    # Build the python bindings
    export CMAKE_PREFIX_PATH="$srcdir/tmp/usr"
    cd "$srcdir/dolfinx/python"
    python -m build --wheel --no-isolation "$srcdir/dolfinx/python"
}

package_dolfinx-git() {
    provides=('dolfinx')
    conflicts=('dolfinx')

    cd "$srcdir/dolfinx"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/dolfinx-git/LICENSE"

    # Remove insecure runpath
    chrpath --delete "$pkgdir/usr/lib/libdolfinx.so"
}

package_python-fenics-dolfinx-git() {
    provides=('python-fenics-dolfinx')
    conflicts=('python-fenics-dolfinx')
    depends=('dolfinx-git' 'python-fenics-ffcx-git' 'python-fenics-basix-git' 'python-mpi4py')
    optdepends=('gmsh: for handling gmsh meshes'
                'python-scipy: for sparse matrices')

    cd "$srcdir/dolfinx/python"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/python-fenics-dolfinx-git/LICENSE"

    # Remove insecure runpath
    find "$pkgdir" -iname "cpp.cpython*so" | xargs chrpath --delete
}
