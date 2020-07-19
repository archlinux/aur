# Maintainer: Dominik Csapak <dominik.csapak@gmail.com>
pkgname=proxmox-backup-client
pkgver=0.8.7
pkgrel=1
pkgdesc="Client for Proxmox Backup Server"
arch=('x86_64')
url="https://www.proxmox.com"
license=('AGPL3')
depends=('gcc-libs'
	'fuse3'
	'pam'
	'systemd-libs'
	'acl'
)
makedepends=('cargo' 'git' 'python-docutils')
source=("$pkgname-$pkgver::git://git.proxmox.com/git/proxmox-backup.git#tag=v$pkgver"
	"0001-adapt-cargo-toml-and-remove-systemd-linking.patch")
sha512sums=('SKIP'
            'aefdb72d0849f3e22751ba3639868f0cf46d71353618f9488ec3c4cebe53121f53d2892cb552140808c64759503db527b32b9a3183a7eef16e099a3f881b2629')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/0001-adapt-cargo-toml-and-remove-systemd-linking.patch"
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
