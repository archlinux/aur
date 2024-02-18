pkgname=waylyrics
pkgver=0.2.4
pkgrel=1
pkgdesc="the furry way to show desktop lyrics"
arch=("x86_64")
url="https://waylyrics.github.io/waylyrics/waylyrics/"
license=("MIT")
depends=(
    "openssl" "dbus" "gcc-libs" "glibc" "glib2" "cairo" "dconf" "gtk4"
)
makedepends=(
    "rust>=1.73.0"
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/waylyrics/waylyrics/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('77962cb8dfe6de9248a2f78b33fa0da277dd9d4b89e83d6bb4358988a8ca132c')
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
    depends+=("hicolor-icon-theme")
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
