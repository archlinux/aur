# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-root_numpy
_pkgbase=root_numpy
pkgname=('python2-root_numpy' 'python-root_numpy')
pkgver=4.7.3
pkgrel=3
pkgdesc="The interface between ROOT and NumPy"
arch=('i686' 'x86_64')
url="http://scikit-hep.org/root_numpy/"
license=('BSD')
makedepends=('cython2' 'python-numpy' 'python2-setuptools'
             'cython' 'python2-numpy' 'python-setuptools' 'root')
checkdepends=('python2-nose' 'python-nose' 'root')
source=("https://github.com/scikit-hep/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('62f467ffad6608566c943b8dffea212e12caccc96155e81ba451a1034adf1f33')

prepare() {
    cd "${srcdir}"
    cp -a "root_numpy-${pkgver}" "root_numpy-py2-${pkgver}"
    cd "root_numpy-py2-${pkgver}"

    find . -name '*.py' -type f -exec \
        sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
            -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
            -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
            -i '{}' \; -print
}

build() {
    cd "${srcdir}/root_numpy-py2-${pkgver}"
    cython2 root_numpy/src/_librootnumpy.pyx --embed --cplus -o root_numpy/src/_librootnumpy.cpp
    cython2 root_numpy/tmva/src/_libtmvanumpy.pyx --embed --cplus -o root_numpy/tmva/src/_libtmvanumpy.cpp
    python2 setup.py build_ext -i

    cd "${srcdir}/root_numpy-${pkgver}"
    cython root_numpy/src/_librootnumpy.pyx --embed --cplus -o root_numpy/src/_librootnumpy.cpp
    cython root_numpy/tmva/src/_libtmvanumpy.pyx --embed --cplus -o root_numpy/tmva/src/_libtmvanumpy.cpp
    python setup.py build_ext -i
}

check() {
    # cd "${srcdir}/root_numpy-py2-${pkgver}"
    # nosetests2 -s -v root_numpy

    cd "${srcdir}/root_numpy-${pkgver}"
    nosetests -s -v root_numpy
}

package_python2-root_numpy() {
    depends=('python2-numpy' 'root')
    cd "${srcdir}/root_numpy-py2-${pkgver}"

    python2 setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r benchmarks "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -r examples "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -r paper "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_python-root_numpy() {
    depends=('python-numpy' 'root')
    cd "${srcdir}/root_numpy-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r benchmarks "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -r examples "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -r paper "${pkgdir}/usr/share/doc/${pkgname}/"
}
