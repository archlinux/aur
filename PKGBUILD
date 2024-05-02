# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>

pkgname=eww-x11
pkgver=0.6.0
pkgrel=3
pkgdesc="A standalone widget system for X11 made in Rust."
url='https://github.com/elkowar/eww'
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
depends=(glibc gcc-libs 'gtk3>=3.22' pango cairo gdk-pixbuf2 glib2 libdbusmenu-gtk3)
conflicts=(eww)
provides=(eww)
source=("$pkgname-$pkgver.tar.gz::https://github.com/elkowar/eww/archive/refs/tags/v$pkgver.tar.gz"
    'eww.service')
sha256sums=('cef361946946c566b79f8ddc6208d1a3f16b4ff9961439a3f86935e1cfa174a1'
    'b3af9a18b9f015b130fd1ac7ac92c67a9966adadc8387b80c88f5093f58e4033')

prepare() {
    cd "$srcdir/eww-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/eww-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features x11
}

package() {
    cd "$srcdir/eww-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -T -Dm0755 "target/release/eww" "$pkgdir/usr/bin/eww"
    install -T -Dm0644 "$srcdir/eww.service" "$pkgdir/usr/lib/systemd/user/eww.service"
}
