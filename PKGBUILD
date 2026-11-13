# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=liscan-git
pkgver=1.1.0.r0.gdd1bb4e
pkgrel=1
pkgdesc="Clear, complete disk usage scanner for Linux"
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://github.com/RamazanBerk20/LiScan"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1' 'glib2' 'polkit')
makedepends=('cargo' 'git' 'pnpm' 'rust')
optdepends=(
  'gvfs: scan remote locations'
  'kio: file-manager context menu integration'
)
provides=("liscan=$pkgver")
conflicts=('liscan')
source=("liscan::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd liscan
  git describe --long --tags --abbrev=7 2>/dev/null |
    sed 's/^v//;s/-/.r/;s/-/./' ||
    printf '1.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd liscan
  # All network fetches happen here so build() and check() work offline.
  export CARGO_HOME="$srcdir/cargo-home"
  local target
  target="$(rustc -vV | sed -n 's/host: //p')"
  pnpm install --frozen-lockfile
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml --target "$target"
  cargo fetch --locked --manifest-path src-tauri/admin-helper/Cargo.toml --target "$target"
}

build() {
  cd liscan
  export CARGO_HOME="$srcdir/cargo-home"
  pnpm build
  cargo build --manifest-path src-tauri/Cargo.toml --release --frozen --bin liscan
  cargo build --manifest-path src-tauri/admin-helper/Cargo.toml \
    --target-dir src-tauri/target --release --frozen
}

check() {
  cd liscan
  export CARGO_HOME="$srcdir/cargo-home"
  pnpm test
  cargo test --manifest-path src-tauri/Cargo.toml --all-targets --release --frozen
  cargo test --manifest-path src-tauri/admin-helper/Cargo.toml \
    --target-dir src-tauri/target --release --frozen
}

package() {
  cd liscan
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
