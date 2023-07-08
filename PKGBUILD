# Maintainer: Ossian Mapes <self at ossian dot dev>

_pkgname=lutgen
pkgname=lutgen-git
pkgver=0.6.2.r6.g7684b7b
pkgrel=1
pkgdesc='Replacement for ls written in Rust'
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
    mkdir -p completions/{bash,zsh,fish}
    bin="target/release/$_pkgname"
    $bin --completions bash > completions/bash/$_pkgname
    $bin --completions zsh > completions/zsh/_$_pkgname
    $bin --completions fish > completions/fish/$_pkgname.fish
}

package() {
    cd $_pkgname-rs
    install -Dm755 target/release/$_pkgname \
        -t "$pkgdir/usr/bin"
    install -Dm644 completions/bash/$_pkgname \
        -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 completions/zsh/_$_pkgname \
        -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/fish/$_pkgname.fish \
        -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname"
}

