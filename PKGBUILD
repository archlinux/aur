# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=fineftp-server
pkgver=1.3.0
pkgrel=2
pkgdesc="FineFTP is a minimal FTP server library for Windows and Unix flavors"
arch=('any')
url="https://github.com/continental/fineftp-server"
license=('MIT')
depends=('asio')
makedepends=()
optdepends=()
source=(https://github.com/continental/fineftp-server/archive/v$pkgver.tar.gz
        Findasio.cmake.patch
        fineftp-server.filesystem.cpp.patch)
md5sums=('a59fe090a62bc211751ccb153ff15b4c'
         '4073a681f63f2b346acefebe026f506f'
         '6bf2c90d2696e6ad0a9ec8668e55abad')

prepare() {
    patch --forward --strip=1 --input="../Findasio.cmake.patch" "$pkgname-$pkgver/cmake/Findasio.cmake"
    patch --forward --strip=1 --input="../fineftp-server.filesystem.cpp.patch" "$pkgname-$pkgver/fineftp-server/src/filesystem.cpp"
}

build() {
    cd $pkgname-$pkgver
    mkdir -p _build
    cd _build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make

}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd _build
    DESTDIR="$pkgdir" make install
}
