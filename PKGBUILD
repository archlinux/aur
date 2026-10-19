# Maintainer: nopw <aur@n0.pw>

pkgname=stremio-linux-shell-git
pkgver=1.2.2.r36.gd7b2c91
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
  'libepoxy' # dlopen()ed at runtime
  'glib2'
  'nodejs' # runs server.js
  'ffmpeg' # used by server.js
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
  'gettext'
)

provides=('stremio-linux-shell' 'stremio')
conflicts=('stremio' 'stremio-linux-shell')
options=(!lto)
source=("git+https://github.com/Stremio/stremio-linux-shell.git" "patch-server-path-env.patch")
sha256sums=('SKIP' 'c20584d54991c6efc9d1dcdb0192e5a5b604c0bc85eeff224d62645af6e97c8d')

pkgver() {
  cd "stremio-linux-shell"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "stremio-linux-shell"

  patch -Np1 -i ../patch-server-path-env.patch

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "stremio-linux-shell"
  export CARGO_TARGET_DIR=target
  export STREMIO_LOCALEDIR=/usr/share/locale
  cargo build --release --locked
}

package() {
  cd "stremio-linux-shell"

  install -Dm755 "target/release/stremio-linux-shell" "$pkgdir/usr/bin/stremio"
  install -Dm644 "data/server.js" "$pkgdir/usr/lib/stremio/server.js"

  install -Dm644 "data/com.stremio.Stremio.desktop" \
    "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
  sed -i '/^[[:space:]]*DBusActivatable[[:space:]]*=[[:space:]]*true[[:space:]]*$/d' \
    "$pkgdir/usr/share/applications/com.stremio.Stremio.desktop"
  install -Dm644 "data/icons/com.stremio.Stremio.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.stremio.Stremio.svg"
  install -Dm644 "data/com.stremio.Stremio.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/com.stremio.Stremio.metainfo.xml"
  install -Dm644 "data/com.stremio.Stremio.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/com.stremio.Stremio.gschema.xml"
  install -Dm644 "data/stremio.1" "$pkgdir/usr/share/man/man1/stremio.1"

  for mo in target/locale/*/LC_MESSAGES/stremio.mo; do
    install -Dm644 "$mo" "$pkgdir/usr/share/${mo#target/}"
  done
}
