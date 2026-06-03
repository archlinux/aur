# Maintainer: meatyari <https://github.com/MeatyAri>
pkgname=slideflare-git
pkgver=
pkgrel=1
pkgdesc="⚡ Blazing fast, interactive presentation tool for developers, educators, and creators"
arch=('x86_64' 'aarch64')
url="https://github.com/MeatyAri/slideflare"
license=('MIT')
depends=(
  'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
  'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1'
)
makedepends=(
  'git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3'
  'librsvg' 'cargo' 'bun' 'nodejs'
)
provides=('slideflare')
conflicts=('slideflare')
source=("git+https://github.com/MeatyAri/slideflare.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${pkgname}"
  bun install --frozen-lockfile
}

build() {
  cd "${pkgname}"
  bun run tauri build -b deb
}

package() {
  cp -a "${pkgname}/src-tauri/target/release/bundle/deb/_${pkgver}_*/data/*" "${pkgdir}/"
}
