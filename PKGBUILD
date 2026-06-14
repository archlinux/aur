# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=streamcraft
pkgver=2.0.1
pkgrel=1
pkgdesc="Proprietary Minecraft launcher (Linux bootstrap)"
# x86_64 only: the bootstrap self-downloads an x64-only JRE8 and game payload at
# runtime (no aarch64 Linux runtime is offered upstream), so it only functions
# there. Contents are arch-independent (a JAR), hence namcap's "no ELF / not any"
# warning; x86_64 is the honest, broken-on-ARM-preventing choice.
arch=('x86_64')
url="https://streamcraft.net"
# Proprietary: upstream ships no license/EULA file, so none is installed (blocker).
license=('LicenseRef-proprietary')
# gtk2: the launcher is JavaFX 8 forced to GTK2 by the wrapper (see streamcraft.sh).
depends=('java-runtime>=8' 'gtk2' 'hicolor-icon-theme')
source=("streamcraft-bootstrap-${pkgver}.jar::https://s3.streamcraft.net/uploads/launcher-download/streamcraft-bootstrap-${pkgver}-all.jar"
        'streamcraft.sh'
        'streamcraft.desktop')
noextract=("streamcraft-bootstrap-${pkgver}.jar")
sha256sums=('62aa9ff211577d278ebb696e523c247e3e877bfecb47b1dee15dab50180a7b0c'
            '4541ed1ffd1bed4f0ac74b3c240bf0daf76429c4d8d1b15271d3d686f265f556'
            'e842335b2abfc3cee9f7765d36a219446348ce1b653958b8048d7b3bb9ea1e86')
options=('!debug')

# Canonical version source: the download page API embeds the Linux bootstrap
# jar filename with its version (plain curl, no auth).
latestver() {
    curl -fsSL "https://streamcraft.net/api/pages/download" |
        grep -aoE 'streamcraft-bootstrap-[0-9.]+-all\.jar' |
        grep -aoE '[0-9]+(\.[0-9]+)+' | sort -V | tail -1
}

package() {
    install -Dm644 "streamcraft-bootstrap-${pkgver}.jar" \
        "${pkgdir}/usr/share/streamcraft/streamcraft-bootstrap.jar"
    install -Dm755 streamcraft.sh "${pkgdir}/usr/bin/streamcraft"
    install -Dm644 streamcraft.desktop "${pkgdir}/usr/share/applications/streamcraft.desktop"
    bsdtar -xOf "streamcraft-bootstrap-${pkgver}.jar" assets/icons/icon.png |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/icons/hicolor/64x64/apps/streamcraft.png"
}
