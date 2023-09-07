# Maintainer: taotieren <admin@taotieren.com>

pkgname=smartdns-rs-git
pkgver=0.6.4.r0.g8ccfb81
pkgrel=1
pkgdesc="A cross platform local DNS server (Dnsmasq like) written in rust to obtain the fastest website IP for the best Internet experience, supports DoT, DoH. 一个用 Rust 编写的跨平台本地DNS服务器，获取最快的网站IP，获得最佳上网体验，支持DoH，DoT。"
arch=('any')
url="https://github.com/mokeyish/smartdns-rs"
license=('MIT' 'Apache-2.0' 'GPL-3.0')
provides=(${pkgname%-git} ${pkgname%-rs-git})
conflicts=(${pkgname%-git} ${pkgname%-rs-git})
replaces=()
depends=(cargo
        systemd)
makedepends=(git
            rust)
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

# Use LTO
# export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

pkgver() {
    cd "${srcdir}/${pkgname%-git}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

# check() {
#     cd "${srcdir}/${pkgname%-git}/"
#
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --release --all-features
# }

package() {
    cd "${srcdir}/${pkgname%-git}/"

    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .

    install -Dm0644 etc/smartdns/smartdns.conf -t "$pkgdir/etc/smartdns/"
    sed -i 's|sbin|bin|g' src/service/linux/systemd/files/lib/systemd/system/smartdns-rs.service
    install -Dm644 src/service/linux/systemd/files/lib/systemd/system/smartdns-rs.service \
        -t "$pkgdir/usr/lib/systemd/system/"
}
