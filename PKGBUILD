# Maintainer: loki5512344 <dev14dbq@gmail.com>

pkgname=wherry
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern dual-pane file manager with SFTP/FTP/FTPS support"
arch=('x86_64')
url='https://github.com/loki5512344/Wherry'
license=('GPL3')
depends=(
  'gcc-libs'
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'librsvg'
  'openssl'
  'libssh2'
  'dbus'
)
makedepends=('cargo' 'pkg-config')
source=("https://github.com/loki5512344/Wherry/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c9ee91948fdad352ba797ce8652bf626797769a74e2707504184f541eecf0ab')

_repodir="Wherry-$pkgver"

prepare() {
  cd "$srcdir/$_repodir"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_repodir"
  export CARGO_TARGET_DIR="$srcdir/target"
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER="/usr/bin/cc"
  cargo build --release --frozen
}

package() {
  cd "$srcdir/$_repodir"
  install -Dm755 "$srcdir/target/release/wherry" "$pkgdir/usr/bin/wherry"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 src/icons/128x128.png "$pkgdir/usr/share/pixmaps/wherry.png"
  install -Dm644 dist/wherry.desktop "$pkgdir/usr/share/applications/wherry.desktop"
}
