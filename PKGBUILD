# Maintainer: Qingxu <me@linioi.com>
pkgname=lody-bin
pkgver=0.116.1
pkgrel=1
pkgdesc='A development platform built for parallel AI Agent workflows'
url='https://lody.ai'
arch=('x86_64')
license=(
    'LicenseRef-proprietary'
)
depends=(
    'alsa-lib'
    'at-spi2-core'
    'gtk3'
    'hicolor-icon-theme'
    'libnotify'
    'libsecret'
    'libxss'
    'libxtst'
    'nss'
    'org.freedesktop.secrets'
    'util-linux-libs'
    'xdg-utils'
)
optdepends=(
    'libappindicator: tray icon support'
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
noextract=(
    "$pkgname-$pkgver-amd64.deb"
)
sha256sums=('6efed426594016b8ce249e5a03b57673141682245a905cf25fcc13bc6ae889b4')

package() {
    local _deb="$srcdir/$pkgname-$pkgver-amd64.deb"

    ar p "$_deb" data.tar.xz | bsdtar -xJf - -C "$pkgdir"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/Lody/lodyDesktop "$pkgdir/usr/bin/lody"

    sed -i \
        -e 's|/opt/Lody/lodyDesktop|lody|' \
        -e 's|Icon=lodyDesktop|Icon=lody|' \
        "$pkgdir/usr/share/applications/ai.lody.desktop.desktop"

    mv "$pkgdir/usr/share/icons/hicolor/512x512/apps/lodyDesktop.png" \
       "$pkgdir/usr/share/icons/hicolor/512x512/apps/lody.png"

    rm -rf "$pkgdir/usr/share/doc"

    # Fix non-world-readable files (e.g. app icon) from upstream .deb
    chmod -R u=rwX,go=rX "$pkgdir"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Lody is proprietary software.
Website: https://lody.ai
EOF
    install -Dm644 "$pkgdir/opt/Lody/LICENSE.electron.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 "$pkgdir/opt/Lody/LICENSES.chromium.html" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
