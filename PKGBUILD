pkgname=waylyrics
pkgver=0.2.2
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
sha256sums=('032b627a14e5111b8feda2382b2a71c487a639caabb390b2cff6843da60a8c32')
options=("!lto")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/$pkgname/themes"
    cargo build --release --locked --target-dir target --all-targets
}
check() {
    cd "$srcdir/$pkgname-$pkgver"
    export WAYLYRICS_THEME_PRESETS_DIR="/usr/share/$pkgname/themes"
    cargo test --release --locked
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
