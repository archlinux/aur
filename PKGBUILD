# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=thor
pkgver=2.0
pkgrel=1
pkgdesc="SFML Extension with various game programming features, like particles, animations, vector operations"
arch=('any')
url="http://www.bromeon.ch/libraries/thor"
license=('zlib')
depends=('sfml')
makedepends=('cmake' 'doxygen')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bromeon/Thor/archive/v$pkgver.tar.gz")
md5sums=('c0a9c427ccc87bc5ee2459fbcd8c564f')

build() {
    cd "$srcdir/Thor-$pkgver"

    cmake -DCMAKE_INSTALL_PREFIX=/usr . \
          -DTHOR_SHARED_LIBS=true \
          -DTHOR_BUILD_DOC=true \
          -DTHOR_BUILD_EXAMPLES=false

    make
}

prepare() {
    cd "$srcdir/Thor-$pkgver"
}

package() {
    cd "$srcdir/Thor-$pkgver"

    make DESTDIR="$pkgdir/" install

    modules_dir="$pkgdir$(pacman -Ql cmake | grep -Po '(?<=cmake ).+\/Modules\/$')"
    mkdir -p "$modules_dir"
    cp ./cmake/Modules/FindThor.cmake "$modules_dir"

    install -Dm644 ./License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
