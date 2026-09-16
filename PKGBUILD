# Maintainer: Leo Liu <leoliu0@users.noreply.github.com>
pkgname=ratex
pkgver=0.1.0
pkgrel=1
pkgdesc="Ultra-fast, pure-Rust TeX engine and typesetting toolchain (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/leoliu0/ratex"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
provides=('ratex' 'texmk' 'pdflatex' 'xelatex' 'lualatex' 'bibtex')
conflicts=('ratex-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leoliu0/ratex/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --workspace
}

package() {
    cd "${pkgname}-${pkgver}"
    ./install.sh --prefix "$pkgdir/usr" --no-path --skip-verify --no-alias-latexmk --from-source --no-build
    rm -f "$pkgdir/usr/share/tex-suite/.tex-suite-managed-files-v1"
    if [ -f LICENSE-MIT ]; then
        install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    fi
    if [ -f LICENSE-APACHE ]; then
        install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    fi
}
