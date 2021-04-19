# Maintainer: Martin Kröning <m dot kroening at hotmail dot de>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
_realname=Sync-my-L2P
pkgname=sync-my-l2p
pkgver=2.4.2
pkgrel=2
pkgdesc='Sync the L2P and moodle instance of RWTH Aachen University'
arch=('x86_64')
url='https://syncmyl2p.de/'
license=('LGPL3')
depends=('qt5-base' 'hicolor-icon-theme')
source=("$_realname-$pkgver.tar.gz::https://github.com/rwthmoodle/$_realname/archive/v$pkgver.tar.gz"
        "SyncMyL2P-2.4.2-linux.AppImage::https://github.com/rwthmoodle/$_realname/releases/download/v$pkgver/SyncMyL2P-4.2.2-linux.AppImage")
sha256sums=('58c6847cf96a03025009a6526f54f5967ee754b580a8fcfe3ab2c6d24c18266e'
            '013aa9a08b1badd19c47ea5d826c0b146409e999787ca24df01439e086e8ceab')

prepare() {
    # Setup client_id
    chmod +x SyncMyL2P-$pkgver-linux.AppImage
    ./SyncMyL2P-$pkgver-linux.AppImage --appimage-extract usr/bin/$_realname
    client_id=$(strings squashfs-root/usr/bin/$_realname | grep .apps.rwth-aachen.de)
    cd "$_realname-$pkgver"
    sed --in-place "s/\(#define CLIENTID\) .*/\1 \"$client_id\"/g; /#error ERROR: NO CLIENTID IN CLIENTID.H DEFINED/d" include/clientId.h

    # Fill in version number
    sed "s/PRODUCT_VERSION/$pkgver/g" gui/info.ui.template > gui/info.ui

    mkdir -p build
}

build() {
    cd "$_realname-$pkgver/build"

    qmake-qt5 ../$_realname.pro \
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
