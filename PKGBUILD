# Maintainer: Martin Kröning <m dot kroening at hotmail dot de>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
_realname=Sync-my-L2P
pkgname=sync-my-l2p
pkgver=2.4.1
pkgrel=5
pkgdesc='Sync the L2P and moodle instance of RWTH Aachen University'
arch=('x86_64')
url='https://syncmyl2p.de/'
license=('LGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("$_realname-$pkgver.tar.gz::https://github.com/RobertKrajewski/$_realname/archive/v$pkgver.tar.gz"
        "0001-Project-File-Fix-path-seperator.patch"
        "https://github.com/RobertKrajewski/$_realname/releases/download/v$pkgver/SyncMyL2P-$pkgver-linux.AppImage")
sha256sums=('e737586597dba6f0cbc991d6dd005ac8552d289fd71081974cfb9f030aa999f2'
            '1a969a653252744c1243eacfadd7a156b5d78849d07dd8dd717e439a02e2b4c1'
            'a84527eadedea94144452f300883eef87880ee0608957dc44094cbd66e6d02c1')

prepare() {
    # Setup client_id
    chmod +x SyncMyL2P-$pkgver-linux.AppImage
    ./SyncMyL2P-$pkgver-linux.AppImage --appimage-extract usr/bin/$_realname
    client_id=$(strings squashfs-root/usr/bin/$_realname | grep .apps.rwth-aachen.de)
    cd "$_realname-$pkgver"
    sed --in-place "s/\(#define CLIENTID\) .*/\1 \"$client_id\"/g; /#error ERROR: NO CLIENTID IN CLIENTID.H DEFINED/d" include/clientId.h

    patch -Np1 -i "$srcdir/0001-Project-File-Fix-path-seperator.patch"

    mkdir -p build
}

build() {
    cd "$_realname-$pkgver/build"

    qmake-qt5 "../$_realname.pro" \
        PREFIX=/usr \
        QMAKE_CFLAGS="${CFLAGS}" \
        QMAKE_CXXFLAGS="${CXXFLAGS}" \
        QMAKE_LFLAGS="${LDFLAGS}"

    make
}

package() {
    cd "$_realname-$pkgver"

    # Binary
    install -D -m0755 build/bin/$_realname "$pkgdir"/usr/bin/$_realname

    # Desktop entry
    install -D -m0644 linux/$_realname.desktop "$pkgdir"/usr/share/applications/$_realname.desktop

    # Icons
    mkdir --parents "$pkgdir"/usr/share/icons && cp --recursive linux/hicolor "$pkgdir"/usr/share/icons/
    chmod --recursive 755 "$pkgdir"/usr/share/icons/hicolor
}
