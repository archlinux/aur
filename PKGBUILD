# Maintainer: pyxyll <pyxyllv@gmail.com>
pkgname=cosmic-toys
pkgver=0.3.0
pkgrel=1
pkgdesc="PowerToys-style toolbox for the COSMIC desktop (daemon + GUI + panel applet)"
arch=('x86_64')
url="https://github.com/Pyxyll/cosmic-toys"
license=('MIT')
depends=(
    'grim'
    'wl-clipboard'
    'libnotify'
    'libxkbcommon'
    'wayland'
)
# Replaces the pre-rename color-picker package so upgraders get a clean swap.
conflicts=('cosmic-color-picker')
replaces=('cosmic-color-picker')
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
    install -Dm0755 target/release/cosmic-toysd       "$pkgdir/usr/bin/cosmic-toysd"
    install -Dm0755 target/release/cosmic-toys        "$pkgdir/usr/bin/cosmic-toys"
    install -Dm0755 target/release/cosmic-toys-applet "$pkgdir/usr/bin/cosmic-toys-applet"

    install -Dm0644 gui/resources/com.pyxyll.CosmicToys.desktop \
        "$pkgdir/usr/share/applications/com.pyxyll.CosmicToys.desktop"
    install -Dm0644 applet/resources/com.pyxyll.CosmicToysApplet.desktop \
        "$pkgdir/usr/share/applications/com.pyxyll.CosmicToysApplet.desktop"

    install -Dm0644 gui/resources/com.pyxyll.CosmicToys.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.pyxyll.CosmicToys.svg"

    install -Dm0644 gui/resources/com.pyxyll.CosmicToys.metainfo.xml \
        "$pkgdir/usr/share/metainfo/com.pyxyll.CosmicToys.metainfo.xml"

    install -Dm0644 dist/systemd/cosmic-toysd.service \
        "$pkgdir/usr/lib/systemd/user/cosmic-toysd.service"

    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
