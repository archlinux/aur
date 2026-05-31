# Maintainer: Thomas Weber <contact at turbowarp dot org>

pkgname=turbowarp-desktop-bin
pkgver=1.16.0
pkgrel=2
pkgdesc="Scratch mod with a compiler to run projects faster, dark mode for your eyes, a bunch of addons to improve the editor, and more."
arch=("x86_64" "aarch64" "armv7h")
url="https://desktop.turbowarp.org/"
license=("GPL3")
depends=(
    "gtk3"
    "nss"
    "alsa-lib"
    "libnotify"
    "libcups"
    "libxss"
)
provides=("turbowarp-desktop")
conflicts=("turbowarp-desktop")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/TurboWarp/desktop/releases/download/v$pkgver/TurboWarp-linux-x64-$pkgver.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/TurboWarp/desktop/releases/download/v$pkgver/TurboWarp-linux-arm64-$pkgver.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/TurboWarp/desktop/releases/download/v$pkgver/TurboWarp-linux-armv7l-$pkgver.tar.gz")
noextract=(
    "$pkgname-$pkgver-x86_64.tar.gz"
    "$pkgname-$pkgver-aarch64.tar.gz"
    "$pkgname-$pkgver-armv7h.tar.gz"
)
sha256sums_x86_64=('338b27ad09168e2933c67a12a68eccdaea010e81e320543bebf27234656857bb')
sha256sums_aarch64=('5909f02d92536c3ee52121dec4f1b7a73261a08ac7e091d15205cbff9893e33a')
sha256sums_armv7h=('6b58037da7aca2d52871ad7f1326ee1e4ed4ecc4e97ffdead289d4591e48d77a')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$srcdir/$pkgname-$pkgver" --strip-components 1
}

package() {
    # launch script
    install -Dm755 /dev/null "$pkgdir/usr/bin/turbowarp-desktop"
    echo '#!/bin/sh' >> "$pkgdir/usr/bin/turbowarp-desktop"
    # TW_DIST_ID appears as "distribution" in ? > about menu
    echo 'export TW_DIST_ID=linux-aur' >> "$pkgdir/usr/bin/turbowarp-desktop"
    # TW_DISABLE_UPDATE_CHECKER disables in-app update checker as updates are managed by the AUR package and whatever helper you use
    echo 'export TW_DISABLE_UPDATE_CHECKER=1' >> "$pkgdir/usr/bin/turbowarp-desktop"
    echo 'exec /opt/turbowarp-desktop/turbowarp-desktop "$@"' >> "$pkgdir/usr/bin/turbowarp-desktop"

    # .desktop file
    install -Dm755 "$srcdir/$pkgname-$pkgver/linux-files/org.turbowarp.TurboWarp.desktop" "$pkgdir/usr/share/applications/turbowarp-desktop.desktop"
    sed -i '/^#/d' "$pkgdir/usr/share/applications/turbowarp-desktop.desktop"
    sed -i 's/^Exec=.*/Exec=turbowarp-desktop %U/' "$pkgdir/usr/share/applications/turbowarp-desktop.desktop"
    sed -i 's/^Icon=.*/Icon=turbowarp-desktop/' "$pkgdir/usr/share/applications/turbowarp-desktop.desktop"

    # mime type metadata
    install -Dm644 "$srcdir/$pkgname-$pkgver/linux-files/org.turbowarp.TurboWarp.mime.xml" "$pkgdir/usr/share/mime/packages/turbowarp-desktop.xml"
    sed -i 's/org\.turbowarp\.TurboWarp/turbowarp-desktop/' "$pkgdir/usr/share/mime/packages/turbowarp-desktop.xml"

    # metainfo/appstream
    install -Dm644 "$srcdir/$pkgname-$pkgver/linux-files/org.turbowarp.TurboWarp.metainfo.xml" "$pkgdir/usr/share/metainfo/turbowarp-desktop.xml"
    sed -i 's/org\.turbowarp\.TurboWarp/turbowarp-desktop/' "$pkgdir/usr/share/metainfo/turbowarp-desktop.xml"

    # icon
    install -Dm644 "$srcdir/$pkgname-$pkgver/resources/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/turbowarp-desktop.png"

    # app files
    mkdir -p "$pkgdir/opt/turbowarp-desktop"
    cp -r "$srcdir/$pkgname-$pkgver"/* "$pkgdir/opt/turbowarp-desktop"

    # sandbox helper must be suid root
    chmod 4755 "$pkgdir/opt/turbowarp-desktop/chrome-sandbox"
}
