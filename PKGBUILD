# Maintainer: quest
pkgname=spawn-desktop
pkgver=0.7.42
pkgrel=1
pkgdesc="Spawn desktop app with Discord Rich Presence"
arch=('x86_64')
url="https://www.spawn.co/"
license=('LicenseRef-proprietary')
depends=('at-spi2-core'
         'gtk3'
         'hicolor-icon-theme'
         'libnotify'
         'libsecret'
         'libxss'
         'libxtst'
         'nss'
         'util-linux-libs'
         'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon support')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.deb::https://spawnfile.io/desktop/releases/Spawn-$pkgver.deb")
sha512sums=('dce90236292f3709c4069bda479db177e7224782216b7c86f5c65a76661548c8ed78c6950c6e886323b848870357091c6da05edc0b16f5d039b6c370c37a00dc')

package() {
    bsdtar -xOf "$pkgname-$pkgver.deb" data.tar.xz | bsdtar -xf - -C "$pkgdir"

    # Debian packaging cruft
    rm -r "$pkgdir/usr/share/doc"

    # Disable the built-in updater. With package-type=deb, electron-updater
    # uses DebUpdater, which runs dpkg -i and apt-get install -f on the host.
    # Without package-type it falls back to AppImageUpdater, which stays
    # inactive when $APPIMAGE is unset. app-update.yml is removed as well so
    # there is no update feed even if $APPIMAGE is set.
    rm "$pkgdir/opt/Spawn/resources/package-type"
    rm "$pkgdir/opt/Spawn/resources/app-update.yml"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/Spawn/spawn-desktop "$pkgdir/usr/bin/spawn-desktop"

    # SUID sandbox fallback for kernels without unprivileged user
    # namespaces (e.g. linux-hardened); matches Arch's chromium package.
    chmod 4755 "$pkgdir/opt/Spawn/chrome-sandbox"
}
