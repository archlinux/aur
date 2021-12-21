# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-pyrobuf
_name=${pkgname#python-}
pkgdesc="An alternative to Google's Python Protobuf library."
url="https://github.com/appnexus/pyrobuf"

pkgver=0.9.3
pkgrel=6

arch=("x86_64")
license=("Apache")

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
sha256sums=(
    "9cca7f992c674645522247e23cf6c4d81cca42e5a65e4ae1d05f3967b0c07a80"
    "3f01d4af07f3baa260151cf787b4f68c75a7c0551f1f8332bb68578a0bb9a619"
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

    # pyrobuf installs files into /usr/lib/python-x.xx/site-packages/tests/

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
