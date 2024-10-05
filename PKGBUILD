# Maintainer: crimist <aur at crim dot ist>

pkgname=nvidia_oc
pkgver=0.1.15
pkgrel=1
pkgdesc="A simple cli overclocking tool for Nvidia GPUs that supports both X11 and Wayland"
arch=('any')
url="https://github.com/Dreaming-Codes/nvidia_oc"
license=('MIT')
makedepends=('cargo')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d9997216d2e3e590b3d53f6b29e98643a2e8ad2904d05fb13bdcea371d7f77435f23057b1fab96198b179c14b813a7bdeadc84759c7e9edb5fb25eb347dd5ed9')
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
