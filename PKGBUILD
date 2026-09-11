# Maintainer: Firefly Labs <fireflylabss@users.noreply.github.com>

pkgname=optioncalendar
pkgver=0.1.0
pkgrel=1
pkgdesc='Minimal local calendar CLI — Option family'
arch=('x86_64')
url='https://github.com/fireflylabss/optionCalendar'
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
)
# Path dep: workspace expects ../optionSDK next to the extracted sources.
_optionsdk_ver=0.1.3
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "optionSDK-$_optionsdk_ver.tar.gz::https://github.com/fireflylabss/optionSDK/archive/refs/tags/v$_optionsdk_ver.tar.gz"
)
sha256sums=(
  'f24b9068aebfdeb38a1e7a84efd3694f575f272ce27345472865b83448e883e6'
  'f71374cb0adbd9736b9e1e9ef0c800a65aeb4c7b32f5e496561b5cb31d9d0eac'
)

_srcdir="optionCalendar-$pkgver"

prepare() {
  # Cargo.toml: optionSDK = { path = "../optionSDK", ... }
  ln -sfn "$srcdir/optionSDK-$_optionsdk_ver" "$srcdir/optionSDK"

  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p optioncalendar-cli
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p optioncalendar-core
}

package() {
  cd "$_srcdir"
  install -Dm755 target/release/optioncalendar "$pkgdir/usr/bin/optioncalendar"
  install -Dm755 target/release/oca "$pkgdir/usr/bin/oca"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 PRODUCT.md "$pkgdir/usr/share/doc/$pkgname/PRODUCT.md"
}
