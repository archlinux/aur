# Maintainer: Renato Caldas <renato@calgera.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=('basix-git' 'python-fenics-basix-git')
pkgdesc='FEniCS finite element basis evaluation library'
pkgver="0.7.0.dev0_r934.571d504"
pkgrel=3
arch=('x86_64')
url='https://fenicsproject.org'
license=('MIT')
makedepends=('git' 'cmake' 'python-build' 'python-installer' 'python-wheel'
        'python-setuptools' 'pybind11' 'python-scikit-build-core' 'chrpath')
conflicts=('basix' 'fenics-basix-git' 'python-fenics-basix' 'python-basix-git')
source=('git+https://github.com/FEniCS/basix')
sha512sums=('SKIP')

pkgver()  {
    cd "$srcdir/basix"
    # The main repo unfortunately has no meaningful tags..
    printf "%s_r%s.%s" "$(sed -n -e 's/^version *= \"*\(.*\)\"/\1/p' pyproject.toml)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    git -C "${srcdir}/basix" clean -dfx
}

build() {
    cd "$srcdir/basix"

    # Build c++ library
    cmake -DCMAKE_BUILD_TYPE="Release" \
        -S cpp \
        -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build

    # HACK: Install to temporary dir, required for building the wheel
    export DESTDIR="$srcdir/tmp"
    cmake --install build

    # Build the python wheel
    export CMAKE_PREFIX_PATH="$srcdir/tmp/usr"
    python -m build --wheel --no-isolation "$srcdir/basix/python"
}

package_basix-git() {
    depends=('blas' 'lapack')

    cd "$srcdir/basix"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/basix-git/LICENSE"
}

package_python-fenics-basix-git() {
    depends=('basix-git' 'python-fenics-ufl-git' 'python-numpy')
    optdepends=('python-numba: for Numba helper function support')

    cd "$srcdir/basix/python"
    python -m installer --destdir="$pkgdir" dist/*.whl
    find "$pkgdir" -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/python-fenics-basix-git/LICENSE"

    # Remove insecure runpath
    find "$pkgdir" -iname "_basixcpp*so" | xargs chrpath --delete
}
