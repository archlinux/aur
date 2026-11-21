# Maintainer: Eduardo Parra <eduparra90@gmail.com>
pkgname=toolhive-studio-bin
_pkgname=toolhive-studio
pkgver=0.41.0
pkgrel=2
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
conflicts=('toolhive-studio')
options=(!strip !debug emptydirs)
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/toolhive_${pkgver}_amd64.deb")
sha256sums=('a8bb1353bb049e9b11b0c2e961fb361f9883a2001ea270882e8894451097fdde')

package() {
    # Extract the .deb (ar archive), then locate its data payload regardless
    # of the compression format used by the upstream release (or its suffix).
    cd "$srcdir"
    bsdtar -xf "$pkgname-$pkgver.deb"
    payload=$(find "$srcdir" -maxdepth 1 -type f -name 'data.tar*' -print -quit)
    [[ -n "$payload" ]] || {
        error "No data.tar payload found in the upstream .deb"
        return 1
    }
    bsdtar -xf "$payload" -C "$pkgdir"

    # Electron's setuid sandbox helper must be SUID root to avoid relying on
    # unprivileged user namespaces (which Arch's hardened kernels disable).
    chmod 4755 "$pkgdir/usr/lib/toolhive/chrome-sandbox"

    # Drop Debian-specific files that aren't useful on Arch.
    rm -rf "$pkgdir/usr/share/lintian" "$pkgdir/usr/share/doc/toolhive/changelog.gz" 2>/dev/null || true
}
