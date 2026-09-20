# Maintainer: Leo Liu <leoliu0@users.noreply.github.com>
pkgname=ratex-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Ultra-fast, pure-Rust TeX engine and complete self-contained typesetting suite"
arch=('x86_64')
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
provides=('ratex')
conflicts=('ratex')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/leoliu0/ratex/releases/download/v${pkgver}/tex-suite-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('7d89594dfc6d903707af65956b7228e5de55b0dfa87c2ac9193626cdcf63bfb3')

package() {
    cd "$srcdir/tex-suite-linux-x86_64"
    install -Dm755 bin/ratex "$pkgdir/usr/bin/ratex"
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
