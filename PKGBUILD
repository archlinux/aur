# Maintainer: NEOAPPS <asd22.info@gmail.com>
# Maintainer: Santiago Fisela <santyfisela@gmail.com>
pkgname=emerald-legacy-launcher
pkgver=1.0.0
pkgrel=1
pkgdesc="FOSS, cross-platform launcher for Minecraft Legacy Console Edition"
arch=('x86_64')
url="https://github.com/Emerald-Legacy-Launcher/Emerald-Legacy-Launcher"
license=('GPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
optdepends=('discord: Discord RPC support')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=('emerald-legacy-launcher')
source=("$pkgname::git+$url#branch=main")
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"
  pnpm install
  pnpm tauri build --bundles=deb
}

package() {
  cd "$srcdir/$pkgname"
  cp -a src-tauri/target/release/bundle/deb/Emerald*_*_*/data/* "${pkgdir}"
}