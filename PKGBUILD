# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgbase=nickel-git
pkgname=(nickel-git nickel-language-server-git)
pkgver=1.1.1.r121.be9269a
pkgrel=1
pkgdesc='Better configuration for less'
arch=(x86_64)
url='https://nickel-lang.org/'
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(git cargo)
checkdepends=(python)

source=(
    "$pkgbase::git+https://github.com/tweag/nickel.git"
)
sha256sums=(
    SKIP
)

pkgver() {
    cd "$pkgbase"

    local gitver=$(git tag | sed -nE '/^v?[0-9.]+$/p' | sort -rV | head -n1)
    printf "%s.r%s.%s" \
        "$gitver" \
        "$(git rev-list --count $gitver..HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgbase"

    RUSTUP_TOOLCHAIN=stable \
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgbase"

    RUSTUP_TOOLCHAIN=stable \
    CARGO_TARGET_DIR=target \
        cargo build --frozen --release --all-features --bins
}

check() {
    cd "$pkgbase"

    RUSTUP_TOOLCHAIN=stable \
        cargo test --frozen --all-features
}

package_nickel-git() {
    provides=(nickel)
    conflicts=(nickel)

    cd "$pkgbase"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nickel"
    install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_nickel-language-server-git() {
    provides=(nls)
    conflicts=(nls)

    cd "$pkgbase"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nls"
    install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
