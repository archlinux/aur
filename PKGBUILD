# Maintainer: adelmonte
pkgname=ukigen
pkgver=0.1.0
pkgrel=1
pkgdesc='Fast UKI and initramfs builder; drop-in for ukify/eukify and booster'
arch=('x86_64')
url='https://github.com/adelmonte/ukigen'
license=('LGPL-2.1-or-later AND MIT')
depends=('gcc-libs' 'glibc')
makedepends=('rustup' 'clang')
optdepends=('sbsigntools: Secure Boot signing (--signtool sbsign)'
            'efibootmgr: boot entries for UKIs on the ESP')
provides=('initramfs' 'ukify' 'eukify' 'booster')
conflicts=('eukify' 'booster' 'booster-git' 'systemd-ukify')
backup=('etc/ukigen.toml')
# zstd-sys compiles C; makepkg's -flto=auto turns it into GCC bitcode rust-lld can't link.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ef753d76e6b25a7820abc670ce4bbd6590423cad40c3d3a7c5c0276dba92b404')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  rustup target add "$CARCH-unknown-linux-musl" "$CARCH-unknown-uefi"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --locked --target "$CARCH-unknown-linux-musl"
  (cd stub && cargo fetch --locked --target "$CARCH-unknown-uefi")
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p ukigen
  cargo build --frozen --release -p ukigen-init --target "$CARCH-unknown-linux-musl"
  (cd stub && CARGO_TARGET_DIR=target cargo build --frozen --release --target "$CARCH-unknown-uefi")
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/ukigen "$pkgdir/usr/bin/ukigen"
  install -Dm755 "target/$CARCH-unknown-linux-musl/release/ukigen-init" "$pkgdir/usr/lib/ukigen/init"
  install -Dm644 "stub/target/$CARCH-unknown-uefi/release/ukigen-stub.efi" "$pkgdir/usr/lib/ukigen/linuxx64.efi.stub"
  for n in ukify eukify booster; do ln -s ukigen "$pkgdir/usr/bin/$n"; done
  install -Dm644 packaging/ukigen.toml "$pkgdir/etc/ukigen.toml"
  install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks" packaging/pacman/*.hook
  install -Dm644 LICENSES/booster-MIT.txt "$pkgdir/usr/share/licenses/$pkgname/booster-MIT.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
