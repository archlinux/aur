# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=linuwux-runtime
pkgver=26.09.16
pkgrel=1
pkgdesc="Lightweight Rust compatibility runtime for Windows games running through Wine and Proton"
arch=('x86_64')
url="https://github.com/brcly/linuwux-runtime"
license=('AGPL-3.0-or-later')
depends=('glibc' 'sh')
makedepends=('cargo' 'gcc' 'binutils')
optdepends=(
  'wine: running Windows games with Wine'
  'gamescope: micro-compositor session support'
  'cpuid-fault-emulation-dkms: CPUID fault emulation on AMD Zen 1-3 processors'
  'zenity: graphical error notification dialogs'
)
provides=("linuwux-runtime=$pkgver")
conflicts=('linuwux-runtime-git')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "linuwux"
)
sha256sums=(
  '3923286fd05090c810ea6d274c744c5ac5a71946fc11c2910e07845fc2002df7'
  '6bdba2db509b50fa98db60440087cdcf87a28d7c33cb68b1d1a2eb675c3c93da'
)

prepare() {
  cd "$pkgname-$pkgver"
  # Avoid rustup attempting to download IDE/doc components
  rm -f rust-toolchain.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_NET_OFFLINE=true
  cargo xtask build --output target/runtime/LinUwUx.so
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_NET_OFFLINE=true
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/runtime/LinUwUx.so "$pkgdir/usr/lib/linuwux/LinUwUx.so"
  install -Dm755 "$srcdir/linuwux" "$pkgdir/usr/bin/linuwux"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
