# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=jellything-git
pkgver=r633.5ccadd8
pkgrel=1
pkgdesc="Jellything media streaming server"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/metamuffin/jellything"
license=('AGPL-3.0-only')
depends=('dav1d' 'libavif' 'zstd')
optdepends=('ffmpeg: Transcoding')
makedepends=('rustup' 'esbuild' 'nasm' 'meson' 'ninja' 'cmake' 'mdbook')
backup=('etc/jellything.yaml' 'etc/jellything_secrets.yaml')
install='jellything.install'
source=("git+https://codeberg.org/metamuffin/jellything.git"
        "jellything.service"
        "jellything.yaml"
        "jellything_secrets.yaml"
        "sysusers.conf")
sha256sums=("SKIP"
            "SKIP"
            "SKIP"
            "SKIP"
            "SKIP")

pkgver() {
    cd "jellything"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "jellything"
    git submodule init
    git submodule update
    cargo +nightly fetch --locked --target "$CHOST"
}
build() {
    cd "jellything"
    cargo +nightly build --frozen --release --target "$CHOST"
    cargo +nightly build --frozen --release --bin generate_completions
    ./target/release/generate_completions completions
    mdbook build doc
}
check() {
    cd "jellything"
    cargo test --release
}
package() {
    install -Dm755 jellything/target/$CHOST/release/jellything "$pkgdir/usr/bin/jellything"
    install -Dm755 jellything/target/$CHOST/release/jellytool "$pkgdir/usr/bin/jellytool"
    install -Dm644 jellything/completions/jellytool.fish "$pkgdir/usr/share/fish/completions/jellytool.fish"
    install -Dm644 jellything/completions/jellytool.bash "$pkgdir/usr/share/bash-completion/completions/jellytool"
    install -Dm644 jellything/completions/_jellytool "$pkgdir/usr/share/zsh/site-functions/_jellytool"
    install -Dm644 jellything/completions/jellytool.elv "$pkgdir/usr/share/elvish/lib/jellytool.elv"
    install -Dm644 jellything/COPYING "$pkgdir/usr/share/licenses/jellything/COPYING"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/jellything.conf"
    install -Dm644 jellything.service "$pkgdir/usr/lib/systemd/system/jellything.service"
    install -Dm644 jellything.yaml "$pkgdir/etc/jellything.yaml"
    install -Dm640 jellything_secrets.yaml "$pkgdir/etc/jellything_secrets.yaml"
    mkdir -p "$pkgdir/usr/share/doc" && cp -r jellything/target/book "$pkgdir/usr/share/doc/jellything"
}
