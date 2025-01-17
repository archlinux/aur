# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-simplification"
_name=${pkgname#python-}
pkgdesc="Very fast Python LineString simplification using RDP or Visvalingam-Whyatt"
url="https://github.com/urschrei/simplification"

pkgver=0.7.13
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
b2sums=("352f82008f64ed5c21edb5400ad26150ef45b846bd45114016d9a159f2a800d7faa5be36911af90935d5d4790e4d9b119ff899c14db37d94c0b174793f7afeca"
        "2f3cfb66346c66f50f7c1d8cd832324bb9337cca9676d92e4dc8ca1e0d967a02e6fbc253a1abf865404c293cb7b3c87084685080aea8f701fe8d38ebf78e0e33")

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
