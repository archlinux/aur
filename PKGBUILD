# Maintainer: Dimitri Merejkowsky <dimitri at dmerej.info>
# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=agate
pkgver=3.3.16
pkgrel=1
pkgdesc="Simple static file server for the Gemini network protocol, written in Rust"
arch=('x86_64')
url="https://github.com/mbrubeck/agate"
license=('Apache-2.0' 'MIT')
backup=('etc/conf.d/agate')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "agate-sysusers.conf"
  "agate-tmpfiles.conf"
  "agate.conf"
  "agate.service"
)
options=("!lto") # see: https://github.com/briansmith/ring/issues/1444
b2sums=('06e6bf7b93072d960ba2bcf4e9c6370c46d3790f58de4b1560a565724cd49a1dfea6a8d32eca906b783297e8dfdca2d4274223a4fb6754df58592550ce38cf02'
        'f60db8626a23def1801293eb6e7b3a0431fddcf8691fb886b32dcb9dc3f1931c252b967794899e557d8f8b8f33e14ef785cc38f22bae95981ba6929823b5293e'
        'c11461e5f4a3b5dd156fa0be507752f11174acc0b558e76afbccb1e5d5f6d507b6b3c4708142535b872c7380d1a3f47165e5abe89571b8e6b092d0a7c2fdad4f'
        '1365e0b682948035a31a85add493c0a0f9adba2fb6c93958e1693917eb1980e3a35aa08033f2475223654113d35e7136107fbf206c41cd0ca721ed0eaf5354fb'
        '933cc4bae368410f7223442d3572ff97c64292f6c40303f0aed48acd50f98188212c9ee487b6be003a21e0342dc554950abfd363dbc1e8babfe167c0c39888f5')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"

  install -Dm644 ../$pkgname.conf "$pkgdir/etc/conf.d/agate"
  install -Dm644 ../$pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 ../$pkgname-sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 ../$pkgname-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
