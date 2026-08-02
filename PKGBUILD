# Maintainer: Aromatic05

pkgname=limine-tool
pkgver=1.0.0
pkgrel=1
pkgdesc='Rust Limine boot entry manager and mkinitcpio integration tool'
arch=('x86_64')
url='https://github.com/CatOS-dev/limine-tool'
license=('GPL-3.0-only')
depends=(
  'bash'
  'coreutils'
  'efibootmgr'
  'limine'
  'mkinitcpio'
  'pacman'
  'systemd'
  'tar'
  'util-linux'
)
makedepends=('cargo')
optdepends=(
  'btrfs-progs: boot read-only Btrfs snapshots through the optional overlay hooks'
  'doas: privilege escalation when limine-tool is run as a user'
  'journalctl-desktop-notification: desktop notifications for hook failures'
  'kernel-modules-hook: preserve a working kernel when an upgrade fails'
  'sbctl: sign EFI binaries for Secure Boot'
  'snapper: snapshot-aware UKI command-line handling'
  'sudo: privilege escalation when limine-tool is run as a user'
)
provides=(
  'limine-entry-tool'
  'limine-mkinitcpio-hook'
)
conflicts=(
  'limine-entry-tool'
  'limine-mkinitcpio-hook'
)
backup=('etc/limine-entry-tool.conf')
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('698cc18697ec508a7aec7d0f2f5fc4dae989a7f077a9a9a757232f99bf5b3e95')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  local project_root="$srcdir/$pkgname-$pkgver"

  cp -a "$project_root/packaging/arch/rootfs/." "$pkgdir/"
  install -Dm755 "$project_root/target/release/limine-tool" \
    "$pkgdir/usr/lib/limine/limine-tool"
  install -Dm644 "$project_root/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$project_root/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$project_root/packaging/arch/UPSTREAM.md" \
    "$pkgdir/usr/share/doc/$pkgname/UPSTREAM.md"

  install -d "$pkgdir/usr/bin"
  local applet
  for applet in \
    limine-tool \
    limine-entry-tool \
    limine-list \
    limine-scan \
    limine-remove-entry \
    limine-install \
    limine-update \
    limine-mkinitcpio \
    limine-enroll-config \
    limine-reset-enroll; do
    ln -s ../lib/limine/limine-tool "$pkgdir/usr/bin/$applet"
  done
  ln -s limine-tool "$pkgdir/usr/lib/limine/limine-entry-tool"

  install -d "$pkgdir/usr/share/libalpm/scripts"
  ln -s ../../../lib/limine/limine-tool \
    "$pkgdir/usr/share/libalpm/scripts/limine-mkinitcpio-install"
  ln -s ../../../lib/limine/limine-tool \
    "$pkgdir/usr/share/libalpm/scripts/limine-mkinitcpio-remove"

  install -d "$pkgdir/etc/boot/hooks/post.d"
  ln -s /usr/lib/limine/limine-tool \
    "$pkgdir/etc/boot/hooks/post.d/89-warn-missing-file-hashes"
}
