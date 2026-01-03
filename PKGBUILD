# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=carl-calendar
_pkgname=carl
pkgver=0.5.1
pkgrel=1
makedepends=('rust' 'cargo')
depends=('glibc' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A colorful commandline calendar with ical support. Similar to cal, but with more features."
license=('MIT' 'CC0-1.0')
url="https://github.com/b1rger/carl"
source=("$url/archive/refs/tags/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('741704427403353f62993687a6d2c5a7452bfbf4c108fd32757522600c4eb2e5')
install="carl.install"

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"    
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$_pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check(){
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 LICENSES/MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
