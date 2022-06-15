# Maintainer: taotieren <admin@taotieren.com>

pkgname=qt5-qtcsv
pkgver=1.6
pkgrel=1
pkgdesc="Library for reading and writing csv-files in Qt."
arch=('any')
url="https://github.com/iamantony/qtcsv"
license=('MIT')
groups=()
depends=(
    "qt5-base"
    )
makedepends=()
provides=("qtcsv")
conflicts=("qt6-qtcsv")
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('9e5edb1a4adc193931706e7555dca7aa9912d97281bc8084c59f13b810aab0e7')

build() {
    cd "$srcdir/${pkgname#qt5-}-${pkgver}"
    mkdir -pv build
    cd build
    qmake-qt5 ../qtcsv.pro CONFIG+=[release]
    make -j$(nproc)
    mkdir -pv tests
    cd tests
    qmake-qt5 ../../tests/tests.pro CONFIG+=[release] LIBS+=-L../
    make -j$(nproc)
}

test() {
    cd "$srcdir/${pkgname#qt5-}-${pkgver}/build/tests"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/../

    chmod 777 qtcsv_tests
    ./qtcsv_tests
}

package() {
    cd "$srcdir/${pkgname#qt5-}-${pkgver}/build"
    make INSTALL_ROOT="$pkgdir/" install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  ../LICENSE*
}
