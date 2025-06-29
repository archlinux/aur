# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-fasttext
pkgdesc="Library for fast text representation and classification – Python bindings"
url="https://github.com/facebookresearch/fastText"

provides=("python-fasttext")
conflicts=("python-fasttext")

pkgver=0.9.2
pkgrel=7

arch=("x86_64")
license=("BSD-3-Clause")

makedepends=("python-setuptools")
depends=("pybind11" "python-numpy" "python-scipy" "python-pytorch")
options=("!debug")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/facebookresearch/fastText/archive/v${pkgver}.tar.gz"
    "${pkgname}-cstdint.patch"
)
b2sums=(
    "ea3af92ce18d04241128cfb28773f0785a006e79c861d718c2c6ad788d776ad60b0543a42eb8be5a865cbc12283355521431fe2fba48544399e4a2b1520ff3f1"
    "5d7c95b54ceb1998b4fd62ce11b6ac94f5c5f95f46488b8da79b04e2b7275bde6af105b120ef61ce81d16418a822b105cc84007f2398e6eb1982b916ff689281"
)

prepare() {
    cd "${srcdir}/fastText-${pkgver}"
    patch --forward --strip=1 --input "${srcdir}/${pkgname}-cstdint.patch"
}

build() {
    export CXXFLAGS="${CXXFLAGS} -std=c++0x"
    cd "${srcdir}/fastText-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/fastText-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1

    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
