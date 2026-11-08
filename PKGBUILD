# Maintainer: Shin Sterneck <shinsterneck at gmail dot com>
#
# This file is part of Stratagram: https://github.com/shinsterneck/stratagram
# Copyright 2026 Shin Sterneck. Licensed under the Apache License, Version 2.0 (see LICENSE).
# SPDX-License-Identifier: Apache-2.0
#
# The AUR package (https://aur.archlinux.org/packages/stratagram): the
# desktop app built from a release's source, with its menu entry, icon,
# .stratagram file type and software center details. For a new release:
# set pkgver, run `updpkgsums` and `makepkg --printsrcinfo > .SRCINFO`.

pkgname=stratagram
pkgver=1.0.4
pkgrel=1
pkgdesc='Network diagram editor: standardized stencils and line types, quick add and auto layout'
arch=('x86_64' 'aarch64')
url='https://stratagram.app/'
license=('Apache-2.0')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=('xdg-desktop-portal: the desktop'"'"'s own open and save dialogs')
# makepkg's LTO compiles the C++ parts (CXX-Qt) to GCC's intermediate code,
# which the Rust linker cannot read.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shinsterneck/stratagram/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3572a94f8c43bba18e21962b350219d24271e0cf6358e733edc6eb84ccb0c156')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export QMAKE=/usr/bin/qmake6
  cargo build --frozen --release -p stratagram
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -p stratagram-core
}

package() {
  cd "$pkgname-$pkgver"
  local id=app.stratagram.Stratagram
  install -Dm755 target/release/stratagram "$pkgdir/usr/bin/stratagram"
  install -Dm644 "packaging/$id.desktop" "$pkgdir/usr/share/applications/$id.desktop"
  install -Dm644 packaging/stratagram.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$id.svg"
  install -Dm644 "packaging/$id.mime.xml" "$pkgdir/usr/share/mime/packages/$id.xml"
  install -Dm644 "packaging/$id.metainfo.xml" "$pkgdir/usr/share/metainfo/$id.metainfo.xml"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
