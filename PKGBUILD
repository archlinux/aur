# Maintainer: Marcus Ordoñez <guitaripod@gmail.com>
pkgname=tailscode
pkgver=1.31
pkgrel=1
pkgdesc="Coding agents over Tailscale — a GTK4 client for Claude Code and opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Tailscode"
license=('GPL-3.0-or-later')
# Every optional pane is decided at build time by probing for its headers, so the libraries the
# terminal, video and browser slots need are real runtime dependencies of the binary this package
# produces rather than optdepends: the loader resolves them before main and the app never starts
# without them.
depends=('gtk4' 'libadwaita' 'glib2' 'gdk-pixbuf2' 'libepoxy' 'vte4' 'mpv' 'webkitgtk-6.0'
         'curl')
# swift-bin is the AUR toolchain; a swiftly install on PATH satisfies this too.
makedepends=('swift-bin' 'git')
optdepends=('tailscale: reach the machine your agent runs on')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    # SwiftPM resolves over the network, which makepkg allows here and not in package().
    cd "$srcdir/Tailscode-$pkgver/TailscodeLinux"
    TAILSCODE_KIT_REMOTE=1 swift package resolve
}

build() {
    cd "$srcdir/Tailscode-$pkgver"
    PREFIX=/usr scripts/package-linux.sh build
}

package() {
    cd "$srcdir/Tailscode-$pkgver"
    PREFIX=/usr scripts/package-linux.sh install "$pkgdir"
}
