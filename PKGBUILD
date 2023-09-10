# Maintainer: taotieren <admin@taotieren.com>

pkgbase=rmqtt-git
pkgname=rmqtt-git
pkgver=0.2.16.r8.g21bff53
pkgrel=1
pkgdesc="MQTT Server/MQTT Broker - Scalable Distributed MQTT Message Broker for IoT in the 5G Era"
arch=('any')
url="https://github.com/rmqtt/rmqtt"
license=('MIT')
provides=(${pkgname%-git} librmqtt_macros.so)
conflicts=(${pkgname%-git} librmqtt_macros.so)
replaces=()
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    install -Dm0755 target/release/rmqttd -t "$pkgdir/usr/bin/"
    install -Dm0755 target/release/librmqtt*.so -t "$pkgdir/usr/lib/"
    install -Dm0644 LICENSE* -t "$pkgdir/usr/share/licenses/${pkgname}/"
    install -Dm0644 README* -t "$pkgdir/usr/share/doc/${pkgname}/"
    cp -rv docs  "$pkgdir/usr/share/doc/${pkgname}/"
}
