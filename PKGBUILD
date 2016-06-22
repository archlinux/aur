# Maintainer: Carl George < arch at cgtx dot us >

_name="rethinkdb"
_utils=("rethinkdb-import" "rethinkdb-dump" "rethinkdb-export" "rethinkdb-restore" "rethinkdb-index-rebuild")

pkgname=("python-${_name}" "python2-${_name}" "rethinkdb-utils")
pkgver="2.3.0.post4"
pkgrel="1"
pkgdesc="Python driver library for the RethinkDB database server."
arch=("any")
url="https://rethinkdb.com"
license=("AGPL")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1a0b4524c4b2210890e0b512d1b08e439cb1e1d653a1daf48466f9785dfa04de')

prepare() {
    mkdir "${srcdir}/utils"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    python2 setup.py build
}

package_python-rethinkdb() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    for _util in ${_utils[@]}; do
        mv "${pkgdir}/usr/bin/${_util}" "${srcdir}/utils"
    done
}

package_python2-rethinkdb() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    for _util in ${_utils[@]}; do
        rm -f "${pkgdir}/usr/bin/${_util}"
    done
}

package_rethinkdb-utils() {
    depends=("python-rethinkdb")
    for _util in ${_utils[@]}; do
        install -D -p -m 755 "${srcdir}/utils/${_util}" "${pkgdir}/usr/bin/${_util}"
    done
}
