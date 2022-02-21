# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-av
_name=${pkgname#python-}
pkgdesc="Pythonic bindings for FFmpeg"
url="https://docs.mikeboers.com/pyav/"

pkgver=8.1.0
pkgrel=2

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
    "01-build-with-ffmpeg4.4.patch"
)
sha256sums=(
    "0402169bc27e38e0f44e0e0e1854cf488337e86206b6d25d6dae2bfd7a1a0230"
    "c2a3ac73c69e383b956ea14da023531f9a44e281725efc97e448f29da6ad6f3a"
)

prepare() {
    cd "${srcdir}"/${_name}-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/01-build-with-ffmpeg4.4.patch"
}

build() {
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
