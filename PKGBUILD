# Maintainer: Guilhem Saurel <guilhem dot saurel at laas dot fr>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

_org=MeVisLab
pkgname=pythonqt
pkgver=3.5.6
pkgrel=2
pkgdesc='A dynamic Python binding for Qt applications'
arch=('i686' 'x86_64')
url="https://github.com/$_org/${pkgname}"
license=('LGPL-2.1-only')
depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-declarative' 'qt5-xmlpatterns' 'qt5-webengine')
makedepends=('git' 'qt5-tools')
conflicts=("${pkgname}-svn" "${pkgname}-for-screencloud" 'qt5-python27-git')
replaces=("${pkgname}-qt5")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
    "$pkgname-py313.patch::$url/pull/246.patch")
sha512sums=('267157f97681dfabf7816b9e30e28d3869c9db60e75ffefe05037fd2f5957a89096c12ab4d94d1160a363b2ea3de84e9c7a4f116885a625627cb6daac7556f62'
            'ebe50c395e45b3c8fbd394df9cfb746606291c510e2beaf23e256c183aef2df8d9e7eb5a0372b0bd9d9eb51c5fe437a7b7f8f26de732fb0d864e51c8d58901db')

prepare() {
    patch -d "$pkgbase-$pkgver" -p1 -i "$srcdir/$pkgname-py313.patch"
}

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
