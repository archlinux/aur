# Maintainer: Paolo De Donato <dedonato 95 at hotmail dot it>
# Contributor: Aleksander Heintz <alxandr@alxandr.me>

pkgname=eww-wayland
pkgver=0.6.0
pkgrel=5
pkgdesc="A standalone widget system for wayland made in Rust."
url='https://github.com/elkowar/eww'
arch=(x86_64)
license=(MIT)
makedepends=(cargo)
depends=(glibc gcc-libs gtk3 gdk-pixbuf2 glib2 pango cairo libdbusmenu-gtk3 gtk-layer-shell)
conflicts=(eww eww-systemd)
provides=(eww eww-systemd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/elkowar/eww/archive/refs/tags/v$pkgver.tar.gz"
    'eww.service'
    'eww-open@.service')
sha256sums=('cef361946946c566b79f8ddc6208d1a3f16b4ff9961439a3f86935e1cfa174a1'
    'e60256602b5b6cbe2a53992fe1a92af0969512509a088682d9a927e218959338'
    'fc53cef0e47789e4878a74db3c099e932b9c0b6db90d262f0dd39b683ff40f01')

prepare() {
    cd "$srcdir/eww-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/eww-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features=wayland
}

package() {
    cd "$srcdir/eww-$pkgver"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -T -Dm0755 "target/release/eww" "$pkgdir/usr/bin/eww"
    install -T -Dm0644 "$srcdir/eww.service" "$pkgdir/usr/lib/systemd/user/eww.service"
    install -T -Dm0644 "$srcdir/eww-open@.service" "$pkgdir/usr/lib/systemd/user/eww-open@.service"
}
