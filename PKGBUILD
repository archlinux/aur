# Maintainer: Vaargk <s30vm63qa at mozmail dot com>
_realname=Sync-my-L2P
pkgname=sync-my-l2p
pkgver=2.5.1
pkgrel=1
pkgdesc="Sync the Moodle instance of RWTH Aachen University."
arch=('x86_64')
url="https://github.com/rwthmoodle/Sync-my-L2P"
license=('LGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("$_realname-$pkgver.tar.gz::https://github.com/rwthmoodle/$_realname/archive/refs/tags/v$pkgver{a}.tar.gz"
        "https://github.com/rwthmoodle/$_realname/releases/download/v${pkgver}a/SyncMyL2P-$pkgver-linux.AppImage")
sha256sums=('8ea02ca17e0d1e2ef47a310b77f22a66f1478b1602722c89251ca124b37baa97'
            'dcc97bc11b8c05b3b984fda8062c906a7a0f101828d3e95e7f997b9328bd5c40')

prepare() {
    # Setup client_id
    chmod +x SyncMyL2P-$pkgver-linux.AppImage
    ./SyncMyL2P-$pkgver-linux.AppImage --appimage-extract usr/bin/$_realname
    client_id=$(strings squashfs-root/usr/bin/$_realname | grep .apps.rwth-aachen.de)
    sed --in-place "s/\(#define CLIENTID\) .*/\1 \"$client_id\"/g; /#error ERROR: NO CLIENTID IN CLIENTID.H DEFINED/d" $_realname-$pkgver/include/clientId.h
}

build() {
    cd $_realname-$pkgver

    qmake-qt5 $_realname.pro \
        PREFIX=/usr \
        QMAKE_CFLAGS="${CFLAGS}" \
        QMAKE_CXXFLAGS="${CXXFLAGS}" \
        QMAKE_LFLAGS="${LDFLAGS}"

    make
}

package() {
    cd $_realname-$pkgver

    # Binary
    install -D -m0755 bin/$_realname "$pkgdir"/usr/bin/$_realname

    # Desktop entry
    install -D -m0644 linux/$_realname.desktop "$pkgdir"/usr/share/applications/$_realname.desktop

    # Icons
    mkdir --parents "$pkgdir"/usr/share/icons && cp --recursive linux/hicolor "$pkgdir"/usr/share/icons/
    chmod --recursive 755 "$pkgdir"/usr/share/icons/hicolor
}
