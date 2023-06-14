# Maintainer: taotieren <admin@taotieren.com>

pkgbase=autocorrect-rs-git
pkgname=autocorrect-git
pkgver=2.6.2.r11.gc2c1f69
pkgrel=1
pkgdesc="A linter and formatter to help you to improve copywriting, correct spaces, words, and punctuations between CJK (Chinese, Japanese, Korean)."
arch=('x86_64')
url="https://github.com/huacnlee/autocorrect"
license=('MIT')
provides=(${pkgbase%-git} ${pkgbase%-rs-git})
conflicts=(${pkbase%-git} ${pkgbase%-rs-git})
replaces=()
depends=('cargo')
makedepends=('git')
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {
#     cd "${srcdir}/${pkgname}/"
#
#     cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
# }

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${srcdir}/${pkgname}/"
    cargo build  --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"
    cargo test  --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

#     cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
