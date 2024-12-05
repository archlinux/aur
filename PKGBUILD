# Maintainer: taotieren <admin@taotieren.com>

pkgname=qt6-qtcsv
pkgver=1.7
pkgrel=5
pkgdesc="Library for reading and writing csv-files in Qt."
arch=($CARCH)
url="https://github.com/iamantony/qtcsv"
license=('MIT')
groups=()
depends=(
    gcc-libs
    glibc
    qt6-base)
makedepends=(cmake
    ninja)
provides=("qtcsv")
conflicts=("qt5-qtcsv" "qtcsv")
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('7f8acb68fc1888573e263d020f4153494cdf2bd3610ada3605baa88bb8b6ccf5')

build() {
    cd "$srcdir/${pkgname#qt6-}-${pkgver}"
    # see：https://wiki.archlinux.org/title/
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -B build \
        -G Ninja
    ninja -C build
}

test() {
    cd "$srcdir/${pkgname#qt6-}-${pkgver}/build/tests"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/../

    chmod 777 qtcsv_tests
    ./qtcsv_tests
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname#qt6-}-${pkgver}/build install
}
