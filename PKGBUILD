# Maintainer: Brenek Harrison <brenekharrison at gmail d0t com>
# Based on PKGBUILD for python-av by peippo <christoph+aur@christophfink.com>

pkgname=python-pyav
_name=${pkgname#python-}
_upstream_name="pyav"
pkgdesc="WyattBlue fork of python-av (Python bindings for FFmpeg)"
url="https://github.com/WyattBlue/pyav"

pkgver=12.0.2
pkgrel=1

arch=("x86_64" "i686")
license=("BSD")

depends=(
    "ffmpeg"
    "python"
    "python-numpy"
    "python-pillow"
)
makedepends=(
    "cython"
    "python-google-api-core"
    "python-setuptools"
    "python-wheel"
    "pkgconf"
)
checkdepends=(
    "autopep8"
    "flake8"
    "python-editorconfig"
    "python-isort"
    "python-pytest"
    "python-sphinx"
)

conflicts=('python-av')

# source=( "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
# upload failed upstream: https://github.com/PyAV-Org/PyAV/actions/runs/6747799842/job/18350415863
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('7518d96c7e62c64c3464f05621bf0ea47906656e6de2d9791fedcd2eec37d4ed3496434a2a8198e7a7a24ecc547f85d1f3551ff743a0c363c6210c3b74867d9d')

build() {
    cd "${srcdir}"/${_upstream_name}-${pkgver}
    python setup.py build_ext --inplace
    python setup.py build
}

check() {
    cd "${srcdir}"/${_upstream_name}-${pkgver}

    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    export PYTHONPATH="${srcdir}/${_upstream_name}-${pkgver}/build/lib.linux-${CARCH}-cpython-${python_version}"

    python -m pytest
}

package() {
    cd "${srcdir}/${_upstream_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-pyav/LICENSE"
}
