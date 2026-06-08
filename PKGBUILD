# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-cython-cmake"
_name=${pkgname#python-}
pkgdesc="CMake helpers for building Cython modules "
url="https://github.com/scikit-build/cython-cmake"

pkgver=0.2.2
pkgrel=1

arch=("any")
license=("Apache-2.0")

depends=(
    "cython"
    "python"
)
makedepends=(
    "python-build"
    "python-hatch-vcs"
    "python-hatchling"
    "python-installer"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
    "python-scikit-build-core"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
b2sums=("082208f24972d733ab1be453665f86b1d9397a9822441a9f7cb1249e33bb228303027df950c52ba9cc425e74d6642615024f78aa36aabc6545d88afa4bd46242")

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}

    local TEST_VENV="${srcdir}/test-venv"
    python -m venv --system-site-packages "${TEST_VENV}"
    "${TEST_VENV}"/bin/python -m installer dist/*.whl

    "${TEST_VENV}"/bin/python -P -m pytest
}

package() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
