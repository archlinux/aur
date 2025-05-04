# Maintainer: Matheus Fillipe <mattf@mattf.one>
pkgname=obsidianirc
pkgver=0.0.1
pkgrel=1
pkgdesc="Modern IRC Client for the web and maybe more"
arch=('x86_64' 'aarch64')
url="https://github.com/ObsidianIRC/ObsidianIRC"
license=('GPLv3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=('obsidianirc')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ObsidianIRC
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd ObsidianIRC
  pnpm install
}

build() {
  cd ObsidianIRC
  pnpm tauri build -b deb
}

package() {
  cp -a ObsidianIRC/src-tauri/target/release/bundle/deb/ObsidianIRC_${pkgver}_*/data/* "${pkgdir}"
}
