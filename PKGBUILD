# Maintainer: 
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=amdgpud-git
pkgver=1.0.12.r15.g2d20203
pkgrel=1
pkgdesc="Fan control service for AMD GPUs."
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache-2.0 OR MIT')
depends=('gcc-libs')
makedepends=('cargo-nightly' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/eraden/amdgpud.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --release
}

check() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test
}

package() {
  cd "${pkgname%-git}"
  find "target/release/" \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm755 -t "$pkgdir/usr/bin/" '{}' \+
  find services \
    -type f \
    -name '*.service' \
    -exec install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" '{}' \+
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 examples/*.toml -t "$pkgdir/usr/share/doc/${pkgname%-git}/examples/"
}
