# Maintainer: Jonaz Thern <info@thern.io>
pkgname=moraine
pkgver=0.2.0
pkgrel=1
pkgdesc='Snapshot-based backup over SSH/rsync and rclone (CLI + GTK desktop app)'
arch=('x86_64')
options=('!debug')  # no separate -debug package
url='https://github.com/TheJonaz/moraine-backup'
license=('MIT')
depends=('gtk4' 'rsync' 'openssh')
optdepends=('rclone: cloud/FTP/SMB/WebDAV/S3 backends'
            'gnupg: encrypted config export/import'
            'networkmanager: per-target VPN')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb6ea6a9946adee8572392042ff26b22d54bd9d2afb899ca63156093d2d9751b')
_srcdir="moraine-backup-$pkgver"

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$_srcdir"
  install -Dm755 target/release/moraine     "$pkgdir/usr/bin/moraine"
  install -Dm755 target/release/moraine-gui "$pkgdir/usr/bin/moraine-gui"

  install -Dm644 assets/moraine-gui.desktop "$pkgdir/usr/share/applications/moraine-gui.desktop"
  install -Dm644 assets/moraine.svg      "$pkgdir/usr/share/icons/hicolor/scalable/apps/moraine.svg"
  install -Dm644 assets/moraine-256.png  "$pkgdir/usr/share/icons/hicolor/256x256/apps/moraine.png"
  install -Dm644 assets/moraine-128.png  "$pkgdir/usr/share/icons/hicolor/128x128/apps/moraine.png"
  install -Dm644 assets/moraine-64.png   "$pkgdir/usr/share/icons/hicolor/64x64/apps/moraine.png"
  install -Dm644 assets/moraine-48.png   "$pkgdir/usr/share/icons/hicolor/48x48/apps/moraine.png"

  # Runtime assets the GUI loads from /usr/share/moraine/assets.
  install -Dm644 assets/hero-bg.png     "$pkgdir/usr/share/moraine/assets/hero-bg.png"
  install -Dm644 assets/moraine-64.png  "$pkgdir/usr/share/moraine/assets/moraine-64.png"
  install -Dm644 assets/moraine-256.png "$pkgdir/usr/share/moraine/assets/moraine-256.png"

  install -Dm644 debian/moraine.1     "$pkgdir/usr/share/man/man1/moraine.1"
  install -Dm644 debian/moraine-gui.1 "$pkgdir/usr/share/man/man1/moraine-gui.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
