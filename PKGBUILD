# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-simplification"
_name=${pkgname#python-}
pkgdesc="Very fast Python LineString simplification using RDP or Visvalingam-Whyatt"
url="https://github.com/urschrei/simplification"

pkgver=1.0.0
pkgrel=1

arch=("x86_64")
license=("LicenseRef-Blue-Oak-Model-License-1.0.0")

depends=(
    "glibc"
    "librdp"
    "python"
    "python-numpy"
)
makedepends=(
    "cython"
    "python-build"
    "python-cython-cmake"
    "python-installer"
    "python-scikit-build-core"
    "python-setuptools-scm"
    "python-toml"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "system-wide-libraries.patch"
)
b2sums=(
    "f11d9ef27ac5b4e2578013d0b71b9078bf8f62ccef0526578cd540b5f047d84e06b21dad7a7cd436702b6f51270f449656408ff25c9079b27186e73ec5793a59"
    "61e0867820e1e177d019b16b46aa3148a49496ea93723708e4204d90c8279c8636dfe7138d503532bdebcb6842354e61b85a889cd59006597028d3a7559a0515"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/system-wide-libraries.patch"
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}"/${_name}-${pkgver}

    local TEST_VENV="${srcdir}/test-venv"
    python -m venv --system-site-packages "${TEST_VENV}"
    "${TEST_VENV}"/bin/python -m installer dist/*.whl

    "${TEST_VENV}"/bin/python -P -m pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
