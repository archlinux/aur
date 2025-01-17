# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pyrobuf
_name=${pkgname#python-}
pkgdesc="An alternative to Google's Python Protobuf library."
url="https://github.com/appnexus/pyrobuf"

pkgver=0.9.3
pkgrel=10

arch=("x86_64")
license=("Apache-2.0")

makedepends=(
    "python-pip"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "cython"
    "python"
    "python-jinja"
)
# checkdepends=(
#     "python-pytest"
#     "python-pytest-runner"
# )

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "dont-install-tests-module.patch"
)
b2sums=(
    "5482d19e94013eb340fdc2f4eb354077b717a3c93fd231ca96c5ab69df846d3d0ff86ada3865ddbe250ec5ef42260bbac2ddf9cd01e7b51793840cd8d0c98680"
    "4d9258348b50267889f76474598cf1d5cea5bedafbf69c5746c47dfd41c325c80a4f2ef30fac7e7a45c83707f5e231dee675e743e2a0489fd54973baf433033b"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/dont-install-tests-module.patch"
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

# tests currently incomplete in PyPi packages: https://github.com/appnexus/pyrobuf/issues/160
# check() {
#     cd "${srcdir}"/${_name}-${pkgver}
#     local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
#     PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${python_version}" py.test
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
