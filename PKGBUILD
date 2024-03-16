# Maintainer: Brenek Harrison <brenekharrison at gmail d0t com>
# Based on PKGBUILD for python-av by peippo <christoph+aur@christophfink.com>

pkgname=python-pyav
_name=${pkgname#python-}
_upstream_name="pyav"
pkgdesc="WyattBlue fork of python-av (Python bindings for FFmpeg)"
url="https://github.com/WyattBlue/pyav"

pkgver=12.0.5
pkgrel=1

arch=("x86_64" "i686")
license=("BSD-3-Clause")

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
b2sums=('01302278a88af42acc83f228bb7b5870018f9e427bc54ba827f83cfd7d7b517e37ecad893664699ac684779c32cc8793ae3a65373dba414da70d775d490b2b8e')

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
