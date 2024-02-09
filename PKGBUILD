# Maintainer: Christoph Haag <haagch+aur@frickel.club>

pkgname=xr-picker-git
pkgver=2.2.1.r0.g25d9f8f
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
  if [ -z ${CARGO_HOME+x} ]
  then
    export CARGO_HOME="$srcdir/cargo"
    echo "srcdir $srcdir"
  fi
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}
build() {
  cd xr-picker
  if [ -z ${CARGO_HOME+x} ]
  then
    export CARGO_HOME="$srcdir/cargo"
    echo "srcdir $srcdir"
  fi
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

package() {
  cd xr-picker
  find target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
