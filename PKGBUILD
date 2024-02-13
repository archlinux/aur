pkgname=waylyrics
pkgver=0.2.3
pkgrel=1
pkgdesc="the furry way to show desktop lyrics"
arch=("x86_64")
url="https://waylyrics.github.io/waylyrics/waylyrics/"
license=("MIT")
depends=(
    "openssl" "hicolor-icon-theme" "dbus" "gcc-libs" "glibc" "glib2" "cairo" "dconf" "gtk4"
)
makedepends=(
    "rust>=1.73.0"
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/waylyrics/waylyrics/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('b3f0c92f38f836f82eb1291047884eb1d5318ee1e4ce86271ed447e0593b83df')
options=("!lto")

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
    cd "$srcdir/$pkgname-$pkgver"
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/$pkgname/themes"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --all-targets --all-features
}
check() {
    cd "$srcdir/$pkgname-$pkgver"
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/$pkgname/themes"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen --all-features
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 io.poly000.waylyrics.desktop \
        "$pkgdir/usr/share/applications/io.poly000.waylyrics.desktop"
    install -Dm644 io.poly000.waylyrics.gschema.xml \
        "$pkgdir/usr/share/glib-2.0/schemas/io.poly000.waylyrics.gschema.xml"
    for theme in default-dark default
    do
        install -Dm644 themes/$theme.css "$pkgdir/usr/share/$pkgname/themes/$theme.css"
    done
    install -Dm644 res/icons/hicolor/scalable/apps/io.poly000.waylyrics.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.poly000.waylyrics.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
