# Maintainer: Christian Brassat <christian dot brassat at gmail dot com>
# Contributor: Nico <d3sox at protonmail dot com>

pkgname=nerd-fonts-sf-mono-ligatures
pkgdesc="Monospaced variant of San Francisco. Sourced directly from Apple, patched with the Nerd Fonts Patcher and Fira Code ligatures"

# Nerd font patcher version
pkgver=2.2.2
pkgrel=1

# SF Mono version
_fontver=11

# Ligaturizer version
_ligver=5

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
		"https://github.com/tonsky/FiraCode/releases/download/3.1/FiraCode_3.1.zip")
sha256sums=('abaf6d62cd5b17ae1837ab40a35386733a3f603cf641a84cf59b1d7fb4caac39'
            '91576a4d78238ad8b1a87cb8cc0d92b8d88240e6b4bb3363280455cc1d4252b5'
            'SKIP'
            'da7c20e7622f7381e6905fbbed736dc50dd8515f412b040adbfe31dfd9b9efb4'
            'cbcabd2c412ee4c3fec4688be8387de18a33bb77bc5c5988e9fd9293a0b9dbb7')

build() {
  _patcher="font-patcher-$pkgver"
  _ligaturizer="Ligaturizer-${_ligver}"

  #--------------------
  # Free the base font
  #

  # remove previous files
  rm -rf SFMonoFonts

  # extract dmg
  7z x "SF-Mono-$_fontver.dmg"

  # extract pkg
  bsdtar xvPf "SFMonoFonts/SF Mono Fonts.pkg"
  bsdtar xvPf "SFMonoFonts.pkg/Payload"

  #--------------------
  # nerd-patch the font
  #

  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==>\e[0m patching all fonts\n"
  parallel -j$(nproc) python "$srcdir/$_patcher" \
	--glyphdir "$srcdir/glyphs/" -q -c {} -out "$srcdir/patched" \
	::: "$srcdir/Library/Fonts"/*.otf
  

  #--------------------
  # ligaturize the nerd-patched font
  #

  mkdir -p "$srcdir/ligaturized"
  printf "%b" "\e[1;33m==>\e[0m ligaturizing all fonts\n"

  # we have to manually move the donor fonts into the ligaturizer directory
  # for the different weights to be picked up correctly
  # it's kinda ugly, i know
  cd "$srcdir/$_ligaturizer"
  mkdir -p fonts/fira/distr/otf
  cp $srcdir/otf/FiraCode*.otf fonts/fira/distr/otf

  parallel -j$(nproc) fontforge -lang py -script ligaturize.py \
	--output-dir "$srcdir/ligaturized" --output-name "SFMonoNerdFont" {} \
	::: "$srcdir/patched/"*.otf
}

package() {
  # install fonts
  install -d "$pkgdir/usr/share/fonts/apple"
  install -m644 "ligaturized"/*.otf "$pkgdir/usr/share/fonts/apple/"
}
