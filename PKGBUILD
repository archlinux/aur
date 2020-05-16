# Maintainer: Caleb Maclennan <caleb@aleque.com>
# Contributor: Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

pkgname=xi-term-git
pkgver=0.0.0.r232.gd264767
pkgrel=1
pkgdesc='A terminal frontend for the Xi editor'
arch=('x86_64')
url="https://github.com/xi-frontend/${pkgname%-git}"
license=('MIT')
depends=('xi-core')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git tag | grep -Fq 'v0.0.0' || git tag 'v0.0.0' a14eb46
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
