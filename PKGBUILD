# Maintainer: Qingxu <me@linioi.com>
pkgname=lody-bin
pkgver=0.40.0
pkgrel=1
pkgdesc='A development platform built for parallel AI Agent workflows'
url='https://lody.ai'
arch=(
    'x86_64'
)
license=(
    'LicenseRef-proprietary'
)
depends=(
    'alsa-lib'
    'at-spi2-core'
    'gtk3'
    'libnotify'
    'libsecret'
    'libxss'
    'libxtst'
    'nss'
    'xdg-utils'
)
provides=(
    'lody'
)
conflicts=(
    'lody'
)
options=(
    '!strip'
    '!debug'
)
source=(
    "$pkgname-$pkgver-amd64.deb::https://updates.lody.ai/production/Lody-$pkgver-amd64.deb"
)
sha256sums=('4a2f63374dab24689007b6983539825cfe07c606efa0c3ebd7e847fb95c3227c')

package() {
    tar xf data.tar.xz -C "$pkgdir/"

    # fix permissions on opt directory
    chmod 755 "$pkgdir/opt"

    # wrapper script to work around Electron safeStorage requiring explicit password-store on Linux
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/lody" <<'EOF'
#!/bin/sh
exec /opt/Lody/lodyDesktop --password-store=gnome-libsecret "$@"
EOF

    # fix desktop file
    sed -i \
        -e 's|/opt/Lody/lodyDesktop|lody|' \
        -e 's|Icon=lodyDesktop|Icon=lody|' \
        "$pkgdir/usr/share/applications/lodyDesktop.desktop"

    # rename icon
    mv "$pkgdir/usr/share/icons/hicolor/512x512/apps/lodyDesktop.png" \
       "$pkgdir/usr/share/icons/hicolor/512x512/apps/lody.png"

    # remove debian changelog
    rm -rf "$pkgdir/usr/share/doc"

    # install license
    install -Dm644 "$pkgdir/opt/Lody/LICENSE.electron.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 "$pkgdir/opt/Lody/LICENSES.chromium.html" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
