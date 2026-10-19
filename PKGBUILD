# Maintainer: quest
pkgname=spawn-desktop
pkgver=0.7.40
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
sha512sums=('ea5ce31953c225cafec183810edc088e0f1d6f81d02d6126ba930f10406b6b36f16914c5100721eb4cd14c0a7eb8211bdd67a0fe23abd86cfe01331af576affc')

package() {
    bsdtar -xOf "$pkgname-$pkgver.deb" data.tar.xz | bsdtar -xf - -C "$pkgdir"

    # Debian packaging cruft
    rm -r "$pkgdir/usr/share/doc"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/Spawn/spawn-desktop "$pkgdir/usr/bin/spawn-desktop"

    # SUID sandbox fallback for kernels without unprivileged user
    # namespaces (e.g. linux-hardened); matches Arch's chromium package.
    chmod 4755 "$pkgdir/opt/Spawn/chrome-sandbox"
}
