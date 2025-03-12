# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-qrcode-artistic
_name=${pkgname#python-}
pkgdesc="Artistic (Micro) QR Code plugin for Segno"
url="https://github.com/heuer/qrcode-artistic/"

pkgver=3.0.2
pkgrel=1

arch=("any")
license=("BSD-3-Clause")

depends=(
    "python"
    "python-pillow"
    "python-segno"
)
makedepends=(
    "python-build"
    "python-flit-core"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
    "python-cairosvg"
    "pyzbar"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "${_name}-test-data-animated.gif::https://github.com/heuer/qrcode-artistic/raw/refs/tags/${pkgver}/tests/artistic/animated.gif"
    "${_name}-test-data-sunflower.jpg::https://github.com/heuer/qrcode-artistic/raw/refs/tags/${pkgver}/tests/artistic/sunflower.jpg"
    "${_name}-test-data-svg-file.svg::https://github.com/heuer/qrcode-artistic/raw/refs/tags/${pkgver}/tests/artistic/svg-file.svg"
    "${_name}-test-data-transparency.png::https://github.com/heuer/qrcode-artistic/raw/refs/tags/${pkgver}/tests/artistic/transparency.png"
)
b2sums=('3ee63bbec9565a15237c7f9a476831801f3a6395bb4522dd1b0452ca7bb583e1d875f334cd1101ddf0bb1cdc131cec8b053253b6ece4acd1dd30748cce9b8d71'
        '0343e47d3a8363e361983970451c15015e1822be146ff4d4a5147f302b75235f4c13c2e3e0bd7b93c37478339e49b6b1e1cf79346897f202f46581c2f107caac'
        'a7d6639f7e17d4ac9288acfa8152f37eb9cbe71083bb19bb5636f61821ba85bd839ec7b5502d2a2d0a6526688af0385abaa5e0d67934bcba67bfabfb9ccbe530'
        'a1f1b7c59fd85e062c9e860604ede7641fdceea8ffbb34ef9baf55de2710d55a5bbfbfd3a7f7f36a7d1d84d7b5999e37059270c708b6c35486da56e48c87d58f'
        '0198dd238c14800d97c671f3289b191f651122a6a6b401f5096bf36766aa16a4e978448d0454c7e5e64ab0e51d23f9debdcd192b716ef9958d708dc5ca86f649')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check(){
    cd "${srcdir}"/${_name}-${pkgver}

    mkdir -p "tests/artistic"
    for test_file in \
        animated.gif \
        sunflower.jpg \
        svg-file.svg \
        transparency.png
    do
        mv "${srcdir}/${_name}-test-data-${test_file}" "tests/artistic/${test_file}"
    done

    python -m pytest
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
