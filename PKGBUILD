# Maintainer: Guilhem Saurel <guilhem dot saurel at laas dot fr>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: Ainola
# Contributor: speps

_org=MeVisLab
pkgname=pythonqt
pkgver=3.5.0
pkgrel=1
pkgdesc='A dynamic Python binding for Qt applications'
arch=('i686' 'x86_64')
url="https://github.com/$_org/${pkgname}"
license=('LGPL2.1')
depends=('python' 'qt5-multimedia' 'qt5-svg' 'qt5-webkit' 'qt5-declarative' 'qt5-xmlpatterns')
makedepends=('git' 'qt5-tools')
conflicts=("${pkgname}-svn" "${pkgname}-for-screencloud" 'qt5-python27-git')
replaces=("${pkgname}-qt5")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
        "$pkgname-197.patch::$url/pull/197.patch")
sha512sums=('4d4a6f3944274f353ac3370243379a46e91e97e5b18cd0a3d7957c68820c6019123150df3493a840f9fbde6ea6f5ec0dd20fb3ba3c6152e69febf0c64e3df91c'
            '29f817c4d0e790a89429860da946db04fd2dfc07672b8d5b501cf86fa4236297b8ccead3f45569a1f2410026c145df5700c7ab048b8cf857578eba6bdff94621')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "$srcdir/$pkgname-197.patch"
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
