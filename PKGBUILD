# Maintainer: debpalash <4178343+debpalash@users.noreply.github.com>
pkgbase=bootable
pkgname=('bootable-tui' 'bootable-gui')
pkgver=0.1.4
pkgrel=1
pkgdesc='Safety-first boot media writer with matching desktop and terminal interfaces'
arch=('x86_64')
url='https://github.com/debpalash/bootable'
license=('Apache-2.0')
makedepends=('cargo' 'pkgconf' 'fontconfig' 'libxkbcommon-x11')
options=('!lto')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46ef04a8318224a78f1f1f63088422f572c1bb7f8fc8d871cc771169408200b2')

prepare() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p bootable-core -p bootable-tui -p bootable-helper
}

package_bootable-tui() {
  pkgdesc='Bootable terminal interface, CLI API, and privileged write helper'
  depends=('gcc-libs' 'glibc' 'polkit')
  provides=("bootable=$pkgver")
  cd "$pkgbase-$pkgver"
  install -Dm755 target/release/bootable "$pkgdir/usr/bin/bootable"
  install -Dm755 target/release/bootable-helper "$pkgdir/usr/libexec/bootable-helper"
  install -Dm644 packaging/app.bootable.write-media.policy \
    "$pkgdir/usr/share/polkit-1/actions/app.bootable.write-media.policy"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_bootable-gui() {
  pkgdesc='Bootable desktop interface'
  depends=("bootable-tui=$pkgver" 'fontconfig' 'libxkbcommon-x11' 'wayland' 'vulkan-icd-loader' 'gcc-libs' 'glibc')
  optdepends=('vulkan-driver: GPU rendering backend for the desktop interface')
  cd "$pkgbase-$pkgver"
  install -Dm755 target/release/bootable-desktop "$pkgdir/usr/bin/bootable-desktop"
  sed 's|@EXEC@|/usr/bin/bootable-desktop|g' packaging/app.bootable.Bootable.desktop \
    > app.bootable.Bootable.desktop
  install -Dm644 app.bootable.Bootable.desktop \
    "$pkgdir/usr/share/applications/app.bootable.Bootable.desktop"
  install -Dm644 assets/bootable-mark.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/bootable.svg"
  install -Dm644 assets/bootable-mark.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/bootable.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
