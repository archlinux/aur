# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: kachelaqa <kachelaqa at gmail dot com>

pkgbase='python-pyside-tools'
pkgname=('python2-pyside-tools' 'python-pyside-tools' 'pyside-tools-common')
pkgver=0.2.15
pkgrel=2
arch=('i686' 'x86_64')
license=('LGPL')
url='https://qt-project.org/wiki/PySide'
makedepends=('cmake' 'python' 'python2' 'qt4>=4.5' 'shiboken>=1.1.1' python{,2}-pyside)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/PySide/Tools/archive/${pkgver}.tar.gz")
md5sums=('e542b9536bd9d35599ede225c9311cc8')

build() {
    cd "${srcdir}/Tools-${pkgver}"

    mkdir -p build2 && cd build2
    # both PYTHON_SUFFIX & PYTHON_BASENAME are required to
    # ensure PySideConfig-python2.7.cmake is selected
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DPYTHON_SUFFIX=-python2.7 \
        -DPYTHON_BASENAME=-python2.7 \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make

    cd "${srcdir}/Tools-${pkgver}"

    mkdir -p build3 && cd build3
    # PySideConfig.cmake defaults to Python 3 config
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make
}

package_python2-pyside-tools() {
    depends=('python2-pyside' 'pyside-tools-common')
    pkgdesc='PySide lupdate, rcc, and uic development tools (for Python 2)'

    cd "${srcdir}/Tools-${pkgver}/build2"
	make DESTDIR="${pkgdir}" install

    find "${pkgdir}" -type f -exec \
    sed -i -e '1 s|^#! */usr/bin/python[0-9.]*|#!/usr/bin/python2|' \
           -e '1 s|^#! */usr/bin/env python[0-9.]*|#!/usr/bin/env python2|' {} +

    mv "${pkgdir}"/usr/bin/{,python2-}pyside-uic
    mv "${pkgdir}"/usr/share/man/man1/{,python2-}pyside-uic.1

    rm -rf "${pkgdir}"/usr/lib/python2*/site-packages/pysideuic/{port_v3,pyside-uic.1}
    rm -f "${pkgdir}"/usr/bin/pyside-{lupdate,rcc}
    rm -f "${pkgdir}"/usr/share/man/man1/pyside-{lupdate,rcc}*

	python2 -m compileall "${pkgdir}"/usr/lib/python2*/site-packages/pysideuic/
	python2 -O -m compileall "${pkgdir}"/usr/lib/python2*/site-packages/pysideuic/
}

package_python-pyside-tools() {
    depends=('python-pyside' 'pyside-tools-common')
    pkgdesc='PySide lupdate, rcc, and uic development tools (for Python 3)'

    cd "${srcdir}/Tools-${pkgver}/build3"
	make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/lib/python3*/site-packages/pysideuic/{port_v2,pyside-uic.1}
    rm -f "${pkgdir}"/usr/bin/pyside-{lupdate,rcc}
    rm -f "${pkgdir}"/usr/share/man/man1/pyside-{lupdate,rcc}*

	python3 -m compileall "${pkgdir}"/usr/lib/python3*/site-packages/pysideuic/
	python3 -O -m compileall "${pkgdir}"/usr/lib/python3*/site-packages/pysideuic/
}

package_pyside-tools-common() {
    depends=('qt4>=4.5')
    pkgdesc='PySide lupdate, rcc, and uic development tools (Common Files)'

    cd "${srcdir}/Tools-${pkgver}/build3"
	make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/lib
    rm -f "${pkgdir}"/usr/bin/pyside-uic
    rm -f "${pkgdir}"/usr/share/man/man1/pyside-uic*
}

