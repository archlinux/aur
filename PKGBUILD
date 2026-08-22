# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>

pkgname=tomloader
pkgver=0.3.2
pkgrel=1
pkgdesc="Utility to create and manage systemd unit files"
arch=('x86_64')
url="https://codeberg.org/Loara/tomloader"
license=('EUPL-1.2')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'texinfo')
_tag=b5354c0a5ec072040123149edc6cb4fe641771c02c7fad88e943cd9d8bbf03e9
source=("$pkgname-$_tag::git+https://codeberg.org/Loara/tomloader.git#tag=$_tag")
b2sums=('17896676114c6858bbcb6d1ce7ae627f80e86365a86b5a15a351329854dff6d5120a1112caeb5129906168523c9a28e039d7f483871035c21e1be75e2a8f4e49')

pkgver() {
    cd "$srcdir/$pkgname-$_tag"
    git describe | sed 's/^v//'
}
prepare() {
    cd "$srcdir/$pkgname-$_tag"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
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
    install -Dm0644 completitions/tomloader.fish "${pkgdir}/usr/share/fish/vendor_completions.d/tomloader.fish"
}
