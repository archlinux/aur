# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=carl-calendar
_pkgname=carl
pkgver=0.6.0
pkgrel=2
makedepends=('rust' 'cargo' 'git')
depends=('glibc' 'gcc-libs')
arch=('i686' 'x86_64' 'armv7h')
pkgdesc="A colorful commandline calendar with ical support. Similar to cal, but
 with more features."
license=('MIT' 'CC0-1.0')
url="https://codeberg.org/birger/carl"
options=("!debug")
source=("${_pkgname}-${pkgver}::git+${url}.git")
sha256sums=('SKIP')
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
