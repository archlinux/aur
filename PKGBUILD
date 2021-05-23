# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=glif
pkgname=mfek-$_pkgname-git
pkgver=1.0a.r16.g561930f
pkgrel=1
pkgdesc='A stand-alone glyph viewer and editor (from Modular Font Editor K)'
arch=(x86_64)
url="https://github.com/MFEK/$_pkgname"
license=(Apache)
depends=(gtk3 libxcb)
makedepends=(git rust-nightly)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 --tags HEAD |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked
}

build() {
    cd "$pkgname"
    cargo build --offline --release --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/MFEK$_pkgname "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
