# Maintainer: Guilhem Saurel <guilhem dot saurel at laas dot fr>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

_org=MeVisLab
pkgname=pythonqt
pkgver=3.5.2
pkgrel=1
pkgdesc='A dynamic Python binding for Qt applications'
arch=('i686' 'x86_64')
url="https://github.com/$_org/${pkgname}"
license=('LGPL2.1')
depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-declarative' 'qt5-xmlpatterns')
makedepends=('git' 'qt5-tools')
conflicts=("${pkgname}-svn" "${pkgname}-for-screencloud" 'qt5-python27-git')
replaces=("${pkgname}-qt5")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('dd71ea3816df976a69baac56ee3d428536385fa22a72e84d543120cbb1bb093d764fc142ac35f9f53744cf69c7fd9c5d3cbaf18c81777e829c9877f402e79a93')

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
