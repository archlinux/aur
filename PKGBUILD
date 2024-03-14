# Maintainer: Mautamu mautam@usa.com
pkgname=leftwm-theme-git
pkgver=r102.b394824
pkgrel=1
epoch=1
pkgdesc="Theme manager for LeftWM"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm-theme"
license=('BSD')
depends=('leftwm' 'openssl' 'gcc-libs' 'zlib')
makedepends=('cargo' 'git')
optdepends=('dmenu: default launcher'
            'feh: used to set background images'
            'lemonbar: light weight bar'
            'polybar: light weight bar')
provides=('leftwm-theme')
conflicts=('leftwm-theme')
source=("${pkgname}::git+https://github.com/leftwm/leftwm-theme.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/leftwm-theme"
}
