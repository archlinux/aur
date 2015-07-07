# Maintainer: Carl George < arch at cgtx dot us >

_name="unittest2"
_module="${_name}"
_cmd="unit2"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.1.0"
pkgrel="1"
pkgdesc="The new features in unittest backported to Python 2.4+."
arch=("any")
url="http://www.voidspace.org.uk/python/articles/unittest2.shtml"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "remove-argparse-requirement.patch"
        "LICENSE")
sha256sums=('22882a0e418c284e1f718a822b3b022944d53d2d908e1690b319a9d3eb2c0579'
            '30ea56c67824a126c1700435383aba17d72ffd2e5a901294c781938d33e9ab2f'
            'e0bfff5f29a59d078142b8b24b60b0105043057b9e238974d26ae778804ba9bc')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch -p1 -i "${srcdir}/remove-argparse-requirement.patch"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    python2 setup.py build
}

package_python-unittest2() {
    depends=("python-six>=1.4.0" "python-traceback2")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-unittest2() {
    depends=("python2-six>=1.4.0" "python2-traceback2")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}-python2"
}
