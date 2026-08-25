# Maintainer: nopw <aur@n0.pw>

pkgname=stremio-linux-shell-git
pkgver=v1.2.0.r0.gc6e7cd2
pkgrel=1
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
source=("git+https://github.com/Stremio/stremio-linux-shell.git" "patch-server-path-env.patch" "fix-mpv-locale.patch")
sha256sums=('SKIP' 'c20584d54991c6efc9d1dcdb0192e5a5b604c0bc85eeff224d62645af6e97c8d' '43adf37f945378793a666b4891cd3d5d721b98a83c21a961c685bec8ddd1c7e9')

pkgver() {
  cd "stremio-linux-shell"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "stremio-linux-shell"

  patch -Np1 -i ../patch-server-path-env.patch 
  patch -Np1 -i ../fix-mpv-locale.patch

  git submodule update --init --recursive
  cargo fetch --locked
}

build() {
  cd "stremio-linux-shell"
  cargo build --release --locked
}

package() {
  cd "stremio-linux-shell"

  install -Dm755 "data/server.js" "$pkgdir/usr/lib/stremio/server.js"
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
