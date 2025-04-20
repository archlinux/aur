# Maintainer: taotieren <admin@taotieren.com>

pkgbase=autocorrect-rs-git
pkgname=autocorrect-git
pkgver=2.13.3.r3.gb775e19
pkgrel=1
pkgdesc="A linter and formatter to help you to improve copywriting, correct spaces, words, and punctuations between CJK (Chinese, Japanese, Korean)."
arch=($CARCH)
url="https://github.com/huacnlee/autocorrect"
license=('MIT')
provides=(${pkgbase%-git} ${pkgbase%-rs-git})
conflicts=(${pkbase%-git} ${pkgbase%-rs-git})
replaces=()
depends=('rust')
makedepends=('git')
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    #     cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}/"
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"
    cargo test --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    #     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
