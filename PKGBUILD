# Maintainer: Renato Caldas <renato@calgera.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname='python-fenics-dolfinx-git'
pkgdesc='Next generation FEniCS problem solving environment'
pkgver=0.9.0.dev0_r27933.de18733
pkgrel=1
arch=('x86_64')
url='https://fenicsproject.org'
license=('MIT')
depends=('dolfinx-git' 'python-fenics-ufl-git' 'python-fenics-basix-git' 'python-mpi4py')
makedepends=('git' 'cmake' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
             'nanobind' 'chrpath')
optdepends=('gmsh: for handling gmsh meshes'
            'python-scipy: for sparse matrices')
provides=('python-fenics-dolfinx')
conflicts=('python-fenics-dolfinx')
source=("git+https://github.com/FEniCS/dolfinx")
sha512sums=('SKIP')

pkgver()  {
    cd "$srcdir/dolfinx"
    # The main repo unfortunately has no meaningful tags..
    printf "%s_r%s.%s" "$(sed -n -e 's/^version *= \"*\(.*\)\"/\1/p' python/pyproject.toml)" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    git -C "${srcdir}/dolfinx" clean -dfx
}

build() {
    cd "$srcdir/dolfinx"

    # Build the python bindings
    cd "$srcdir/dolfinx/python"
    python -m build --wheel --no-isolation "$srcdir/dolfinx/python"
}

package_python-fenics-dolfinx-git() {
    cd "$srcdir/dolfinx/python"
    python -m installer --destdir="$pkgdir" dist/*.whl
    find "$pkgdir" -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
    install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/python-fenics-dolfinx-git/LICENSE"

    # Remove insecure runpath
    find "$pkgdir" -iname "cpp.cpython*so" | xargs chrpath --delete
}
