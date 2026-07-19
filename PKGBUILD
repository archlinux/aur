# Maintainer: VisorCraft LLC <packages@visorcraft.com>
# SPDX-FileCopyrightText: 2026 VisorCraft LLC
# SPDX-License-Identifier: 0BSD

pkgname=linsync
pkgver=1.16.3
pkgrel=1
pkgdesc="Linux-native visual file and folder comparison built on Rust and Qt 6"
arch=('x86_64')
url="https://github.com/visorcraft/LinSync"
license=('GPL-3.0-only')
depends=(
  'qt6-base'
  'qt6-declarative'
  'kirigami'
  'hicolor-icon-theme'
  'bubblewrap'
  'unzip'
  'qt6-webengine'
)
makedepends=('cargo' 'qt6-tools')
optdepends=('dolphin: KDE service-menu integration')
conflicts=('linsync-bin' 'linsync-git')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('84d6a45f552555b55ab0f4c00dc38ac21070731c8a627f47dd82c11304291fcc')

prepare() {
  cd "LinSync-$pkgver"

  export CARGO_BUILD_RUSTC_WRAPPER=
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "LinSync-$pkgver"

  export CARGO_BUILD_RUSTC_WRAPPER=
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:-}"
  QT_VERSION_MAJOR=6 cargo build --frozen --release --workspace \
    --features 'linsync/cxxqt linsync/cxxqt-app linsync/web-engine linsync-cli/web-engine'
}

check() {
  cd "LinSync-$pkgver"

  export CARGO_BUILD_RUSTC_WRAPPER=
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:-}"
  LINSYNC_SANDBOX_SKIP=1 cargo test --frozen --workspace
}

package() {
  cd "LinSync-$pkgver"

  install -Dm755 target/release/linsync "$pkgdir/usr/bin/linsync"
  install -Dm755 target/release/linsync-cli "$pkgdir/usr/bin/linsync-cli"

  install -d "$pkgdir/usr/share/linsync"
  cp -R apps/linsync-gui/qml "$pkgdir/usr/share/linsync/qml"
  cp -R packaging/plugins "$pkgdir/usr/share/linsync/plugins"
  install -Dm644 packaging/distro/git-mergetool.gitconfig \
    "$pkgdir/usr/share/linsync/git-mergetool.gitconfig"

  local lrelease
  lrelease=$(command -v lrelease6 || command -v lrelease-qt6 || command -v lrelease || echo /usr/lib/qt6/bin/lrelease)
  install -d "$pkgdir/usr/share/linsync/i18n"
  for ts in apps/linsync-gui/i18n/*.ts; do
    "$lrelease" "$ts" -qm "$pkgdir/usr/share/linsync/i18n/$(basename "${ts%.ts}").qm"
  done

  install -Dm644 packaging/com.visorcraft.LinSync.desktop \
    "$pkgdir/usr/share/applications/com.visorcraft.LinSync.desktop"
  install -Dm644 packaging/com.visorcraft.LinSync.metainfo.xml \
    "$pkgdir/usr/share/metainfo/com.visorcraft.LinSync.metainfo.xml"
  install -Dm644 packaging/com.visorcraft.LinSync.mime.xml \
    "$pkgdir/usr/share/mime/packages/com.visorcraft.LinSync.xml"
  install -Dm644 packaging/dolphin/com.visorcraft.LinSync.desktop \
    "$pkgdir/usr/share/kio/servicemenus/com.visorcraft.LinSync.desktop"

  install -Dm644 packaging/icons/hicolor/scalable/apps/com.visorcraft.LinSync.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.visorcraft.LinSync.svg"
  local size
  for size in 16 22 24 32 36 48 64 72 96 128 192 256 512; do
    install -Dm644 "packaging/icons/hicolor/${size}x${size}/apps/com.visorcraft.LinSync.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.visorcraft.LinSync.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 docs/third-party-notices.md \
    "$pkgdir/usr/share/doc/$pkgname/third-party-notices.md"
}
