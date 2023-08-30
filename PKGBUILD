# Maintainer: Boris-Barboris < ismailsiege  at gmail dot com >
pkgname=evdev-proxy-git
pkgver=0.1.1.r1.3241460
pkgrel=1
pkgdesc="Service that proxies evdev events from real to virtual devices"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/PapaTutuWawa/evdev-proxy"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo' 'binutils')
source=('git+https://github.com/PapaTutuWawa/evdev-proxy'
        'evdev-proxy.service')
sha256sums=('SKIP'
            '3fb50f83f9e9e501ae148c635bb142ebefd4fd18bd5b98a6ebb609fbe27f50b7')

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
    install -Dm644 ../evdev-proxy.service -t "${pkgdir}/usr/lib/systemd/system/"
}
