# Maintainer: Thomas Weber <contact at turbowarp dot org>

_electron=37

pkgname=turbowarp-desktop-bin
pkgver=1.14.5
pkgrel=1
pkgdesc="Scratch mod with a compiler to run projects faster, dark mode for your eyes, a bunch of addons to improve the editor, and more."
arch=("any")
url="https://desktop.turbowarp.org/"
license=("GPL3")
depends=("electron$_electron")
provides=("turbowarp-desktop")
conflicts=("turbowarp-desktop")
source=("$pkgname-$pkgver.tar.gz::https://github.com/TurboWarp/desktop/releases/download/v$pkgver/TurboWarp-linux-armv7l-$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('a12569f472becac97fbb7cb14aeaed85444841d06421b31ebead4945dc2b4ba3')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    bsdtar -xf "$pkgname-$pkgver.tar.gz" -C "$srcdir/$pkgname-$pkgver" --strip-components 1
}

package() {
    # launch script
    install -Dm755 /dev/null "$pkgdir/usr/bin/turbowarp-desktop"
    echo '#!/bin/sh' >> "$pkgdir/usr/bin/turbowarp-desktop"
    # TW_DIST_ID appears as "distribution" in ? > about menu
    echo 'export TW_DIST_ID=linux-aur' >> "$pkgdir/usr/bin/turbowarp-desktop"
    # TW_DISABLE_UPDATE_CHECKER disables in-app update checker as updates are managed by the AUR package and whatever helper you use
    echo 'export TW_DISABLE_UPDATE_CHECKER=1' >> "$pkgdir/usr/bin/turbowarp-desktop"
    echo "exec electron$_electron /usr/share/turbowarp-desktop/app.asar "'"$@"' >> "$pkgdir/usr/bin/turbowarp-desktop"

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
    mkdir -p "$pkgdir/usr/share/turbowarp-desktop"
    cp -r "$srcdir/$pkgname-$pkgver/resources"/* "$pkgdir/usr/share/turbowarp-desktop"
}
