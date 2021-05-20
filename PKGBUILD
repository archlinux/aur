# Maintainer: Caleb Maclennan <caleb@aleque.com>

pkgname=ufostroker-git
pkgver=0.0.0.r4.g20df06b
pkgrel=1
pkgdesc='Add path effects to open glyphs in a UFO file'
arch=(x86_64)
url="https://github.com/simoncozens/${pkgname%-git}"
license=(Apache)
makedepends=(cargo-nightly git rust-nightly)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git tag | grep -Fq '0.0.0' || git tag '0.0.0' d4a63044
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
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
