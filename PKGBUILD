# Maintainer: Leo Liu <leoliu0@users.noreply.github.com>
pkgname=ratex
pkgver=0.4.1
pkgrel=1
pkgdesc="Ultra-fast, pure-Rust TeX engine and typesetting toolchain (built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/leoliu0/ratex"
license=(
    'MIT'
    'Apache-2.0'
    'LPPL-1.3c'
    'GPL-2.0-only'
    'GPL-2.0-or-later'
    'GPL-2.0-or-later WITH Font-exception-2.0'
    'OFL-1.1'
    'custom:GUST'
    'custom:IPA'
    'custom:Arphic'
    'custom:Wadalab'
    'custom:bundled-fonts'
)
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=('ratex')
conflicts=('ratex-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leoliu0/ratex/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b1b3cda82a19fddfceaabfeb45e9f61aedfb26d55fca58b87dd91e38e5ec2b3b')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --bin ratex
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/ratex "$pkgdir/usr/bin/ratex"
    local assets_dir="crates/tex-kpse/assets"
    local font_doc="$pkgdir/usr/share/tex-suite/texmf/doc/fonts"

    if [ ! -d "$assets_dir/legal" ] || \
       [ ! -f "$assets_dir/legal/NOTICES-FONTS.txt" ] || \
       [ ! -f "$assets_dir/sources.tar.zst" ] || \
       [ ! -f "$assets_dir/packages.lock.json" ]; then
        echo "Error: required font redistribution assets missing in $assets_dir" >&2
        return 1
    fi

    install -d "$font_doc"
    cp -a "$assets_dir/legal/"* "$font_doc/"
    install -m644 "$assets_dir/sources.tar.zst" "$font_doc/sources.tar.zst"
    install -m644 "$assets_dir/packages.lock.json" "$font_doc/packages.lock.json"

    if [ -f LICENSE-MIT ]; then
        install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    fi
    if [ -f LICENSE-APACHE ]; then
        install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    fi
    install -Dm644 "$assets_dir/legal/NOTICES-FONTS.txt" "$pkgdir/usr/share/licenses/$pkgname/NOTICES-FONTS.txt"
}
