# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=xr-picker-git
pkgver=2.0.0.r2.gdf61067
pkgrel=1
pkgdesc="easily change your active OpenXR runtime"
arch=('x86_64')
url="https://github.com/rpavlik/xr-picker"
license=('MIT')
conflicts=("xr-picker")
provides=("xr-picker")
makedepends=('git' 'cargo')
depends=('glib2' 'gtk3' 'glibc' 'gcc-libs')
source=('git+https://github.com/rpavlik/xr-picker.git')
sha256sums=('SKIP')

pkgver() {
  cd xr-picker
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd xr-picker
  # cargo update
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
  cd xr-picker
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd xr-picker
  find target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
