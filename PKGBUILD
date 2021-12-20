# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-av
_name=${pkgname#python-}
pkgdesc="Pythonic bindings for FFmpeg"
url="https://docs.mikeboers.com/pyav/"

pkgver=8.0.3
pkgrel=6

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

#source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("${_name}-${pkgver}.tar.gz::https://github.com/PyAV-Org/PyAV/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("b13e1747f4a3d4d083084600f581406e4050c2885adb43fb012eff13010e49e1")
#source=("$_name-$pkgver::git+https://github.com/mikeboers/PyAV.git#tag=v8.0.3")
#sha256sums=("SKIP")

prepare() {
    cd "${srcdir}"
    mv "PyAV-${pkgver}" "${_name}-${pkgver}"
}

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
