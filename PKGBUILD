# Maintainer: mzwing <mzwing@mzwing.eu.org>

pkgname=relvi-git
pkgver=0.1.2.r2.g8af4809
pkgrel=1
pkgdesc='A focused launcher for Wayland'
arch=('x86_64')
url='https://github.com/so1ve/relvi'
license=('MIT' 'Unicode-3.0')
makedepends=('git' 'cargo')
depends=('gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk4' 'gtk4-layer-shell' 'libadwaita' 'pango')
provides=("relvi=$pkgver")
conflicts=('relvi')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/^relvi-v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/relvi -t "$pkgdir/usr/bin/"
    install -Dm644 data/dev.so1ve.Relvi.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 data/dev.so1ve.Relvi.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    target/release/relvi completions --shell bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/relvi"
    target/release/relvi completions --shell fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/relvi.fish"
    target/release/relvi completions --shell zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_relvi"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 resources/emoji/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-Unicode"
}
