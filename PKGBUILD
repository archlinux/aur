# Maintainer: AntiApple4life <antiapple@antiapple.net>
_pkgname=emerald-legacy-launcher
pkgname=${_pkgname}-git
pkgver=r119.8dfab72
pkgrel=1
pkgdesc="FOSS, cross-platform launcher for Minecraft Legacy Console Edition"
arch=('x86_64')
url="https://github.com/LCE-Hub/LCE-Emerald-Launcher"
license=('GPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
optdepends=('discord: Discord RPC support')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=('emerald-legacy-launcher')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  pnpm install
  pnpm tauri build --bundles=deb
}

package() {
  cd "$srcdir/$_pkgname"
  cp -a src-tauri/target/release/bundle/deb/LCE\ Emerald\ Launcher_*_amd64/data/* "${pkgdir}"
}
