# Maintainer: LeTuR <https://github.com/LeTuR>
# makepkg reads these variables and supplies $pkgdir/$srcdir.
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=thurbox-bin
pkgver=2.81.0
pkgrel=1
pkgdesc="TUI for orchestrating multiple coding-agent CLI sessions in persistent tmux panels (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Thurbeen/thurbox"
license=('MIT')
# Uses the statically-linked musl release tarball, so only the runtime
# helpers tmux/git are needed.
depends=('tmux' 'git')
provides=('thurbox')
conflicts=('thurbox')
# Release binaries are already stripped; skip strip/debug to avoid empty -debug pkg.
options=('!strip' '!debug')
# The release tarball ships the binaries but not LICENSE, so fetch it separately.
# Per-arch arrays, so each arch carries its own tarball's sum; CI's
# `updpkgsums` recomputes every array on release.
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Thurbeen/thurbox/v$pkgver/LICENSE")
source_x86_64=("thurbox-$pkgver-x86_64.tar.gz::https://github.com/Thurbeen/thurbox/releases/download/v$pkgver/thurbox-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("thurbox-$pkgver-aarch64.tar.gz::https://github.com/Thurbeen/thurbox/releases/download/v$pkgver/thurbox-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('6c24e78d9603d3f074127a789b3c913ea7b5f18900816af16194f7abbef9275e')
sha256sums_x86_64=('a6e8b78b09e74f56ce534fcaf9759b322d75025a8d84da1b6f9e628786411147')
sha256sums_aarch64=('0a04f3ee4bc216b0bc53c446e15bc6655d8c229b6c3e863697c9d1a0e2fe6f50')

package() {
    # The tarball may also contain a legacy thurbox-mcp binary; we install
    # only the maintained binaries.
    install -Dm0755 -t "$pkgdir/usr/bin/" thurbox thurbox-cli
    install -Dm0644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
