# Maintainer: Guilhem Saurel <saurel at laas dot fr>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

pkgname=pythonqt
pkgver=3.4.0
pkgrel=1
pkgdesc='A dynamic Python binding for Qt applications'
arch=('i686' 'x86_64')
url="https://github.com/MeVisLab/${pkgname}"
license=('LGPL2.1')

depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-declarative' 'qt5-xmlpatterns')
makedepends=('git' 'qt5-tools')
conflicts=("${pkgname}-svn" "${pkgname}-for-screencloud" 'qt5-python27-git')
replaces=("${pkgname}-qt5")

source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('99524931c1d1287340cf4186ea48b2969e990fe7e69cc680e5acafee73aff62a8f3b9a4d78c5e11393fa56f7dc2bdc0259c174bb1c3314d6d43a8fa52a0308c4')

build() {
    # Building package
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt5 \
        PYTHON_VERSION=$(python -c 'import sys; print(".".join(sys.version.split(".")[:2]))') \
        QMAKE_CFLAGS="${CFLAGS}" \
        QMAKE_CXXFLAGS="${CXXFLAGS}" \
        CONFIG+=release
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Includes
    mkdir -p "${pkgdir}"/usr/include/PythonQt/{gui,extensions/PythonQt_QtAll}
    cp src/*.h "${pkgdir}"/usr/include/PythonQt/
    cp src/gui/*.h "${pkgdir}"/usr/include/PythonQt/gui/
    cp extensions/PythonQt_QtAll/*.h "${pkgdir}"/usr/include/PythonQt/extensions/PythonQt_QtAll/

    # Library
    mkdir -p "${pkgdir}"/usr/lib
    cp -a lib/*.so* "${pkgdir}"/usr/lib/
}
