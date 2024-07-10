# Maintainer: Ossian Mapes <self at ossian dot dev>

_pkgname=lutgen
pkgname=lutgen-git
pkgver=0.11.0.r0
pkgrel=1
pkgdesc='A blazingly fast interpolated LUT utility for arbitrary and popular color palettes (latest git)'
arch=('i686' 'x86_64')
url="https://github.com/ozwaldorf/lutgen-rs"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
provides=('lutgen')
conflicts=('lutgen')
source=("git+https://github.com/ozwaldorf/lutgen-rs.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname-rs
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    cd $_pkgname-rs
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname-rs
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
    mkdir -p completions/
    bin="target/release/$_pkgname"
    $bin --bpaf-complete-style-bash > completions/$_pkgname
    $bin --bpaf-complete-style-zsh > completions/_$_pkgname
    $bin --bpaf-complete-style-fish > completions/$_pkgname.fish
}

package() {
    cd $_pkgname-rs
    install -Dm755 target/release/$_pkgname \
        -t "$pkgdir/usr/bin"
    install -Dm644 completions/$_pkgname \
        -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 completions/_$_pkgname \
        -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/$_pkgname.fish \
        -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname"
}

