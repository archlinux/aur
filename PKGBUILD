# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=liscan
pkgver=0.1.0
pkgrel=1
pkgdesc="Clear, complete disk usage scanner for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/RamazanBerk20/LiScan"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'glib2' 'polkit')
makedepends=('cargo' 'pnpm' 'rust')
optdepends=(
  'gvfs: scan remote locations'
  'kio: file-manager context menu integration'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5a3c36bcd74523df489843ed99fecd6ff4f4435b350e23219746fdb6684fb20d')

build() {
  cd "LiScan-$pkgver"
  pnpm install --frozen-lockfile
  pnpm build
  cargo build --manifest-path src-tauri/Cargo.toml --release --locked --bin liscan
  cargo build --manifest-path src-tauri/admin-helper/Cargo.toml \
    --target-dir src-tauri/target --release --locked
}

check() {
  cd "LiScan-$pkgver"
  pnpm test
  cargo test --manifest-path src-tauri/Cargo.toml --all-targets --release --locked
  cargo test --manifest-path src-tauri/admin-helper/Cargo.toml \
    --target-dir src-tauri/target --release --locked
}

package() {
  cd "LiScan-$pkgver"
  install -Dm755 src-tauri/target/release/liscan "$pkgdir/usr/bin/liscan"
  install -Dm755 src-tauri/target/release/liscan-admin-helper \
    "$pkgdir/usr/libexec/liscan/liscan-admin-helper"
  install -Dm644 packaging/io.github.liscan.LiScan.policy \
    "$pkgdir/usr/share/polkit-1/actions/io.github.liscan.LiScan.policy"
  install -Dm644 packaging/io.github.liscan.LiScan.desktop \
    "$pkgdir/usr/share/applications/LiScan.desktop"
  install -Dm644 packaging/io.github.liscan.LiScan.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.liscan.LiScan.metainfo.xml"
  install -Dm644 packaging/liscan-servicemenu.desktop \
    "$pkgdir/usr/share/kio/servicemenus/liscan.desktop"
  install -Dm644 src-tauri/icons/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.liscan.LiScan.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
