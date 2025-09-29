# Maintainer: Quintus Leung <quintusl@gmail.com>
pkgname=cec2uinput
pkgver=0.2.3
pkgrel=1
pkgdesc="CEC to uinput bridge for Linux"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/quintusl/$pkgname"
license=('GPLv3')
depends=('libcec' 'systemd-libs' 'glibc' 'gcc-libs')
makedepends=('cargo')
backup=("etc/$pkgname/config.yml")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=('!lto')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    # Install systemd service
    install -Dm0644 config/$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # Install configuration
    install -Dm0644 config/config.yml "$pkgdir/etc/$pkgname/config.yml"

    # Install documentation
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
