# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>

pkgname=tomloader
pkgver=0.4.0
pkgrel=1
pkgdesc="Utility to create and manage systemd unit files"
arch=('x86_64')
url="https://codeberg.org/Loara/tomloader"
license=('EUPL-1.2')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'texinfo')
_tag=4b6e396fcb7ebdfc8c2f0b75ef0cfe5386227bf1be841f55f5f19cf985fcde3d
source=("$pkgname-$_tag::git+https://codeberg.org/Loara/tomloader.git#tag=$_tag")
b2sums=('44a97df2868a8cb71d33e7a5c12d0f855996b77d97ee49ef7651e20f6d284b9bcdd71f26c999a1577742b88037d759862958e077049291d5f717615ae3161458')

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
