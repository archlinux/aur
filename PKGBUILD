# Maintainer: gbr <gbr@protonmail.com>
# Contributor: Karmenzind
pkgname=otf-nerd-fonts-monacob-mono
pkgver=2.3.0
pkgrel=1
pkgdesc='MonacoB fonts patched with nerd-fonts'
arch=('any')
url='https://github.com/vjpr/monaco-bold'
license=('custom:Apple')
depends=()
makedepends=('fontforge' 'subversion')
source=('COPYRIGHT'
        'fix_font_name.py'
        'monaco-bold::git+https://github.com/vjpr/monaco-bold.git#commit=b77db4b6fc2e9df074f8db59cead862d7068e3d7'
        "nerd-fonts-glyphs::svn+https://github.com/ryanoasis/nerd-fonts/tags/v$pkgver/src/glyphs"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/font-patcher")
sha256sums=('4a9d48f5368ca3b5699f61c505412a8d734a57c5da00ac0ac5ea70881f615ef3'
            '45322eec525058c1bc55f2a999fad74eac9e9869caf7174bb292e92474d5aa73'
            'SKIP'
            'SKIP'
            '91576a4d78238ad8b1a87cb8cc0d92b8d88240e6b4bb3363280455cc1d4252b5')

prepare() {
    find "$srcdir/monaco-bold/" -type f -name '*.otf' \
        -exec ./fix_font_name.py {} \;
    mkdir -p "$srcdir/src/"
    ln -sf "$srcdir/nerd-fonts-glyphs/" "$srcdir/src/glyphs"
}

build() {
    mkdir -p "$srcdir/patched/"
    find "$srcdir/monaco-bold/" -type f -name '*.otf' \
        -exec fontforge -script "$srcdir/font-patcher" {} \
        --mono --careful --complete --progressbars --outputdir "$srcdir/patched/" \;
}

package() {
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -d "$pkgdir/usr/share/fonts/monacob/"
    install -Dm644 "$srcdir/patched/"*.otf "$pkgdir/usr/share/fonts/monacob/"
    install -Dm644 "$srcdir/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/"
}
