# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-simplification"
_name=${pkgname#python-}
pkgdesc="Very fast Python LineString simplification using RDP or Visvalingam-Whyatt"
url="https://github.com/urschrei/simplification"

pkgver=2.0.0
pkgrel=1

arch=("x86_64")
license=("LicenseRef-Blue-Oak-Model-License-1.0.0")

depends=(
    "python"
    "python-numpy"
)
makedepends=(
    "python-installer"
    "python-maturin"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=(
    "6e92d540eff3713e5b318b701516a99d19a117819b4020a153a729a14318b8d0b8109e1d7467ec3a8dc9da9619ad98acb3222a543397aceb868c3d6a44fd9c94"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    maturin build
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}

    local TEST_VENV="${srcdir}/test-venv"
    python -m venv --system-site-packages "${TEST_VENV}"
    "${TEST_VENV}"/bin/python -m installer target/wheels/${_name}-${pkgver}-*.whl

    "${TEST_VENV}"/bin/python -P -m pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" target/wheels/${_name}-${pkgver}-*.whl
    install -Dm0644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
