# Maintainer: Standa Lukeš <archpkg@exyi.cz>
_pyname="gemmi"
pkgname="python-${_pyname}"
pkgver=0.6.6
pkgrel=1
pkgdesc="macromolecular crystallography library (Python bindings)"
arch=(x86_64)
url="https://gemmi.readthedocs.io/"
license=('MPL-2.0')
makedepends=(cmake pybind11 python-pybind11-stubgen python-scikit-build-core python-build python-installer python-wheel)
depends=(python python-numpy)
checkdepends=()
source=("https://github.com/project-gemmi/${_pyname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('722369495f7374bb938d14da2c3a9f8444b753e2d9536cf097c161a53dbbae19')

build() {
    cd "${_pyname}-${pkgver}"
    # from gemmi/pyproject.toml, but they set it only for their CI
    export SKBUILD_CMAKE_ARGS='-DBUILD_GEMMI_PROGRAM=OFF;-DINSTALL_DEV_FILES=OFF;-DBUILD_SHARED_LIBS=OFF;-DFETCH_ZLIB_NG=ON'
    python -m build --wheel --no-isolation --skip-dependency-check
    # it is too sensitive about exact versions ^^^^^^^^^^^^^^^^^^^
}

package() {
    cd "${_pyname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
