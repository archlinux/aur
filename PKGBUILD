# Maintainer: taotieren <admin@taotieren.com>

pkgname=qt6-qtcsv
pkgver=1.7
pkgrel=0
pkgdesc="Library for reading and writing csv-files in Qt."
arch=('any')
url="https://github.com/iamantony/qtcsv"
license=('MIT')
groups=()
depends=(
    "qt6-base"
    )
makedepends=()
provides=("qtcsv")
conflicts=("qt5-qtcsv")
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('7f8acb68fc1888573e263d020f4153494cdf2bd3610ada3605baa88bb8b6ccf5')

build() {
    cd "$srcdir/${pkgname#qt6-}-${pkgver}"
    mkdir -pv build
    cd build
    qmake6 ../qtcsv.pro CONFIG+=[release]
    make -j$(nproc)
    mkdir -pv tests
    cd tests
    qmake6 ../../tests/tests.pro CONFIG+=[release] LIBS+=-L../
    make -j$(nproc)
}

test() {
    cd "$srcdir/${pkgname#qt6-}-${pkgver}/build/tests"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/../

    chmod 777 qtcsv_tests
    ./qtcsv_tests
}

package() {
    cd "$srcdir/${pkgname#qt6-}-${pkgver}/build"
    make INSTALL_ROOT="$pkgdir/" install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  ../LICENSE*
}
