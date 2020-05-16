# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=vixi-git
pkgver=0.0.0.r152.gc5bdd66
pkgrel=1
pkgdesc='A vim like client for the xi backend'
arch=('x86_64')
url="https://github.com/Peltoche/${pkgname%-git}"
license=('Apache')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git tag | grep -Fq 'v0.0.0' || git tag 'v0.0.0' 0473838
    git describe --long --tags --abbrev=7 --match='v[0-9]*' |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked
}

build() {
    cd "$pkgname"
    cargo build --locked --offline --release --all-features
}

check() {
    cd "$pkgname"
    cargo test --locked --offline --release
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" "target/release/${pkgname%-git}"
}
