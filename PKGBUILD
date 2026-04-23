# Maintainer: Sakura Yumine <i@nanoka.top>

pkgname="pixiv-viewer-git"
pkgver=1.32.2
_appver=$(curl -s https://api.github.com/repos/asadahimeka/pixiv-viewer-app/releases/latest | grep '"tag_name":' | cut -d '"' -f 4 | sed 's/^v//')
pkgrel=1
pkgdesc="Yet Another Pixiv Illust&Novel Viewer / 又一个 Pixiv 阅览工具"
arch=('x86_64')
url="https://github.com/asadahimeka/pixiv-viewer-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
options=('!lto' '!strip')
provides=('pixiv-viewer')
conflicts=('pixiv-viewer-bin' 'pixiv-viewer')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd pixiv-viewer-app
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd pixiv-viewer-app
  pnpm install
}

build() {
  cd pixiv-viewer-app
  pnpm tauri build -v -b deb
}

package() {
  cp -a pixiv-viewer-app/src-tauri/target/release/bundle/deb/Pixiv-Viewer_${_appver}_*/data/* "${pkgdir}"
}

