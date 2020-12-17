# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=scribl-git
pkgver=0.2.5.r55.g260f5cf
pkgrel=2
pkgdesc='make simple instructional videos'
arch=('x86_64')
url="https://github.com/jneem/${pkgname%-git}"
license=('Apache')
depends=('gst-plugins-base-libs' 'gtk3')
makedepends=('cargo' 'git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 --match='flatpak-v[0-9]*' |
        sed 's/flatpak-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked
}

build() {
    cd "$pkgname"
    cargo build --release --locked --all-features
}

check() {
    cd "$pkgname"
    cargo test --release --locked
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/${pkgname%-git}"
}
