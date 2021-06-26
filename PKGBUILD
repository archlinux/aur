# Maintainer: Martin Kröning <m dot kroening at hotmail dot de>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
_realname=Sync-my-L2P
pkgname=sync-my-l2p
pkgver=2.4.3
pkgrel=1
pkgdesc="Sync the Moodle instance of RWTH Aachen University."
arch=('x86_64')
url="https://github.com/rwthmoodle/Sync-my-L2P"
license=('LGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("$_realname-$pkgver.tar.gz::https://github.com/rwthmoodle/$_realname/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/rwthmoodle/$_realname/releases/download/v$pkgver/SyncMyL2P-$pkgver-linux.AppImage")
sha256sums=('b5e652d5f7038b0f160b1d0c2fb09ecda938323a97fc37c8579181b9d0705136'
            '8e40a4848617612c118028c2bb8d684f4fde962e72838bcaa292908cbad5103b')

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
