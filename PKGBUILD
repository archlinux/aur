# Maintainer: Guilhem Saurel <guilhem dot saurel at laas dot fr>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

_org=MeVisLab
pkgname=pythonqt
pkgver=3.5.7
pkgrel=1
pkgdesc='A dynamic Python binding for Qt applications'
arch=('i686' 'x86_64')
url="https://github.com/$_org/${pkgname}"
license=('LGPL-2.1-only')
depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-declarative' 'qt5-xmlpatterns' 'qt5-webengine')
makedepends=('git' 'qt5-tools')
conflicts=("${pkgname}-svn" "${pkgname}-for-screencloud" 'qt5-python27-git')
replaces=("${pkgname}-qt5")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('90e225d0c50026877854ad1a4beb14f135e06e76a19d6ba91dd6ec20c222a3004a60736255238bba275f4619c74b9b9058d303dd04bb3046083a7f4ef9bfd29b')

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
