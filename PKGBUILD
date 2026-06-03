# Maintainer: meatyari <https://github.com/MeatyAri>
pkgname=slideflare-git
pkgver=r70.f9b97ab
pkgrel=1
pkgdesc="⚡ Blazing fast, interactive presentation tool for developers, educators, and creators"
arch=('x86_64' 'aarch64')
url="https://github.com/MeatyAri/slideflare"
license=('MIT')
depends=(
  'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
  'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1'
)
makedepends=(
  'git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3'
  'librsvg' 'cargo' 'bun' 'nodejs'
)
provides=('slideflare')
conflicts=('slideflare')
options=('!strip' '!emptydirs' '!debug')
install="${pkgname}.install"
source=("git+https://github.com/MeatyAri/slideflare.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  local describe
  describe=$(git describe --long 2>/dev/null) && {
    printf '%s' "${describe//-/.}"
    return
  }
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd slideflare
  bun install --frozen-lockfile
}

build() {
  cd slideflare
  bun run tauri build -b deb
}

package() {
  local deb_file
  deb_file=$(find slideflare/src-tauri/target/release/bundle/deb -maxdepth 1 -name '*.deb' | head -1)
  # Extract data.tar.gz from the .deb and place into pkgdir
  ar p "${deb_file}" data.tar.gz | tar -xzf - -C "${pkgdir}"
}
