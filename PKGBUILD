# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=camper
pkgname="$_pkgname-git"
pkgver=r10.g702e619
pkgrel=1
pkgdesc="A minimalistic Bandcamp music player client for Linux, built with Rust, GTK4/libadwaita, and GStreamer."
arch=('x86_64' 'aarch64')
url="https://github.com/knoopx/camper"
license=('custom:NONE')
depends=('gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugin-gtk4' 'gtk4' 'libadwaita' 'webkitgtk-6.0')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-git"
    "${_pkgname}-bin"
)
source=(
  "git+$url.git"
  "https://patch-diff.githubusercontent.com/raw/knoopx/camper/pull/2.patch"
)
sha256sums=('SKIP'
            'cec51c22c3c19739a1044229e1bc17b966189b5632003d967e90f888e94c424f')

pkgver() {
    cd "$srcdir/$_pkgname" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname" || exit
    patch -Np1 < "$srcdir/2.patch" #|| true
    export CARGO_HOME="$srcdir/CARGO_HOME"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

check() {
    cd "$srcdir/$_pkgname" || exit
    export CARGO_HOME="$srcdir/CARGO_HOME"
    export RUSTUP_TOOLCHAIN=stable
    cargo check
}

build() {
    cd "$srcdir/$_pkgname" || exitd
    export CARGO_HOME="$srcdir/CARGO_HOME"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname" || exit

    install -Dm755 "./target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "./res/camper.desktop" "$pkgdir/usr/share/applications/camper.desktop"
    install -Dm644 "./res/camper.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/camper.png"
}
