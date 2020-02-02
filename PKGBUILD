# Maintainer: gbr <gbr@protonmail.com>
# Contributor: Karmenzind
pkgname=otf-nerd-fonts-monacob-mono
pkgver=2.1.0
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
            'bd8942d3992fcbdcfdd31c0771c21e8e7cfcb78ed588383003694dc9c0da2671'
            'SKIP'
            'SKIP'
            '3377615be4271f8bdeef66e6f2f82ac3f3cfb7b5677abe7b8e189409da048859')

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
