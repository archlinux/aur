# Maintainer: crimist <aur at crim dot ist>

pkgname=nvidia_oc
pkgver=0.1.21
pkgrel=1
pkgdesc="A simple cli overclocking tool for Nvidia GPUs that supports both X11 and Wayland"
arch=('any')
url="https://github.com/Dreaming-Codes/nvidia_oc"
license=('MIT')
makedepends=('cargo')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "nvidia_oc.json"
        "nvidia_oc.service")
b2sums=('694a7fa66e71dcd787731d586627781aeaecbf724026b265094f1d6eecc8c9c36ad4c40f22cb07f74b154b4e75c3bab2fe6c0659626fe3208132859316c20159'
        '1d40f12187ecf6d7582e9423198c968fe622f99a3c544ce517d5ec49b6350d22ec054816326beee17b09bbb7d0f54b783333c359e7607d5acbeace53e330aa0c'
        'bc9eabfcaf66c1dbc4fadafde7388d0bbab1a361109cd596a39ce2ebd20e6c201db1533a2379b8e81ebacfd3e361adb9ea4fcc8f3b0cec7bade4c31ab4538bbb')
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
    install -Dm0644 "${srcdir}/nvidia_oc.json" "$pkgdir/etc/nvidia_oc.json"
    install -Dm0644 "${srcdir}/nvidia_oc.service" "$pkgdir/usr/lib/systemd/system/nvidia_oc.service"
}
