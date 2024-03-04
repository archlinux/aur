# Maintainer: Brenek Harrison <brenekharrison at gmail d0t com>
# Based on PKGBUILD for python-av by peippo <christoph+aur@christophfink.com>

pkgname=python-pyav
_name=${pkgname#python-}
_upstream_name="pyav"
pkgdesc="WyattBlue fork of python-av (Python bindings for FFmpeg)"
url="https://github.com/WyattBlue/pyav"

pkgver=12.0.3
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
b2sums=('f6c68e3d492f8d2cd1c32297cae1b9740f165c150853406e6875b9dadfae3ee524c6f186088bda8dd07c2b031d49d67c8a1c2e4b76c8268e28de12c5e3b86682')

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
