# Maintainer: pruefsumme <bastian.rosinski@hotmail.com>

pkgname=osdockx-git
_pkgname=osdockx
epoch=1
pkgver=0.1.0.r0
pkgrel=2
pkgdesc='A lightweight, customizable OSX-inspired dock for Linux/X11'
arch=('x86_64')
url='https://github.com/pruefsumme/osdockx'
license=('MIT')
depends=('gtk4')
makedepends=('cargo' 'git' 'pkgconf')
options=('!debug')
provides=("$_pkgname")
conflicts=('osdockx' 'osdockx-bin')
source=(
    "$_pkgname::git+$url.git"
    'dev.pruefsumme.OSDockX.desktop'
    'LICENSE'
)
sha256sums=(
    'SKIP'
    'f5efd9aafdabc51215987b7ca23ab5d1b2cb63697b70dd1290163d26dd1ade09'
    'f3e94904dd4b20fb4ff46c00c1090186c64295ce017fb428433637021a1bf1de'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "0.1.0.r%s" "$(git rev-list --count HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --lib
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm0644 "$srcdir/dev.pruefsumme.OSDockX.desktop" \
        "$pkgdir/usr/share/applications/dev.pruefsumme.OSDockX.desktop"
    install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
