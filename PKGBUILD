# Maintainer: Asher Buk <AshBuk@users.noreply.github.com>
# https://github.com/AshBuk/Shaya

pkgname=shaya
pkgver=0.1.0
pkgrel=1
pkgdesc="Native AI assistant for Linux, built with Rust and GTK4"
arch=('x86_64' 'aarch64')
url="https://github.com/AshBuk/Shaya"
license=('Apache-2.0')
depends=(
    'cairo'
    'glib2'
    'glibc'
    'gtk4'
    'gtk4-layer-shell'
    'hicolor-icon-theme'
    'libadwaita'
    'libgcc'
    'pango'
)
makedepends=('rust')
# makepkg LTO turns the C objects of the ring crate into bytecode that rustc's linker cannot resolve.
# The release profile strips the binary, so a debug package would be empty.
options=('!lto' '!debug')
optdepends=(
    'pipewire-audio: audio capture with pw-record'
    'wireplumber: system audio detection with wpctl'
    'libpulse: audio capture with parecord'
    'opus-tools: meeting recording encoder'
    'ffmpeg: alternative meeting recording encoder'
    'grim: screenshots on wlroots compositors'
    'slurp: area selection on wlroots compositors'
    'spectacle: screenshots on KDE Plasma'
    'gnome-screenshot: screenshots on GNOME X11'
    'scrot: screenshots on X11'
    'xdg-utils: open the meetings folder'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('20bb32d4a1e864e38a834d44bf50feaedb004a63acd8eefd02ca9084714b1379')

prepare() {
    cd "Shaya-$pkgver"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "Shaya-$pkgver"
    cargo build --frozen --release
}

check() {
    cd "Shaya-$pkgver"
    cargo test --frozen
}

package() {
    cd "Shaya-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" target/release/shaya
    install -Dm644 -t "$pkgdir/usr/share/applications" assets/io.github.ashbuk.shaya.desktop
    install -Dm644 -t "$pkgdir/usr/share/metainfo" assets/io.github.ashbuk.shaya.metainfo.xml
    install -Dm644 icons/shaya.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.ashbuk.shaya.png"
    install -Dm644 icons/shaya.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.ashbuk.shaya.svg"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/OVERLAY_GUIDE.md
}
