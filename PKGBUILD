# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=runebender-git
pkgver=0.0.0.r197.g348c3bc
pkgrel=1
pkgdesc='A font editor written in Rust'
arch=('x86_64')
url="https://github.com/linebender/${pkgname%-git}"
license=('Apache')
depends=('cairo')
makedepends=('cargo-nightly' 'git' 'rust-nightly')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git tag | grep -Fq '0.0.0' || git tag '0.0.0' 4bf91df
    git describe --long --tags --abbrev=7 --match='[0-9]*' |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    cargo +nightly fetch --locked
}

build() {
    cd "$pkgname"
    cargo +nightly build --release --locked --all-features
}

check() {
    cd "$pkgname"
    cargo +nightly test --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/${pkgname%-git}"
}
