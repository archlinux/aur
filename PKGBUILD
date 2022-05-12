# Maintainer: Hisbaan Noorani <hisbaan@gmail.com>
pkgname=didyoumean-git
pkgver=1.1.2
pkgrel=1
pkgdesc="A CLI spelling corrector"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/hisbaan/didyoumean"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo' 'binutils')
optdepends=('libxcb: X11 clipboard support'
            'wl-clipboard: Wayland clipboard support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/hisbaan/didyoumean')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
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
    strip target/release/dym
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

    install -Dm755 target/release/dym -t "${pkgdir}/usr/bin/"

    # Install license and readme.
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
    install -Dm644 docs/README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"

    # Install man page
    install -Dm644 man/dym.1 -t "${pkgdir}/usr/share/man/man1/"

    # Install shell completions
    install -Dm644 completions/dym.bash -t "${pkgdir}/usr/share/bash-completion/completions/"
    install -Dm644 completions/dym.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
    install -Dm644 completions/_dym -t "${pkgdir}/usr/share/zsh/site-functions/"
}
