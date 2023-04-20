# Maintainer: Jan Trefil <hjantrefil@gmail.com>
pkgname="rkvm"
pkgver=0.3.0
pkgrel=1
pkgdesc="Virtual KVM switch for Linux machines"
# This is a conservative estimate.
# Leave a comment if you get rkvm working on another arch and want to add it to the PKGBUILD.
arch=("x86_64")
url="https://github.com/htrefil/rkvm"
license=("MIT")
depends=("libevdev>=1.9.0")
makedepends=("cargo" "clang")
optdepends=("openssl: certificate generation")
source=("$kgname-$pkgver.tar.gz::https://github.com/htrefil/rkvm/archive/refs/tags/$pkgver.tar.gz")
md5sums=('ed7b648dc91872ddadc75195cf6b94d1')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Binaries.
    install -Dm755 target/release/rkvm-server "$pkgdir/usr/bin/rkvm-server"
    install -Dm755 target/release/rkvm-client "$pkgdir/usr/bin/rkvm-client"
    install -Dm755 target/release/rkvm-certificate-gen "$pkgdir/usr/bin/rkvm-certificate-gen"

    # systemd services.
    install -Dm644 "systemd/rkvm-server.service" "$pkgdir/usr/lib/systemd/system/rkvm-server.service"
    install -Dm644 "systemd/rkvm-client.service" "$pkgdir/usr/lib/systemd/system/rkvm-client.service"

    # Example configurations.
    install -Dm640 "example/server.toml" "$pkgdir/etc/rkvm/server.example.toml"
    install -Dm640 "example/client.toml" "$pkgdir/etc/rkvm/client.example.toml"
}
