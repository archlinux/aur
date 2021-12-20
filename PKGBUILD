# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-av
_name=${pkgname#python-}
pkgdesc="Pythonic bindings for FFmpeg"
url="https://docs.mikeboers.com/pyav/"

pkgver=8.0.3
pkgrel=4

arch=("x86_64" "i686")
license=("BSD")

makedepends=(
    "cython"
    "python-google-api-core"
    "python-setuptools"
    "pkgconf"
)
depends=(
    "python"
    "ffmpeg"
)

# Due to a bug, we have to build from git sources for Python 3.10.
# This hopefully is a temporary issue, hence no package rename
# cf. https://github.com/PyAV-Org/PyAV/issues/820

# source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
# sha256sums=("521814309c91d526b6b5c9517018aef2dd12bc3d86351037db69aa67730692b8")
source=("$_name-$pkgver::git+https://github.com/mikeboers/PyAV.git")
sha256sums=("SKIP")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build_ext --inplace
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-av/LICENSE"
}
