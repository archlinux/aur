# Maintainer: quest
pkgname=spawn-desktop
pkgver=0.7.73
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
sha512sums=('a3b63321b260a8bbe4208a7ff5b633a521ed9d7ff5b9d7e1428ecbbf8b191926807c3a44f13d9690e84646db27bab5ac19ee61cf32a68d2dbe1993ea5c1d5d40')

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
