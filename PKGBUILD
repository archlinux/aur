# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>

pkgname=tomloader
pkgver=0.3.1
pkgrel=1
pkgdesc="Utility to create and manage systemd unit files"
arch=('x86_64')
url="https://codeberg.org/Loara/tomloader"
license=('EUPL-1.2')
depends=('libgcc' 'glibc')
makedepends=('cargo')
_tag=124dc092b43b935aea6b0532c6b5dc71bb190b36512e1caa6c0b3aa2207c250c
source=("$pkgname-$_tag::git+https://codeberg.org/Loara/tomloader.git#tag=$_tag")
b2sums=('c46b4c7a2fcdbf5f956040db0dd5dedefc72a0397a6c7afa9b7f06d50a29d3c1f3cb65188068d2669dccc056bc922102789035f3785c38d4db7d91def3916379')

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
    install -Dm0644 completitions/tomloader.fish "${pkgdir}/usr/share/fish/vendor_completions.d/tomloader.fish"
}
