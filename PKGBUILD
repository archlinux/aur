# Maintainer: Nate Sheibley <n.sheibley@gmail.com>

pkgname=riftlauncher-bin
pkgver=1.7.0_beta.9
pkgrel=1
pkgdesc="Vintage Story launcher by the Stratum Server Devs"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/StratumServer/RiftLauncher"
license=('MIT')

_riftver="${pkgver//_/-}"
_archive="riftlauncher-${_riftver}.pacman"

depends=(
    'gtk3'
    'nss'
    'alsa-lib'
)

source=(
    "$_archive::${url}/releases/download/v${_riftver}/${_archive}"
    "riftlauncher-LICENSE::https://github.com/StratumServer/RiftLauncher/raw/refs/heads/main/LICENSE"
)

sha256sums=(
    'b51aa0cc10efd90a965af91f79a7c366c47fd27f2eeb0efc387c410af69b6b6b'
    '5a2ee6564e40040332174f7faf48810a1a0815fceb203d33d140da6497d68115'
)

package() {
    bsdtar -xf "$srcdir/$_archive" \
        -C "$pkgdir" \
        --exclude='.PKGINFO' \
        --exclude='.MTREE' \
        --exclude='.INSTALL'

    install -Dm644 "$srcdir/riftlauncher-LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/riftlauncher-LICENSE"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/RiftLauncher/riftlauncher \
        "$pkgdir/usr/bin/riftlauncher"

    # The upstream .INSTALL conditionally installs an AppArmor profile into
    # /etc/apparmor.d. Keep the bundled profile under /opt/RiftLauncher
    # rather than modifying the host's AppArmor configuration automatically.

    # Use the non-SUID Chromium sandbox when user namespaces are available.
    chmod 0755 "$pkgdir/opt/RiftLauncher/chrome-sandbox"
}
