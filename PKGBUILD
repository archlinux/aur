# Maintainer: crimist <aur at crim dot ist>

pkgname=nvidia_oc
pkgver=0.1.16
pkgrel=1
pkgdesc="A simple cli overclocking tool for Nvidia GPUs that supports both X11 and Wayland"
arch=('any')
url="https://github.com/Dreaming-Codes/nvidia_oc"
license=('MIT')
makedepends=('cargo')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e83bf5a3320d39f99c691be6d70a33a3a6b1619cb3388fba20779ea53abba2ac39891b1dd86eafed0b264110e1c0e97b51af4fa8415dbcdc3596568f9ca7f53d')
backup=('etc/nvidia_oc.json')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${srcdir}/$pkgname-$pkgver/target/release/$pkgname"
    install -Dm0644 "${srcdir}/../nvidia_oc.json" "$pkgdir/etc/nvidia_oc.json"
    install -Dm0644 "${srcdir}/../nvidia_oc.service" "$pkgdir/usr/lib/systemd/system/nvidia_oc.service"
}
