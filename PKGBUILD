# Maintainer: Christian Balcom <robot.inventor@gmail.com>

pkgname=prism-bar
pkgver=0.1.0
pkgrel=1
pkgdesc='Status bar for the prism compositor — damascene-rendered, layer-shell native'
arch=('x86_64')
url='https://github.com/computer-whisperer/prism-bar'
license=('MIT OR Apache-2.0')
# libwayland-client and libvulkan are dlopened at runtime (wayland-sys via
# dlib, ash), so neither shows up as NEEDED — both are real dependencies.
depends=(
    'gcc-libs'
    'glibc'
    'vulkan-icd-loader'
    'wayland'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ea7cf9d015754d865cc4b070a2f2149c6258bf1bdedb92f0e3f02624627a93f3')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/prism-bar" "$pkgdir/usr/bin/prism-bar"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
