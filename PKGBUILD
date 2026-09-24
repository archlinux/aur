# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=quvyta-focus-git
_pkgname="${pkgname%-git}"
pkgver=r15.543782b
pkgrel=1
pkgdesc="Productivity counter"
arch=(x86_64)
url="https://github.com/quvyta/focus"
license=(MIT)
depends=(glibc libgcc libgcc_s.so)
makedepends=(cargo git)
provides=(qfocus quvyta-focus)
conflicts=(quvyta-focus)
options=(!lto)
install=
changelog=
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$_pkgname"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$_pkgname"
    cargo build --frozen --release --all-features
}

# check() {
#     export RUSTUP_TOOLCHAIN=stable
# 
#     cd "$_pkgname"
#     cargo test --frozen --all-features
# }

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/"{"$_pkgname",qfocus} -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

