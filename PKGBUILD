# Maintainer: AntiApple4life <antiapple@antiapple.net>
_pkgname=emerald-legacy-launcher
pkgname=${_pkgname}-git
pkgver=1.3.0.r6.g7baa96c
pkgrel=1
pkgdesc="FOSS, cross-platform launcher for Minecraft Legacy Console Edition"
arch=('x86_64')
url="https://github.com/LCE-Hub/LCE-Emerald-Launcher"
license=('GPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
optdepends=('discord: Discord RPC support')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=('emerald-legacy-launcher')
conflicts=('emerald-legacy-launcher')
source=("$_pkgname::git+$url" "no-updater.patch")
sha256sums=('SKIP'
            '8aee475faee5f51bb727fc947daa836fa2eb0f137c3313bf01cbf897ac45d7c3')
pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    patch -d "$srcdir/$_pkgname" -Np1 -i $srcdir/no-updater.patch
}


build() {
  CFLAGS+=' -ffat-lto-objects'
  cd "$srcdir/$_pkgname"
  pnpm install
  pnpm tauri build --bundles=deb
}

package() {
  cd "$srcdir/$_pkgname"
  cp -a src-tauri/target/release/bundle/deb/LCE\ Emerald\ Launcher_*_amd64/data/* "${pkgdir}"
}
