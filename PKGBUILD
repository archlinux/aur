# Maintainer: pyxyll <pyxyllv@gmail.com>
pkgname=cosmic-color-picker
pkgver=0.2.1
pkgrel=1
pkgdesc="Native Wayland color picker for COSMIC desktop (daemon + GUI + panel applet)"
arch=('x86_64')
url="https://github.com/Pyxyll/cosmic-color-picker"
license=('MIT')
depends=(
    'grim'
    'wl-clipboard'
    'libnotify'
    'libxkbcommon'
    'wayland'
)
makedepends=(
    'rust'
    'cargo'
    'just'
    'git'
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    # Reuse cargo's offline cache after this; speeds up rebuilds for users.
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --workspace --frozen
}

package() {
    cd "$pkgname"
    install -Dm0755 target/release/cosmic-color-pickerd       "$pkgdir/usr/bin/cosmic-color-pickerd"
    install -Dm0755 target/release/cosmic-color-picker        "$pkgdir/usr/bin/cosmic-color-picker"
    install -Dm0755 target/release/cosmic-applet-color-picker "$pkgdir/usr/bin/cosmic-applet-color-picker"

    install -Dm0644 gui/resources/com.pyxyll.CosmicColorPicker.desktop \
        "$pkgdir/usr/share/applications/com.pyxyll.CosmicColorPicker.desktop"
    install -Dm0644 applet/resources/com.pyxyll.CosmicColorPickerApplet.desktop \
        "$pkgdir/usr/share/applications/com.pyxyll.CosmicColorPickerApplet.desktop"

    install -Dm0644 gui/resources/com.pyxyll.CosmicColorPicker.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.pyxyll.CosmicColorPicker.svg"

    install -Dm0644 gui/resources/com.pyxyll.CosmicColorPicker.metainfo.xml \
        "$pkgdir/usr/share/metainfo/com.pyxyll.CosmicColorPicker.metainfo.xml"

    install -Dm0644 dist/systemd/cosmic-color-pickerd.service \
        "$pkgdir/usr/lib/systemd/user/cosmic-color-pickerd.service"

    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
