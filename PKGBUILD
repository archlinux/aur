# Maintainer: gbr <gbr@protonmail.com>
# Contributor: Karmenzind
pkgname=otf-nerd-fonts-monacob-mono
pkgver=2.0.0
pkgrel=1
pkgdesc='MonacoB fonts patched with nerd-fonts'
arch=('any')
url='https://github.com/vjpr/monaco-bold'
license=('custom:Apple')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('fontforge' 'subversion')
source=('COPYRIGHT'
        'fix_font_name.py'
        'monaco-bold::git+https://github.com/vjpr/monaco-bold.git'
        "nerd-fonts-glyphs::svn+https://github.com/ryanoasis/nerd-fonts/tags/v$pkgver/src/glyphs"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/font-patcher")
sha256sums=('4a9d48f5368ca3b5699f61c505412a8d734a57c5da00ac0ac5ea70881f615ef3'
            'ba2caaadf628a4678b43dec05bcb596b8debf0dd94994ee43d0b557695c09d2e'
            'SKIP'
            'SKIP'
            '6b73ef4c87b2c9f06f37e56d7cde0788051ddf129b48dee8107565148725f29e')

prepare()
{
    # applies the correct fontname for MonacoB2
    find "$srcdir/monaco-bold/MonacoB2/" -type f -name '*.otf' \
        -exec ./fix_font_name.py {} \;
    mkdir -p "$srcdir/src/"
    ln -s "$srcdir/nerd-fonts-glyphs/" "$srcdir/src/glyphs"
}

build()
{
    mkdir -p "$srcdir/patched/"
    find "$srcdir/monaco-bold/" -type f -name '*.otf' \
        -exec fontforge -script "$srcdir/font-patcher" {} \
        --mono --careful --complete --progressbars --outputdir "$srcdir/patched/" \;
}

package()
{
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -d "$pkgdir/usr/share/fonts/monacob/"
    install -Dm644 "$srcdir/patched/"*.otf "$pkgdir/usr/share/fonts/monacob/"
    install -Dm644 "$srcdir/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/"
}
