# Maintainer: Benji377 <demetzbenjamin23@gmail.com>
pkgname=raspirus
pkgver=2.1.0
pkgrel=1
pkgdesc="A user- and resources-friendly rules-based malware scanner"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL-3.0-only')
url="https://github.com/Raspirus/Raspirus"
depends=('glibc' 'openssl')
makedepends=('cargo')
provides=('raspirus')
options=('!strip' '!emptydirs' '!lto')
source=("$pkgname::git+https://github.com/Raspirus/raspirus.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
