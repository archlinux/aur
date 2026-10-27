# Maintainer: Enova <enova@enovale.com>
_pkgname=firesync
pkgname=firesync-git
pkgver=v1.2.0.r0.g0285236-1
pkgrel=1
pkgdesc="A companion app for Fireshare that automatically detects and uploads new videos and screenshots."
arch=('x86_64')
url="https://github.com/fireshare-app/firesync"
license=('GPLv3')
groups=()
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1') # Tauri runtime
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'npm' 'nodejs') # Build deps
provides=('firesync')
conflicts=()
replaces=()
options=(!lto)
changelog=
source=("git+https://github.com/fireshare-app/firesync.git")
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$_pkgname"
  npm ci
}

build() {
  cd "$_pkgname"
  npm run tauri -- build -b deb --no-sign
}

package() {
  cd "$_pkgname"
  tag=$(git describe 2>/dev/null | sed 's/^v//g')
  cp -a src-tauri/target/release/bundle/deb/Firesync_${tag}_*/data/* "${pkgdir}"
}
