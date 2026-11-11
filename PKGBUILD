
# Maintainer: Local PKGBUILD
pkgname=leboiko-markdown-reader
pkgver=1.35.4
pkgrel=1
pkgdesc="Terminal Markdown reader with Mermaid and LaTeX rendering"
arch=('x86_64' 'aarch64')
url="https://github.com/leboiko/markdown-reader"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
source=("git+https://github.com/leboiko/markdown-reader.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=(!lto)

prepare() {
    cd "$srcdir/markdown-reader"

    # Fetch all Rust dependencies before the offline build
    cargo fetch --locked
}

build() {
    cd "$srcdir/markdown-reader"

    # Prevent GCC LTO incompatibility with ring
    export CFLAGS="${CFLAGS//-flto/}"
    export CXXFLAGS="${CXXFLAGS//-flto/}"

    cargo build --release --locked --offline
}

check() {
    cd "$srcdir/markdown-reader"

    cargo test --release --locked --offline
}

package() {
    cd "$srcdir/markdown-reader"

    install -Dm755 \
        target/release/markdown-reader \
        "$pkgdir/usr/bin/markdown-reader"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}

