# Maintainer: LeTuR <https://github.com/LeTuR>
# makepkg reads these variables and supplies $pkgdir/$srcdir.
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=thurbox-bin
pkgver=2.67.3
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
sha256sums_x86_64=('cde617e5a0c3f54897c33373bae80ddc89ea5bf3a10a9b9b56c9780a1e590125')
sha256sums_aarch64=('20c54d250194e2ec19865d723341e9df2f616ed848ff6204b6762fe8a195bb29')

package() {
    # The tarball may also contain a legacy thurbox-mcp binary; we install
    # only the maintained binaries.
    install -Dm0755 -t "$pkgdir/usr/bin/" thurbox thurbox-cli
    install -Dm0644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
