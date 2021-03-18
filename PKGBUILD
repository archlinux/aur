# Maintainer: Dominik Csapak <dominik.csapak@gmail.com>
# Maintainer: Thomas Lamprecht <thomas@lamprecht.org>
pkgname=proxmox-backup-client
pkgver=1.0.8
pkgrel=1
pkgdesc="Client for Proxmox Backup Server"
arch=('x86_64' 'aarch64')
url="https://www.proxmox.com"
license=('AGPL3')
depends=('gcc-libs'
	'fuse3'
	'acl'
)
makedepends=('cargo' 'clang' 'git' 'llvm' 'patchelf' 'python-docutils' 'sg3_utils')
source=(
    "$pkgname-$pkgver::git://git.proxmox.com/git/proxmox-backup.git#tag=v$pkgver"
    "0001-adapt-cargo-toml-and-remove-systemd-linking.patch"
    "0002-remove-apt-dependency.patch"
    "elf-strip-unused-dependencies.sh"
)
sha512sums=(
    'SKIP'
    '0806e8e5078d5b25b19b7414d2b96bba886ed146cc0080fc505eb835698d4e689dad954db128c01da1b02df9c32be54512fe9fd7fded89c74c2dcbf05b2f9dc5'
    '35e3aa7369c481dde640ba8a97f0d4e95a73907f2a985382a5ed230d762e5b645a81a72c9fdd19e2dead7de51c5f7d051379ad6340cbbc245890e71398e45381'
    '8ebadc9854ff8bcd4e1e2e849728ef5724164b834793d0dda989e72ff0180d44b1318fdd6a4c1bf29b6d93bb8241c8dc47839d7d6a4b9f59a8a03f7e208e9991'
)

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/0001-adapt-cargo-toml-and-remove-systemd-linking.patch"
  patch --forward --strip=1 --input="${srcdir}/0002-remove-apt-dependency.patch"
  rm src/api2/node/apt.rs src/tools/apt.rs src/bin/proxmox-daily-update.rs # belongs to patch 0002
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --bin proxmox-backup-client --bin pxar --bin dump-catalog-shell-cli

  # fixup rust linking "feature" which links in all dependencies somewhere used
  # in the crate, even if not referenced at all in this binary...
  "${srcdir}/elf-strip-unused-dependencies.sh" "target/release/proxmox-backup-client"
  "${srcdir}/elf-strip-unused-dependencies.sh" "target/release/pxar"

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
