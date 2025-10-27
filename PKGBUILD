# Maintainer: Alois <alois@tensamin.net>

pkgname=tensamin-git
_pkgname=tensamin
pkgver=0
_pkgver=0.1.3
pkgrel=1
pkgdesc="True E2EE, decentralized messages. Open source and privacy first."
arch=('x86_64' 'aarch64')
url="https://github.com/Tensamin/Frontend"
license=('Custom')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'npm' 'nodejs')
provides=('tensamin')
conflicts=('tensamin-bin' 'tensamin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd Frontend
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd Frontend
  npx bun install
  npx bun tauri build -b deb
}

package() {
  cp -a Frontend/tauri/target/release/bundle/deb/tensamin_${_pkgver}_*/data/* "${pkgdir}"
}