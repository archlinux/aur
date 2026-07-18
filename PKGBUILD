# Maintainer: Nikolay Bryskin
pkgname=ppq-whisper-bin
_pkgname=ppq-whisper
pkgver=0.1.53
pkgrel=1
pkgdesc='PPQ Whisper (PPQ Voice) — cloud-powered desktop dictation app with instant clean-up'
arch=('x86_64')
url='https://github.com/PayPerQ/ppq-voice-releases'
license=('LicenseRef-proprietary')
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
    'util-linux-libs'
    'xdg-utils'
)
optdepends=('libappindicator-gtk3: tray icon support')
provides=('ppq-whisper')
conflicts=('ppq-whisper')
options=(!strip !debug)
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('bb2c11963db59e168ce49bada9a80b2516d23de043b878b2a169d16eaa713af2')

package() {
    # electron-builder deb: app in "/opt/PPQ Whisper", desktop file + icon in /usr/share
    bsdtar -xf data.tar.xz -C "$pkgdir"

    # electron-builder puts the icon in a bogus hicolor/0x0 dir; it is 256x256
    install -Dm644 "$pkgdir/usr/share/icons/hicolor/0x0/apps/$_pkgname.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    rm -r "$pkgdir/usr/share/icons/hicolor/0x0"

    # pacman does not run the deb postinst: create the /usr/bin symlink ourselves
    install -d "$pkgdir/usr/bin"
    ln -s '/opt/PPQ Whisper/ppq-whisper' "$pkgdir/usr/bin/$_pkgname"

    # SUID sandbox fallback for kernels without unprivileged user namespaces
    chmod 4755 "$pkgdir/opt/PPQ Whisper/chrome-sandbox"

    install -Dm644 "$pkgdir/opt/PPQ Whisper/LICENSE.electron.txt" \
        -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=4 sw=4 et:
