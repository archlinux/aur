# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=netopeer2
_pkgver=0.7-r1
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc='A set of network configuration tools based on the NETCONF protocol.'
url='https://github.com/CESNET/netopeer2'
arch=('any')
license=('BSD')
depends=('libnetconf2' 'sysrepo' 'zlib')
makedepends=('cmake')
source=("https://github.com/CESNET/netopeer2/archive/v$_pkgver.tar.gz")
sha256sums=('040013d1e315c62c496b704475665165578c374ffb387cbbff422cf8898d3a12')

prepare() {
    mkdir -p "$srcdir/build-cli" "$srcdir/build-server"
}

build() {
    cd "$srcdir/build-cli"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        "$srcdir/Netopeer2-$_pkgver/cli"
    make

    cd "$srcdir/build-server"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        "$srcdir/Netopeer2-$_pkgver/server"
    make
}

package() {
    cd "$srcdir/build-cli"
    make DESTDIR="$pkgdir" install

    cd "$srcdir/build-server"
    make DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir/Netopeer2-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=4 ts=4 et:
