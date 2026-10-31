# Maintainer: Yangtse Su <yangtsesu at gmail dot com>
# SPDX-FileCopyrightText: 2026 Yangtse Su <yangtsesu@gmail.com>
# SPDX-License-Identifier: 0BSD
#
# Split release package: the daemon/CLI/MCP and the GTK app share one Cargo
# build, so the dependency graph is compiled once. The source is the archive
# attached to the GitHub release; the project repository carries no PKGBUILD.
#
# Every bump:
#   makepkg --printsrcinfo | diff - .SRCINFO
#   makepkg -f && namcap atvv-*.pkg.tar.zst

pkgbase=atvv
pkgname=('atvv' 'atvv-gui')
pkgver=0.1.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/YangtseSu/atvv-linux'
license=('GPL-3.0-or-later')
makedepends=('clang' 'pkgconf' 'rust' 'gtk4' 'libadwaita' 'bluez')
options=('!debug')
source=("atvv-linux-$pkgver.tar::https://github.com/YangtseSu/atvv-linux/releases/download/v$pkgver/atvv-linux-$pkgver.tar")
sha256sums=('98ee8ebd4daec368db8687c2e81c35c6ae252fd5c65b3f0c06a46e9e20c39d17')
_source="atvv-linux-$pkgver"

prepare() {
  cd "$_source"
  cargo fetch --locked
}

build() {
  cd "$_source"
  # One invocation compiles the shared graph once and produces every binary.
  cargo build --release --offline --locked \
    -p atvv-daemon -p atvv-cli -p atvv-mcp -p atvv-gui --bins
}

# No check(): CI runs the workspace tests on the tag. A release test harness
# here would compile every library a second time.

package_atvv() {
  pkgdesc='Bluetooth voice remote userspace stack'
  depends=('pipewire' 'bluez' 'dbus')
  conflicts=('atvv-git')
  cd "$_source"

  install -Dm755 target/release/atvvd "$pkgdir/usr/bin/atvvd"
  install -Dm755 target/release/atvvctl "$pkgdir/usr/bin/atvvctl"
  install -Dm755 target/release/atvv-mcp "$pkgdir/usr/bin/atvv-mcp"

  install -Dm644 packaging/systemd/atvvd.service \
    "$pkgdir/usr/lib/systemd/user/atvvd.service"
  install -Dm644 packaging/udev/70-atvv-linux.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-atvv-linux.rules"
  install -Dm644 packaging/modules-load.d/atvv-linux.conf \
    "$pkgdir/usr/lib/modules-load.d/atvv-linux.conf"

  install -d "$pkgdir/usr/share/man/man1"
  ./target/release/atvvctl manpages "$pkgdir/usr/share/man/man1"
  install -m644 packaging/man/atvv-mcp.1 "$pkgdir/usr/share/man/man1/atvv-mcp.1"

  install -d "$pkgdir/usr/share/bash-completion/completions"
  ./target/release/atvvctl completions bash \
    >"$pkgdir/usr/share/bash-completion/completions/atvvctl"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  ./target/release/atvvctl completions zsh \
    >"$pkgdir/usr/share/zsh/site-functions/_atvvctl"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  ./target/release/atvvctl completions fish \
    >"$pkgdir/usr/share/fish/vendor_completions.d/atvvctl.fish"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README.zh-CN.md "$pkgdir/usr/share/doc/$pkgname/README.zh-CN.md"
  install -Dm644 docs/device-support.md \
    "$pkgdir/usr/share/doc/$pkgname/docs/device-support.md"
  install -Dm644 docs/device-support.zh-CN.md \
    "$pkgdir/usr/share/doc/$pkgname/docs/device-support.zh-CN.md"
  install -Dm644 docs/configuration.md \
    "$pkgdir/usr/share/doc/$pkgname/docs/configuration.md"
  install -Dm644 docs/configuration.zh-CN.md \
    "$pkgdir/usr/share/doc/$pkgname/docs/configuration.zh-CN.md"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-NOTICES.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
}

package_atvv-gui() {
  pkgdesc='GTK4/libadwaita configuration app for ATVV remotes'
  depends=('gtk4' 'libadwaita' 'librsvg' "atvv=$pkgver")
  conflicts=('atvv-gui-git')
  cd "$_source"

  install -Dm755 target/release/atvv-config "$pkgdir/usr/bin/atvv-config"
  install -Dm644 packaging/gui/org.atvv.Config.desktop \
    "$pkgdir/usr/share/applications/org.atvv.Config.desktop"
  install -Dm644 packaging/gui/org.atvv.Config.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.atvv.Config.metainfo.xml"
  install -Dm644 packaging/gui/org.atvv.Config.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.atvv.Config.svg"

  install -Dm644 docs/gui.md "$pkgdir/usr/share/doc/$pkgname/gui.md"
  install -Dm644 docs/gui.zh-CN.md "$pkgdir/usr/share/doc/$pkgname/gui.zh-CN.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-NOTICES.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
}
