# Maintainer: ReadyPlayerNaN (https://github.com/ReadyPlayerNaN)
pkgname=ravel-git
pkgver=r22.7761e45
pkgrel=1
pkgdesc='Read-only JSON, JSON Lines, YAML and Markdown viewer for GNOME'
arch=('x86_64' 'aarch64')
url='https://github.com/ReadyPlayerNaN/ravel'
# Upstream has not declared a project license. Do not infer one from dependencies.
license=('LicenseRef-unknown')
depends=('glibc' 'gcc-libs' 'gtk4>=4.12' 'libadwaita>=1.6' 'gtksourceview5>=5.4'
         'webkitgtk-6.0' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('git' 'cargo' 'pkgconf')
checkdepends=('jq')
optdepends=('jq: run structural queries from the context menu'
            'gst-libav: additional audio and video codecs'
            'gst-plugins-bad: additional media formats'
            'gst-plugins-ugly: additional media codecs')
provides=('ravel')
conflicts=('ravel')
options=('!lto')
source=("ravel::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/ravel" || return
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/ravel" || return
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$srcdir/ravel" || return
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release -p ravel-desktop --bin ravel
}

check() {
    cd "$srcdir/ravel" || return
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    # Display-dependent smoke tests run separately in the upstream CI gate.
    cargo test --frozen --workspace
}

package() {
    cd "$srcdir/ravel" || return
    install -Dm755 target/release/ravel "$pkgdir/usr/bin/ravel"
    install -Dm644 data/global.zak.ravel.desktop \
        "$pkgdir/usr/share/applications/global.zak.ravel.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 crates/ravel-desktop/assets/markdown/katex/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/KaTeX-LICENSE"
    install -Dm644 crates/ravel-desktop/assets/markdown/highlight/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/Highlight.js-LICENSE"
}
