# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=octa
pkgver=0.19.1
pkgrel=1
pkgdesc="Viewer, editor, CLI and MCP server for tabular data: 30+ formats, SQL, databases, cloud"
arch=('x86_64')
url="https://github.com/thorstenfoltz/octa"
license=('MIT')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'openssl' 'fontconfig' 'freetype2' 'harfbuzz' 'fribidi')
# asciidoctor renders the man page from docs/cli/octa.1.adoc during build.
makedepends=('rust' 'cargo' 'clang' 'cmake' 'nasm' 'pkgconf' 'asciidoctor')
conflicts=('octa-bin')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('150e306d5b58d531eb81b8eccdd8fcab34e8d9106ed512ffee2f42b3967770fe')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i "s/^version = .*/version = \"$pkgver\"/" Cargo.toml
    export RUSTUP_TOOLCHAIN=stable
    cargo update --workspace
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_BUILD_JOBS="$(nproc)"
    export MAKEFLAGS="-j$(nproc)"
    cargo build --frozen --release
    asciidoctor -b manpage docs/cli/octa.1.adoc -o octa.1
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/octa" "$pkgdir/usr/bin/octa"
    install -Dm644 "assets/octa.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/octa.svg"
    install -Dm644 "octa.desktop" "$pkgdir/usr/share/applications/octa.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -Dm644 "THIRD_PARTY_LICENSES.md" \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/licenses" licenses/*.txt
    install -Dm644 "octa.1" "$pkgdir/usr/share/man/man1/octa.1"
}
