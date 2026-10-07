# Maintainer: mzwing <mzwing@mzwing.eu.org>

pkgname=relvi
_pkgver=0.1.2
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='A focused launcher for Wayland'
arch=('x86_64')
url='https://github.com/so1ve/relvi'
license=('MIT' 'Unicode-3.0')
makedepends=('cargo')
depends=('gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk4' 'gtk4-layer-shell' 'libadwaita' 'pango')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/refs/tags/$pkgname-v$_pkgver.tar.gz")
sha256sums=('a7ba1e5e8479a8c1baf6ddd25f113a49431275b3c8cda1b0c3a347931974d91f')

prepare() {
    cd "$pkgname-$pkgname-v$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgname-v$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgname-v$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgname-v$_pkgver"
    install -Dm755 target/release/relvi -t "$pkgdir/usr/bin/"
    install -Dm644 data/dev.so1ve.Relvi.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 data/dev.so1ve.Relvi.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    target/release/relvi completions --shell bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/relvi"
    target/release/relvi completions --shell fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/relvi.fish"
    target/release/relvi completions --shell zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_relvi"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 resources/emoji/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Unicode"
}
