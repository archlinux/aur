# Maintainer: Robert Greener <dev at r0bert dot dev>

pkgname=libpamtpmpin
pkgver=0.1.0
pkgrel=2
pkgdesc="PAM module for TPM2 PIN authentication"
arch=('x86_64' 'aarch64')
url="https://github.com/0xr0bert/libpamtpmpin"
license=('BSD-3-Clause')
depends=('pam' 'tpm2-tss')
makedepends=('cargo')
checkdepends=('swtpm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0xr0bert/libpamtpmpin/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8adad5e1aeef91a9c1fc56a98bb3fabeaceca1c1525cc50950cc15265a62a28a')
options=('!strip' '!debug')

prepare() {
  export RUST_TOOLCHAIN=stable
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  export RUST_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen --all-features
}

check() {
  export RUST_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/libpam_tpmpin.so" "$pkgdir/usr/lib/security/libpam_tpmpin.so"
  install -Dm755 "target/release/tpmpin-unblock-self" "$pkgdir/usr/lib/tpmpin-unblock-self"
  install -Dm755 "target/release/tpmpin" "$pkgdir/usr/bin/tpmpin"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod u+s "$pkgdir/usr/lib/tpmpin-unblock-self"
}
