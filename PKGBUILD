# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-simplification"
_name=${pkgname#python-}
pkgdesc="Very fast Python LineString simplification using RDP or Visvalingam-Whyatt"
url="https://github.com/urschrei/simplification"

pkgver=0.7.14
pkgrel=2

arch=("any")
license=("custom:Blue-Oak-Model-License-1.0.0")

depends=(
    "librdp"
    "python"
    "python-numpy"
)
makedepends=(
    "cython"
    "python-build"
    "python-installer"
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
    "c3dd379a6d2f9c9c7c7b959c36f888d32ef5024c72af142952eb9b1ee3ef13ffb9169406198af6f86d7005ac74f28cfd43ef3caa9d79d1cd5712c17f37e59213"
    "dabc6dbf3b1b18a87d6118b8a930ef489f82c39d133f601d7a997241e1442f4f08b22ab58af8507b5d569d0bda9aed5eaea28b96fbe35ed731eee4e92ccce608"
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
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="build/lib.linux-$CARCH-cpython-${python_version}"
    python -m pytest .
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
