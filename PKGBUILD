# Maintainer: muzammil <muzu@duck.com>

pkgname=vinyl-player-git
pkgver=1.3.2.r70.g1acf4a4
pkgrel=1
pkgdesc="Modern GTK4/libadwaita music player"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/M23Snezhok/Vinyl"
license=('GPL-3.0-or-later')

provides=('vinyl-player')
conflicts=('vinyl-player')

depends=(
    'gtk4'
    'libadwaita'
    'glib2'
    'gstreamer'
    'gst-plugins-base-libs'
    'gst-plugins-base'
    'gst-plugins-bad-libs'
    'gst-plugins-good'
    'hicolor-icon-theme'
    'dbus'
    'gcc-libs'
    'glibc'
)

optdepends=(
    'gst-libav: additional codec support'
    'gst-plugins-bad: additional GStreamer plugins'
    'gst-plugins-ugly: additional codec support'
    'ffmpeg: enhanced media playback support'
)

makedepends=(
    'cargo'
    'git'
    'rust'
)

source=(
    "git+https://codeberg.org/M23Snezhok/Vinyl.git"
)

sha256sums=('SKIP')

pkgver() {
    cd Vinyl
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd Vinyl
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd Vinyl
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd Vinyl
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --all-features || true
}

package() {
    cd Vinyl

    _appid="page.codeberg.M23Snezhok.Vinyl"

    # Binary
    install -Dm755 "target/release/vinyl-player" "$pkgdir/usr/bin/vinyl-player"
    ln -s "vinyl-player" "$pkgdir/usr/bin/vinyl"

    # Desktop file
    install -Dm644 "data/${_appid}.desktop" "$pkgdir/usr/share/applications/${_appid}.desktop"

    # D-Bus service
    install -Dm644 "data/${_appid}.service" "$pkgdir/usr/share/dbus-1/services/${_appid}.service"

    # AppStream Metainfo
    install -Dm644 "data/${_appid}.metainfo.xml" "$pkgdir/usr/share/metainfo/${_appid}.metainfo.xml"

    # Icons
    install -Dm644 "data/hicolor/scalable/apps/${_appid}.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
    install -Dm644 "data/hicolor/symbolic/apps/${_appid}-symbolic.svg" \
        "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${_appid}-symbolic.svg"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
