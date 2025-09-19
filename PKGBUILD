# Maintainer: nopw <aur@n0.pw>

pkgname=stremio-linux-shell-git
pkgver=v1.0.0.beta.11.r5.gca88264
pkgrel=2
pkgdesc="A native Linux client for Stremio"
arch=('x86_64')
url="https://github.com/Stremio/stremio-linux-shell"
license=('GPL-3.0-only')

depends=(
  'gtk4'
  'libadwaita'
  'webkitgtk-6.0'   
  'mpv'
  'libepoxy'
  'openssl'
  'gettext'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
  'cmake'
  'binutils'
  'licenses'
  'nodejs'
  'gtk4'
  'libadwaita'
  'webkitgtk-6.0'
  'mpv'
  'libepoxy'
  'gettext'
)

provides=('stremio-linux-shell' 'stremio')
conflicts=('stremio' 'stremio-linux-shell')
options=(!lto)
source=("git+https://github.com/Stremio/stremio-linux-shell.git")
sha256sums=('SKIP')

pkgver() {
  cd "stremio-linux-shell"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "stremio-linux-shell"
  git submodule update --init --recursive
  cargo fetch --locked
}

build() {
  cd "stremio-linux-shell"
  cargo build --release --locked
}

package() {
  cd "stremio-linux-shell"

  install -Dm755 "target/release/stremio-linux-shell" "$pkgdir/usr/bin/stremio"

  install -Dm644 "data/com.stremio.Stremio.desktop" \
    "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
  sed -i '/^[[:space:]]*DBusActivatable[[:space:]]*=[[:space:]]*true[[:space:]]*$/d' \
    "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
  install -Dm644 "data/icons/com.stremio.Stremio.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.stremio.Stremio.svg"
  install -Dm644 "data/com.stremio.Stremio.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/com.stremio.Stremio.metainfo.xml"

  install -Dm644 /usr/share/licenses/spdx/GPL-3.0-only.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
