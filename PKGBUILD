# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="python-simplification"
_name=${pkgname#python-}
pkgdesc="Very fast Python LineString simplification using RDP or Visvalingam-Whyatt"
url="https://github.com/urschrei/simplification"

pkgver=0.7.10
pkgrel=1

arch=("any")
license=("MIT")

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
    "0dc9c376b31d236697eb5beb32f475534f85626f47ed5a1838e34ee6bc6fc2489e5e49e0a4b798bdd46fe4580fb79f36f17f4c83b8f7648240f1e2cb14c3d4cb"
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
}
