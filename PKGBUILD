# Maintainer: Boris-Barboris < ismailsiege  at gmail dot com >
pkgname=evdev-proxy-git
pkgver=0.1.1.r2.64dc5e8
pkgrel=1
pkgdesc="Service that proxies evdev events from real to virtual devices"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Boris-Barboris/evdev-proxy"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo' 'binutils')
source=('git+https://github.com/Boris-Barboris/evdev-proxy'
        'evdev-proxy.service'
        'uinput.conf')
sha256sums=('SKIP'
            'ca3a20971b653d5685e7440334c5c94e0cb10bd8176c1bfb2ce476b773020def'
            '7d0367076b1e7e79c8de626827183380d59b12b634f4e763fc94b9c6179003c7')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --tags --long | sed 's/v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$srcdir/${pkgname%-git}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$srcdir/${pkgname%-git}"
    cargo build --release --frozen
    strip target/release/evdev-proxy
}

# Testing is not strictly required as it is done by the CI/CD workflow on the git repository.
# check() {
#     cd "$srcdir/${pkgname%-git}"
#     export RUSTUP_TOOLCHAIN=stable
#     export CARGO_TARGET_DIR=target
#     cargo test --release --frozen
# }

package() {
    cd "$srcdir/${pkgname%-git}"

    install -Dm755 target/release/evdev-proxy -t "${pkgdir}/usr/bin/"

    # Install license and readme.
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"

    # Install default config, udev ruleset and systemd service
    install -Dm644 config.toml -t "${pkgdir}/etc/${pkgname%-git}/"
    install -Dm644 70-uinput-evdev-proxy.rules -t "${pkgdir}/etc/udev/rules.d/"
    install -Dm644 ../uinput.conf -t "${pkgdir}/etc/modules-load.d/"
    install -Dm644 ../evdev-proxy.service -t "${pkgdir}/usr/lib/systemd/system/"
}
