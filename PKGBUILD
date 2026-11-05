pkgname=proxmox-auto-install-assistant
gitname=pve-installer
pkgver=9.2.8
pkgrel=1
pkgdesc='prepare an automated proxmox install iso'
arch=(x86_64)
url=https://pve.proxmox.com/wiki/Automated_Installation
license=(AGPL-3.0-only)
options=(!lto)
depends=(
  glibc
  libgcc
  libisoburn
  libxcrypt
  openssl
  zstd
)
makedepends=(
  git
  iso-codes
  perl
  perl-filesys-df
  perl-json
  perl-string-shellquote
  perl-timedate
  perl-uri
  rust
  tzdata
)
source=("$gitname::git+https://github.com/proxmox/$gitname.git#commit=ba2007cd7cc383d64e028c2a798e8f0a065a9b49"
        'proxmox::git+https://github.com/proxmox/proxmox-rs.git#commit=aa6a31b22aa674f30e8b24ab2fb904b5d50ad8bb'
        'pve-common::git+https://github.com/proxmox/pve-common.git#commit=389a003d691b94c2dd6cd09d4acb276faa445c91'
        Cargo.lock
        paths.patch)
sha256sums=(SKIP SKIP SKIP
            cccff6d4c4a4d87326b6e1081de9cf57b8dc6ee07079618caccc463bc9ece2b3
            ae2c9025000504bc063bc028594969e59705d39fa7e4213c9126262661bf8e0b)
cargo_vars=(
  CARGO_TARGET_DIR=target
  OPENSSL_NO_VENDOR=1
  ZSTD_SYS_USE_PKG_CONFIG=1
)
prepare() {
  cd "$srcdir/$gitname"
  patch -Np1 -i "$srcdir/paths.patch"
  rm .cargo/config.toml
  cp "$srcdir/Cargo.lock" Cargo.lock
  # cargo update --workspace # uncomment when needed
  cargo fetch --locked --target x86_64-unknown-linux-gnu
  h2ph -a -d "$srcdir/pve-common/src" syscall.h
  perl -I "$srcdir/pve-common/src" ./country.pl > locale-info.json
}
build() {
  cd "$srcdir/$gitname"
  export "${cargo_vars[@]}"
  cargo build --frozen --release --package $pkgname
}
check() {
  cd "$srcdir/$gitname"
  export "${cargo_vars[@]}"
  install -Dm644 locale-info.json testdir/var/lib/proxmox-installer/locale-info.json
  cargo test --frozen --package $pkgname --package proxmox-auto-installer --package proxmox-installer-common
}
package() {
  install -Dm755 "$srcdir/$gitname/target/release/$pkgname" "$pkgdir/usr/bin/proxmox-auto-install-assistant"
}
