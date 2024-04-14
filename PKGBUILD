pkgname=waylyrics
pkgver=0.2.18
pkgrel=1
pkgdesc="the furry way to show desktop lyrics"
arch=("x86_64")
url="https://waylyrics.github.io/waylyrics/waylyrics/"
license=("MIT")
depends=(
    "openssl" "dbus" "gcc-libs" "glibc" "glib2" "cairo" "dconf" "gtk4" "gettext"
)
makedepends=(
    "rust"
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/waylyrics/waylyrics/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('f7a4d9d6433e1e134fcdfb00db875721056f503a4584a295d36105155f96ae5f')
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
    for theme in themes/*.css
    do
        echo "Installing theme $theme..."
        install -Dm644 "$theme" "$pkgdir/usr/share/$pkgname/$theme"
    done
    for locale in locales/*/LC_MESSAGES/waylyrics.po
    do
        echo "Installing locale $locale..."
        mo=${locale/#locales\/} # */LC_MESSAGES/waylyrics.po
        mo=${mo/%.po/.mo} # */LC_MESSAGES/waylyrics.mo
        msgfmt "$locale" -o - | install -Dm644 /dev/stdin \
            "$pkgdir/usr/share/locale/$mo"
    done
    install -Dm644 res/icons/hicolor/scalable/apps/io.poly000.waylyrics.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.poly000.waylyrics.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
