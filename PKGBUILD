# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=jellything-git
pkgver=0.1.0
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/metamuffin/jellything"
license=('AGPL3')
depends=('dav1d')
optdepends=('ffmpeg: Transcoding')
makedepends=('rustup' 'esbuild' 'nasm' 'meson' 'ninja' 'cmake')
backup=('etc/jellything.yaml')
source=("git+https://codeberg.org/metamuffin/jellything.git"
        "jellything.service"
        "jellything.yaml"
        "sysusers.conf")
sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "SKIP")

prepare() {
    cd "jellything"
    git submodule init
    git submodule update
}
build() {
    cd "jellything"
    rustup default nightly
    cargo +nightly build --release
    strip -s target/release/jellything
    strip -s target/release/jellytool
}
package() {
    install -Dm755 jellything/target/release/jellything "$pkgdir/usr/bin/jellything"
    install -Dm755 jellything/target/release/jellytool "$pkgdir/usr/bin/jellytool"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/jellything.conf"
    install -Dm644 jellything.service "$pkgdir/usr/lib/systemd/system/jellything.service"
    install -Dm640 jellything.yaml "$pkgdir/etc/jellything.yaml"
}
