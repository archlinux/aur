# Maintainer: Hisbaan Noorani <hisbaan@gmail.com>
pkgname=kaboom-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A CLI typing game inspired by BombParty"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/hisbaan/kaboom"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo' 'binutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/hisbaan/kaboom')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --tags | sed 's/v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
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
    strip target/release/${pkgname%-git}
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

    install -Dm755 target/release/${pkgname%-git} -t "${pkgdir}/usr/bin/"

    # Install license and readme.
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    # install -Dm644 docs/README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
}
