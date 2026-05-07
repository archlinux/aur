# Maintainer: Marco Ziliani
pkgname=xeqm-gui
pkgver=2.0.8
pkgrel=1
pkgdesc="Official GUI wallet for XEQMLabs (XEQM) cryptocurrency"
arch=('x86_64')
url="https://github.com/EquilibriaHorizon/XEQMLabs-GUI"
license=('MIT')
depends=('zeromq' 'zstd' 'fuse2' 'hicolor-icon-theme')
makedepends=()
options=(!strip)
source=(
    "XEQM-GUI-${pkgver}-linux-x86_64.AppImage::https://github.com/EquilibriaHorizon/XEQMLabs-GUI/releases/download/v${pkgver}/XEQM-GUI-${pkgver}-linux-x86_64.AppImage"
    "boost-libs-1.83.0-9-x86_64.pkg.tar.zst::https://archive.archlinux.org/packages/b/boost-libs/boost-libs-1.83.0-9-x86_64.pkg.tar.zst"
    "libsodium-1.0.18-1-x86_64.pkg.tar.xz::https://archive.archlinux.org/packages/l/libsodium/libsodium-1.0.18-1-x86_64.pkg.tar.xz"
    "xeqm-gui.sh"
    "xeqm-gui.desktop"
)
sha256sums=(
    '93c23736ba84d4b41933c37c6361f0e898c96d2b0bcd71c977a6c3eff3881776'
    'bd35288a454689f25ca246c8e0be5dbe44e156ee0084bee6f90b6c0888b811c6'
    '30505f3ce45486cc90a26044160b140729ffd8dada2925bbeb815bc79b630937'
    'SKIP'
    'SKIP'
)
noextract=(
    "XEQM-GUI-${pkgver}-linux-x86_64.AppImage"
    "boost-libs-1.83.0-9-x86_64.pkg.tar.zst"
    "libsodium-1.0.18-1-x86_64.pkg.tar.xz"
)

prepare() {
    cd "$srcdir"

    # Extract AppImage
    chmod +x "XEQM-GUI-${pkgver}-linux-x86_64.AppImage"
    ./"XEQM-GUI-${pkgver}-linux-x86_64.AppImage" --appimage-extract >/dev/null 2>&1

    # Extract bundled libraries
    mkdir -p _boost _sodium
    bsdtar -xf "boost-libs-1.83.0-9-x86_64.pkg.tar.zst" -C _boost usr/lib/
    bsdtar -xf "libsodium-1.0.18-1-x86_64.pkg.tar.xz" -C _sodium usr/lib/
}

package() {
    cd "$srcdir"

    # Install app to /opt
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -a squashfs-root/* "$pkgdir/opt/$pkgname/"

    # Install bundled boost 1.83 libraries
    install -Dm755 _boost/usr/lib/libboost_thread.so.1.83.0 "$pkgdir/opt/$pkgname/usr/lib/libboost_thread.so.1.83.0"
    install -Dm755 _boost/usr/lib/libboost_program_options.so.1.83.0 "$pkgdir/opt/$pkgname/usr/lib/libboost_program_options.so.1.83.0"
    install -Dm755 _boost/usr/lib/libboost_serialization.so.1.83.0 "$pkgdir/opt/$pkgname/usr/lib/libboost_serialization.so.1.83.0"

    # Install bundled libsodium 23
    install -Dm755 _sodium/usr/lib/libsodium.so.23.3.0 "$pkgdir/opt/$pkgname/usr/lib/libsodium.so.23.3.0"
    ln -s libsodium.so.23.3.0 "$pkgdir/opt/$pkgname/usr/lib/libsodium.so.23"

    # Install launcher script
    install -Dm755 "$srcdir/xeqm-gui.sh" "$pkgdir/usr/bin/xeqm-gui"

    # Install desktop file and icon
    install -Dm644 "$srcdir/xeqm-gui.desktop" "$pkgdir/usr/share/applications/xeqm-gui.desktop"
    install -Dm644 squashfs-root/xeqm-gui.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/xeqm-gui.png"

    # Remove unnecessary files
    rm -f "$pkgdir/opt/$pkgname/AppRun"
    rm -f "$pkgdir/opt/$pkgname/.DirIcon"
    rm -f "$pkgdir/opt/$pkgname/xeqm-gui.desktop"
    rm -f "$pkgdir/opt/$pkgname/xeqm-gui.png"

    # Fix directory permissions (AppImage extracts some dirs as 700)
    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +

    # Create writable data directories (app writes relative to its install dir)
    install -dm1777 "$pkgdir/opt/$pkgname/data"
    install -dm1777 "$pkgdir/opt/$pkgname/wallets"
}
