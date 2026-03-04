# Maintainer: Reyka Matthies <openglfreak at googlemail dot com>

_pkgname=uefisettings
pkgname=$_pkgname-git
pkgver=0.1.5.r56.149bc92
pkgrel=1
pkgdesc='A tool to read and modify BIOS/UEFI settings from Linux terminal (Git version)'
url='https://github.com/linuxboot/uefisettings'
arch=('x86_64')
license=('BSD-3-Clause')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/linuxboot/uefisettings.git')
sha256sums=('SKIP')
b2sums=('SKIP')

if check_option 'lto' 'y'; then
    export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
fi
if check_option 'debug' 'y'; then
    export CARGO_PROFILE_RELEASE_DEBUG=2
fi

options=('!lto')

pkgver() {
    local ver subver
    cd "$_pkgname"
    ver="$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2)"
    subver="$( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )"
    printf '%s\n' "$ver.$subver"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_INCREMENTAL=0
    if (( CHECKFUNC )); then
        cargo build --frozen --release --all-features --target "$CARCH-unknown-linux-gnu" --lib --bins --tests
    else
        cargo build --frozen --release --all-features --target "$CARCH-unknown-linux-gnu" --lib --bins
    fi
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_INCREMENTAL=0
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"
    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/uefisettings" "$pkgdir/usr/bin/uefisettings"
    install -d -Dm755 "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -d -Dm755 "$pkgdir/usr/share/doc"
    install -d -Dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 CONTRIBUTING.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 CODE_OF_CONDUCT.md -t "$pkgdir/usr/share/doc/$pkgname"
}
