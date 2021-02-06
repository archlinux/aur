# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=runebender-git
pkgver=0.0.0.r284.geb86482
pkgrel=1
pkgdesc='A font editor written in Rust'
arch=('x86_64')
url="https://github.com/linebender/${pkgname%-git}"
license=('Apache')
depends=('cairo')
makedepends=('cargo' 'git' 'rust')
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
    cargo fetch --locked
}

build() {
    cd "$pkgname"
    export RB_THEME_PATH="/usr/share/$pkgname/default.theme"
    cargo build --release --locked --all-features
}

check() {
    cd "$pkgname"
    cargo test --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/$pkgname/" resources/*.theme
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE resources/aglfn.txt
}
