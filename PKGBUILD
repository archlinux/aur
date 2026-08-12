# Maintainer: Eduardo Parra <eduparra90@gmail.com>
pkgname=toolhive-studio-bin
_pkgname=toolhive-studio
pkgver=0.39.4
pkgrel=1
pkgdesc="Desktop app to install, manage and run MCP servers and connect them to AI agents and clients (Electron, repackaged from upstream .deb)"
arch=('x86_64')
url="https://github.com/stacklok/toolhive-studio"
license=('Apache-2.0')
depends=(
    'gtk3'
    'libnotify'
    'nss'
    'xdg-utils'
    'at-spi2-core'
    'libdrm'
    'mesa'
    'libxcb'
    'libxkbcommon'
    'libsecret'
)
optdepends=(
    'libpulse: PulseAudio sound support'
    'alsa-lib: ALSA sound support'
    'kde-cli-tools: trash support on KDE'
    'trash-cli: trash support outside KDE/GNOME'
    'gnome-keyring: secret storage via GNOME Keyring'
    'kwallet: secret storage via KWallet'
)
provides=('toolhive-studio' 'toolhive')
conflicts=('toolhive-studio' 'toolhive')
options=(!strip !debug emptydirs)
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/toolhive_${pkgver}_amd64.deb")
sha256sums=('18d6448615cbfefa81e0437698291c3cce9f4b53f0f8e4eeccf48f36d912f8a9')

package() {
    # Extract the .deb (ar archive) and its data payload (zstd-compressed tar)
    cd "$srcdir"
    bsdtar -xf "$pkgname-$pkgver.deb"
    bsdtar -xf data.tar.zst -C "$pkgdir"

    # Electron's setuid sandbox helper must be SUID root to avoid relying on
    # unprivileged user namespaces (which Arch's hardened kernels disable).
    chmod 4755 "$pkgdir/usr/lib/toolhive/chrome-sandbox"

    # Drop Debian-specific files that aren't useful on Arch.
    rm -rf "$pkgdir/usr/share/lintian" "$pkgdir/usr/share/doc/toolhive/changelog.gz" 2>/dev/null || true
}
