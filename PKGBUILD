# Maintainer: Dominik Csapak <dominik.csapak@gmail.com>
# Maintainer: Thomas Lamprecht <thomas@lamprecht.org>
pkgname=proxmox-backup-client
pkgver=2.1.2
pkgrel=1
pkgdesc="Client for Proxmox Backup Server"
arch=('x86_64' 'aarch64')
url="https://pbs.proxmox.com"
license=('AGPL3')
depends=(
    'acl'
    'fuse3'
    'gcc-libs'
    'openssl'
)
makedepends=('cargo' 'clang' 'git' 'llvm' 'patchelf' 'python-docutils')
source=(
    "$pkgname-$pkgver::git://git.proxmox.com/git/proxmox-backup.git#tag=$pkgver"
    "proxmox::git://git.proxmox.com/git/proxmox.git#commit=c0312f3717bd00ace434929e7d3305b058f4aae9"
    "proxmox-fuse::git://git.proxmox.com/git/proxmox-fuse.git"
    "pxar::git://git.proxmox.com/git/pxar.git"
    "0001-re-route-dependencies-not-available-on-crates.io-to-.patch"
    "0001-tree-wide-fix-anyhow-glob-imports.patch"
    "elf-strip-unused-dependencies.sh"
)
# either a git repo or tracked by this git repo, so not much gained by encoding
# checksums here in this git repo
sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

_apply() {
  echo "applying patch '$1'"
  patch --forward --strip=1 --input="${srcdir}/$1"
}

prepare() {
  (
    cd proxmox
    _apply 0001-tree-wide-fix-anyhow-glob-imports.patch
  )
  cd "$pkgname-$pkgver"
  rm .cargo/config # drop Debian-style redirect of crates.io to local registry

  _apply 0001-re-route-dependencies-not-available-on-crates.io-to-.patch

  # fetch all in prepare to allow build() to be run offline
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  cargo build --release \
    --package proxmox-backup-client \
      --bin proxmox-backup-client \
      --bin dump-catalog-shell-cli \
    --package pxar-bin \
      --bin pxar \
    ;

  # fixup rust linking "feature" which links in all dependencies somewhere used
  # in the crate, even if not referenced at all in this binary...
  "${srcdir}/elf-strip-unused-dependencies.sh" "target/release/proxmox-backup-client"
  "${srcdir}/elf-strip-unused-dependencies.sh" "target/release/pxar"

  cd docs

  BUILD_MODE=release make proxmox-backup-client.1 pxar.1
}

check() {
  cd "$pkgname-$pkgver"

  mkdir -p target/testout/
  cargo test --release \
    --package proxmox-backup-client \
      --bin proxmox-backup-client \
    --package pxar-bin \
      --bin pxar \
    ;
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
