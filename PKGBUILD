# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=phonto
pkgver=0.5.0
pkgrel=1
pkgdesc='GPU-accelerated video wallpaper program for wayland'
arch=(x86_64)
url=https://github.com/museslabs/phonto
license=(GPL-3.0-or-later)

depends=(wayland gst-plugins-good gst-plugins-bad gst-plugin-va)
optdepends=(
    'gst-libav: ffmpeg-based software decoding fallback'
)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(6aecea7fea3d1b3f7bfdf6f7afba90a9b021b765202777d8d065ef9d5840fa46)
options=(!strip !debug)

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"/$pkgname-$pkgver
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --offline
}

package () {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
}

