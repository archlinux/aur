# Maintainer: Dominik Csapak <dominik.csapak@gmail.com>
pkgname=proxmox-backup-client
pkgver=0.8.9
pkgrel=1
pkgdesc="Client for Proxmox Backup Server"
arch=('x86_64' 'aarch64')
url="https://www.proxmox.com"
license=('AGPL3')
depends=('gcc-libs'
	'fuse3'
	'pam'
	'systemd-libs'
	'acl'
)
makedepends=('cargo' 'clang' 'git' 'llvm' 'python-docutils')
source=(
    "$pkgname-$pkgver::git://git.proxmox.com/git/proxmox-backup.git#tag=v$pkgver"
    "0001-adapt-cargo-toml-and-remove-systemd-linking.patch"
    "0002-remove-apt-dependency.patch"
)
sha512sums=('SKIP'
            '9c506ac1f02582b272842e2b11740c11e96dd13fe7757958ebfed22f839f1baecd0d80234d3f8f1284ecd7f4cce5b072e04756e42a7a50868b4078d196d971ff'
            '46b76c7a22564b2ecb51c8a7daa62afe7d47f81702b40007cbebf67f409352cb2ea52f95a639e82c0f059c1a6dfb9282acca6054937f4959a1309a272fb5496a')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/0001-adapt-cargo-toml-and-remove-systemd-linking.patch"
  patch --forward --strip=1 --input="${srcdir}/0002-remove-apt-dependency.patch"
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --bin proxmox-backup-client --bin pxar --bin dump-catalog-shell-cli

  cd docs

  BUILD_MODE=release make proxmox-backup-client.1 pxar.1
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --bin proxmox-backup-client --bin pxar
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/proxmox-backup-client" "$pkgdir/usr/bin/proxmox-backup-client"
  install -Dm755 "target/release/pxar" "$pkgdir/usr/bin/pxar"

  install -Dm644 "docs/proxmox-backup-client.1" "$pkgdir/usr/share/man/man1/proxmox-backup-client.1"
  install -Dm644 "docs/pxar.1" "$pkgdir/usr/share/man/man1/pxar.1"

  install -Dm644 "debian/proxmox-backup-client.bc" "$pkgdir/usr/share/bash-completion/completions/proxmox-backup-client"
  install -Dm644 "debian/pxar.bc" "$pkgdir/usr/share/bash-completion/completions/pxar"

  install -Dm644 "zsh-completions/_proxmox-backup-client" "$pkgdir/usr/share/zsh/site-functions/_proxmox-backup-client"
  install -Dm644 "zsh-completions/_pxar" "$pkgdir/usr/share/zsh/site-functions/_pxar"
}
