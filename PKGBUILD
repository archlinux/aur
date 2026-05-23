# Maintainer: Carlos Prieto <prietus@live.com>

pkgname=livefetch-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Animated fastfetch-style system info with a live refreshing dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/livefetch"
license=('MIT')
depends=('libwebp' 'gcc-libs')
makedepends=('cargo' 'git')
optdepends=(
    'pciutils: GPU detection'
    'iproute2: local IP detection'
    'lm_sensors: CPU temperature on systems without hwmon labels'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "0.0.0.r%s.g%s" \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --all-features
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 "target/release/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
