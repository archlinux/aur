# Maintainer: Qingxu <me@linioi.com>
pkgname=lody-bin
pkgver=0.48.0
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
sha256sums=('1c6f88fbf2b66091abe02d2938c0184073a2faadc17763a73c097efbd2678f0f')

package() {
    local _deb="$srcdir/$pkgname-$pkgver-amd64.deb"

    ar p "$_deb" data.tar.xz | bsdtar -xJf - -C "$pkgdir"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/Lody/lodyDesktop "$pkgdir/usr/bin/lody"

    sed -i \
        -e 's|/opt/Lody/lodyDesktop|lody|' \
        -e 's|Icon=lodyDesktop|Icon=lody|' \
        "$pkgdir/usr/share/applications/lodyDesktop.desktop"

    mv "$pkgdir/usr/share/icons/hicolor/512x512/apps/lodyDesktop.png" \
       "$pkgdir/usr/share/icons/hicolor/512x512/apps/lody.png"

    rm -rf "$pkgdir/usr/share/doc"

    install -Dm644 "$pkgdir/opt/Lody/LICENSE.electron.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 "$pkgdir/opt/Lody/LICENSES.chromium.html" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
