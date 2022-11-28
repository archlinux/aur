# Maintainer: Christian Brassat <aur@brassat.eu>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-sf-mono-ligatures
pkgver=2.2.2
pkgrel=1
_fontver=11
_ligver=5
pkgdesc="Monospaced variant of San Francisco. Sourced directly from Apple, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion' 'parallel')
conflicts=('nerd-fonts-sf-mono')
provides=('nerd-fonts-sf-mono')
source=("SF-Mono-$_fontver.dmg::https://developer.apple.com/design/downloads/SF-Mono.dmg"
        "font-patcher-$pkgver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/font-patcher"
        "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$pkgver/src/glyphs"
        "https://github.com/ToxicFrog/Ligaturizer/archive/refs/tags/v${_ligver}.tar.gz"
        "FiraCode-Bold.otf" "FiraCode-Light.otf" "FiraCode-Medium.otf" "FiraCode-Regular.otf" "FiraCode-Retina.otf" "FiraCode-SemiBold.otf" )
sha256sums=('abaf6d62cd5b17ae1837ab40a35386733a3f603cf641a84cf59b1d7fb4caac39'
            '91576a4d78238ad8b1a87cb8cc0d92b8d88240e6b4bb3363280455cc1d4252b5'
            'SKIP'
            'da7c20e7622f7381e6905fbbed736dc50dd8515f412b040adbfe31dfd9b9efb4'
            'f8bc0f1234ee5639fb791d8b3cf69f5594eb422e98bb559089d7262b96eff422'
            'b178e885b4e13cc76946fe00efda64b78c75730251b68abc8621fd281f9bf869'
            'a4ca4817a07dff8c40c923657f8b23c02e29f4d7d30761454188b0a44c2e7f8c'
            'b5639c832c98f9f4dc5bd6c0806ca0761e0af495bf1ffadf44943b0c2d634507'
            '78f5d1f2925a3d1a52e8132eec2ffe9450ea89c22b88920c54684cd161a3d088'
            '803dd2d4a698c307710b7a11613e0474d423ca22f5b3a5f70a201d2bd739f067')

build() {
  _patcher="font-patcher-$pkgver"
  _ligaturizer="Ligaturizer-${_ligver}"

  # remove previous files
  rm -rf SFMonoFonts

  # extract dmg
  7z x "SF-Mono-$_fontver.dmg"

  # extract pkg
  bsdtar xvPf "SFMonoFonts/SF Mono Fonts.pkg"
  bsdtar xvPf "SFMonoFonts.pkg/Payload"

  # patch fonts
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  parallel -j$(nproc) python "$srcdir/$_patcher" --glyphdir "$srcdir/glyphs/" -q -c {} -out "$srcdir/patched" &> /dev/null ::: "$srcdir/Library/Fonts"/*.otf
  
  # ligaturize fonts
  mkdir -p "$srcdir/ligaturized"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow ligaturizing all fonts. This will take very long...\n"
  cd "$srcdir/$_ligaturizer"
  mkdir -p fonts/fira/distr/otf
  mv $srcdir/FiraCode*.otf fonts/fira/distr/otf
  parallel -j$(nproc) fontforge -lang py -script ligaturize.py --output-dir "$srcdir/ligaturized" --output-name "SFMonoNerdFont" "{}" ::: "$srcdir/patched/"*.otf
}

package() {
  # install fonts
  install -d "$pkgdir/usr/share/fonts/apple"
  install -m644 "ligaturized"/*.otf "$pkgdir/usr/share/fonts/apple/"
}
