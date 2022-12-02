# Contributor: Patrik Tesarik <depate@das-labor.com>
pkgname='swayws'
pkgver=1.0.0.r0.g5285988
pkgrel=1
pkgdesc="A sway workspace tool which allows easy moving of workspaces to and from outputs"
arch=('x86_64')
url="https://gitlab.com/w0lff/swayws"
license=('MIT')
makedepends=(cargo)
_tag=v1.0.0
source=("git+$url#tag=$_tag")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $pkgname
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
 }

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
 }

check() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
