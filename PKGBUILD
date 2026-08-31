# Maintainer: AntiApple4life <antiapple@antiapple.net>
pkgname=emerald-legacy-launcher
pkgver=1.6.1
pkgrel=1
pkgdesc="FOSS, cross-platform launcher for Minecraft Legacy Console Edition"
arch=('x86_64')
url="https://github.com/LCE-Hub/LCE-Emerald-Launcher"
license=('GPL-3.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
optdepends=('discord: Discord RPC support')
makedepends=('openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=('emerald-legacy-launcher')
provides=('emerald-legacy-launcher')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LCE-Hub/LCE-Emerald-Launcher/archive/refs/tags/v${pkgver}.tar.gz" "no-updater.patch")
sha256sums=('32ec9c74965e578b3bf76f458ef5a610de89d26cd9ce8baa5ec771024ac92551'
            '8aee475faee5f51bb727fc947daa836fa2eb0f137c3313bf01cbf897ac45d7c3')
_reponame="LCE-Emerald-Launcher"

prepare() {
    patch -d "$srcdir/${_reponame}-${pkgver}" -Np1 -i $srcdir/no-updater.patch
}


build() {
  CFLAGS+=' -ffat-lto-objects'
  cd "$srcdir/${_reponame}-${pkgver}"
  pnpm add esbuild --allow-build=esbuild
  pnpm install
  pnpm tauri build --bundles=deb
}

package() {
  cd "$srcdir/${_reponame}-${pkgver}"
  cp -a src-tauri/target/release/bundle/deb/LCE\ Emerald\ Launcher_${pkgver}_amd64/data/* "${pkgdir}"
}
