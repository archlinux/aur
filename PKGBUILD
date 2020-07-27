# Maintainer: Éric Gillet <e+aur@linuxw.info>

_py_pkgname=pymp4
_github_url=https://github.com/beardypig/$_py_pkgname
pkgbase=python-${_py_pkgname}
pkgname=(python-${_py_pkgname} python2-${_py_pkgname})
pkgver=1.1.0
pkgrel=1
pkgdesc="A Python MP4 Parser and toolkit"
arch=(any)
url="https://github.com/beardypig/pymp4"
license=('Apache') #2.0
makedepends=(python-setuptools python2-setuptools)
#python2-coverage has file conflitcs with python-coverage, so we can't do coverage analysis
#checkdepends=(python-pytest python2-pytest python-codecov python2-codecov python-pytest-cov python2-pytest-cov)
checkdepends=(python-pytest python2-pytest python-wheel python-wheel)
source=(${_py_pkgname}::git+${_github_url}.git#tag=$pkgver)
md5sums=('SKIP')

prepare() {
    cp -af "${srcdir}/${_py_pkgname}" "${srcdir}/python2-${_py_pkgname}"
}

build() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py build

    cd "${srcdir}/python2-${_py_pkgname}"
    python2 setup.py build
}

check() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py test

    #python2-coverage has file conflitcs with python-coverage, so we can't do coverage analysis
    #coverage3 run setup.py test

    cd "${srcdir}/python2-${_py_pkgname}"
    python2 setup.py test

    #python2-coverage has file conflitcs with python-coverage, so we can't do coverage analysis
    #coverage2 run setup.py test
}

package_python-pymp4() {
    depends=(python "python-construct<2.9")

    cd "${srcdir}/${_py_pkgname}"
    python setup.py install --skip-build --root="\${pkgdir}" --optimize=1
}

package_python2-pymp4() {
    depends=(python2 "python2-construct<2.9")

    cd "${srcdir}/python2-${_py_pkgname}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/mp4dump" "${pkgdir}/usr/bin/mp4dump-2"
    find "${pkgdir}" -name \*.py -exec sed -i 's/^\(#!.*\)python$/\1python2/' {} \;
}
