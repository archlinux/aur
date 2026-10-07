# Maintainer: Leo Liu <leoliu0@users.noreply.github.com>
pkgname=texres-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Ultra-fast, pure-Rust TeX engine and complete self-contained typesetting suite"
arch=('x86_64' 'aarch64')
url="https://github.com/leoliu0/texres"
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
provides=('texres')
conflicts=('texres' 'ratex' 'ratex-bin')
replaces=('ratex-bin')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/leoliu0/texres/releases/download/v${pkgver}/tex-suite-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/leoliu0/texres/releases/download/v${pkgver}/tex-suite-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('d1fba6a3c60a10dd3bb197286dfd8213b4dde16a1f8c811d48ad46c73803d89c')
sha256sums_aarch64=('251fcf3e03181433fd2f86405f98f6f8260748303238065708d47e6ea8758efc')

package() {
    cd "$srcdir/tex-suite-linux-${CARCH}"
    install -Dm755 bin/texres "$pkgdir/usr/bin/texres"
    local font_doc="share/tex-suite/texmf/doc/fonts"
    if [ ! -f "$font_doc/NOTICES-FONTS.txt" ] || \
       [ ! -f "$font_doc/sources.tar.zst" ] || \
       [ ! -f "$font_doc/packages.lock.json" ]; then
        echo "Error: required font redistribution payload missing in $font_doc" >&2
        return 1
    fi

    install -d "$pkgdir/usr/share/tex-suite"
    cp -a share/tex-suite/* "$pkgdir/usr/share/tex-suite/"
    if [ -f LICENSE-MIT ]; then
        install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    fi
    if [ -f LICENSE-APACHE ]; then
        install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    fi
    install -Dm644 "$font_doc/NOTICES-FONTS.txt" "$pkgdir/usr/share/licenses/$pkgname/NOTICES-FONTS.txt"
}
