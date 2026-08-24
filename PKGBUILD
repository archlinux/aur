# Maintainer: Marcus Ordoñez <guitaripod@gmail.com>
pkgname=tailscode-git
_pkgname=tailscode
pkgver=1.24.r578.gf3c8ef6
pkgrel=1
pkgdesc="Coding agents over Tailscale — a GTK4 client for Claude Code and opencode (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/Tailscode"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glib2' 'gdk-pixbuf2' 'libepoxy' 'vte4' 'mpv' 'webkitgtk-6.0'
         'curl')
makedepends=('swift-bin' 'git')
optdepends=('tailscale: reach the machine your agent runs on')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    local version
    version=$(sed -n 's/.*static let current = "\([^"]*\)".*/\1/p' \
        TailscodeLinux/Sources/TailscodeLinux/TailscodeVersion.swift | head -1)
    printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname/TailscodeLinux"
    TAILSCODE_KIT_REMOTE=1 swift package resolve
}

build() {
    cd "$srcdir/$_pkgname"
    PREFIX=/usr scripts/package-linux.sh build
}

package() {
    cd "$srcdir/$_pkgname"
    PREFIX=/usr scripts/package-linux.sh install "$pkgdir"
}
