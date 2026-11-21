# Maintainer: Marcus Ordoñez <marcus@midgarcorp.cc>
pkgname=tailscode
pkgver=1.84
pkgrel=1
pkgdesc="Coding agents over Tailscale — a GTK4 client for Claude Code and opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Tailscode"
license=('GPL-3.0-or-later')
# Every optional pane is decided at build time by probing for its headers, so the libraries the
# video and browser slots need are real runtime dependencies of the binary this package produces
# rather than optdepends: the loader resolves them before main and the app never starts without
# them. The terminal's engine is linked into the binary and needs nothing at run time.
depends=('gtk4' 'libadwaita' 'glib2' 'gdk-pixbuf2' 'libepoxy' 'mpv' 'webkitgtk-6.0' 'libpulse'
         'gtk4-layer-shell' 'curl')
# swift-bin is the AUR toolchain; a swiftly install on PATH satisfies this too.
makedepends=('swift-bin' 'git')
optdepends=('tailscale: reach the machine your agent runs on')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    # SwiftPM resolves over the network, which makepkg allows here and not in package().
    cd "$srcdir/Tailscode-$pkgver/TailscodeLinux"
    TAILSCODE_KIT_REMOTE=1 swift package resolve
    # The terminal's engine: fetched, checked against its pinned checksums and built here, where
    # the network is allowed. It uses the system's Zig 0.17 when there is one.
    "$srcdir/Tailscode-$pkgver/scripts/ghostty-vt.sh"
}

build() {
    cd "$srcdir/Tailscode-$pkgver"
    PREFIX=/usr scripts/package-linux.sh build
}

package() {
    cd "$srcdir/Tailscode-$pkgver"
    PREFIX=/usr scripts/package-linux.sh install "$pkgdir"
}
