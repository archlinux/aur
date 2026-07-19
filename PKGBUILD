# Maintainer: Benny <zuiden@ilorentz.org>
pkgname=foxguard
pkgver=0.12.0
pkgrel=1
pkgdesc='Security scanner as fast as a linter. 170+ built-in rules, 10 languages, sub-second scans'
arch=('x86_64')
url='https://github.com/PwnKit-Labs/foxguard'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
options=('!lto')
source=("$pkgname::git+https://github.com/PwnKit-Labs/foxguard.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    local latest
    latest=$(git tag --list 'v[0-9]*' --sort=-v:refname | head -n1)
    printf '%s' "${latest#v}"
}

prepare() {
    cd "$pkgname"
    local latest
    latest=$(git tag --list 'v[0-9]*' --sort=-v:refname | head -n1)
    git checkout --quiet --detach "$latest"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/foxguard       "$pkgdir/usr/bin/foxguard"
    install -Dm755 target/release/foxguard-mcp   "$pkgdir/usr/bin/foxguard-mcp"
    install -Dm644 LICENSE                       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md                     "$pkgdir/usr/share/doc/$pkgname/README.md"
}
