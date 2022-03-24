# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-av
_name=${pkgname#python-}
pkgdesc="Pythonic bindings for FFmpeg"
url="https://docs.mikeboers.com/pyav/"

pkgver=9.0.2
pkgrel=1

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
    "ffmpeg4.4"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
sha256sums=(
    "49529f41c317127c671a533ddf0eb1e6733e5aeec622971147acebb2fb261c6d"
)

build() {
    export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig"

    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build_ext --inplace
    python setup.py build
}

# test suite currently fails: https://github.com/PyAV-Org/PyAV/issues/876
# check() {
#     cd "${srcdir}"/${_name}-${pkgver}
#     PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python ./setup.py pytest
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-av/LICENSE"
}
