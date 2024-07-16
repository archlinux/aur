# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-simplification"
_name=${pkgname#python-}
pkgdesc="Very fast Python LineString simplification using RDP or Visvalingam-Whyatt"
url="https://github.com/urschrei/simplification"

pkgver=0.7.12
pkgrel=1

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
    "python-trove-classifiers>=2024.7.1"
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
    "fbab5b1f06df84932e195cff3e908aa833839565dad489044af0b85463a114d7b541d6b21a2e75ebc2d70d09770a129fe0d712c7446cdb796e20505960777de9"
    "2f3cfb66346c66f50f7c1d8cd832324bb9337cca9676d92e4dc8ca1e0d967a02e6fbc253a1abf865404c293cb7b3c87084685080aea8f701fe8d38ebf78e0e33"
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
