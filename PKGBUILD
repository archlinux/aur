# Maintainer: Reyka Matthies <openglfreak at googlemail dot com>

_pkgname=yserver
pkgname=$_pkgname-git
pkgver=1.3.0.phase2.r1136.g9311073
pkgrel=1
pkgdesc='A modern X11 server written from scratch in Rust (Git version)'
url='https://github.com/joske/yserver'
arch=('x86_64')
license=('MIT')
depends=('libgcc' 'glibc' 'seatd' 'libxshmfence' 'libxkbcommon' 'libinput' 'systemd-libs' 'fontconfig' 'freetype2')
makedepends=('cargo' 'gcc' 'git' 'just' 'shaderc' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/joske/yserver.git')
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
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/ynest" "$pkgdir/usr/bin/ynest"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/yserver" "$pkgdir/usr/bin/yserver"
    install -d -Dm755 "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -d -Dm755 "$pkgdir/usr/share/doc"
    install -d -Dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    cp -r docs -t "$pkgdir/usr/share/doc/$pkgname"
    rm -f "$pkgdir/usr/share/doc/$pkgname/docs"/*.py
}
