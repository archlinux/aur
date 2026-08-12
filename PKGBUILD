# Maintainer: NickeyGod <niklass.schaeffer@gmail.com>
pkgname=onyx-desktop
pkgver=4.5.6
pkgrel=1
pkgdesc="Onyx AI desktop client - native wrapper for the Onyx knowledge assistant"
arch=('x86_64')
url="https://www.onyx.app"
license=('MIT')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=(
    'libappindicator-gtk3: legacy GTK3 tray icon support'
)
options=('!strip')

source=("https://github.com/onyx-dot-app/onyx/releases/download/v${pkgver}/Onyx_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/onyx-dot-app/onyx/v${pkgver}/LICENSE")
sha256sums=('7a6f6b0173c11cbb1c6019ab88b338cab22c7f07f80f6f0826f87302072f96de'
            'SKIP')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir"

    # The upstream deb ships the desktop file with Exec=onyx (no args).
    # Add %U so the binary can be launched with file:// URLs and friends
    # via xdg-open / .desktop launchers.
    sed -i 's|^Exec=onyx$|Exec=onyx %U|' \
        "$pkgdir/usr/share/applications/Onyx.desktop"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
