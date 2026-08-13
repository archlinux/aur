# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>

pkgname=tomloader
pkgver=0.3.0
pkgrel=1
pkgdesc="Utility to create and manage systemd unit files"
arch=('x86_64')
url="https://codeberg.org/Loara/tomloader"
license=('EUPL-1.2')
depends=('libgcc' 'glibc')
makedepends=('cargo')
_tag=622eef1ece2c6b5b66682e12db5eef41d9626102e40dfd5b2e90d2c1627a21fd
source=("$pkgname-$_tag::git+https://codeberg.org/Loara/tomloader.git#tag=$_tag")
b2sums=('b6c56262c514e4ceb10c36b8466516db040a5652dd6b5ef169ac9f750302e84520c5a8633a4d3a08546543194d54329c0883e3594f7a609f31aa5227c51ae633')

pkgver() {
    cd "$srcdir/$pkgname-$_tag"
    git describe | sed 's/^v//'
}
prepare() {
    cd "$srcdir/$pkgname-$_tag"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname-$_tag"
    cargo build --target-dir "target" --frozen --release
    texi2any texinfo/main.texi
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$pkgname-$_tag"
    cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm0755 "target/release/tomloader" "$pkgdir/usr/bin/tomloader"
    install -Dm0644 tomloader.info "$pkgdir/usr/share/info/tomloader.info"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/tomloader/"
}
