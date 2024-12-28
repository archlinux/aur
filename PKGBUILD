# Maintainer: Daryl Ronningen <relms at relms dot dev>
# Contributor: Christian Brassat <christian dot brassat at gmail dot com>
# Contributor: Nico <d3sox at protonmail dot com>

pkgname=nerd-fonts-sf-mono-ligatures
pkgdesc="Monospaced variant of San Francisco. Sourced directly from Apple, patched with the Nerd Fonts Patcher and Fira Code ligatures"

# Nerd font patcher version
pkgver=3.3.0
pkgrel=2

# SF Mono version (extracted from PackageInfo) 
_fontver=6.0.1.1726709071

# Ligaturizer version
_ligver=5

# FiraCode version
_firaver=6.2

arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('git' '7zip' 'python' 'fontforge' 'parallel')
conflicts=('nerd-fonts-sf-mono')
provides=('nerd-fonts-sf-mono')
source=("SF-Mono-$_fontver.dmg::https://developer.apple.com/design/downloads/SF-Mono.dmg"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FontPatcher.zip"
  "https://github.com/ToxicFrog/Ligaturizer/archive/refs/tags/v${_ligver}.tar.gz"
  "https://github.com/tonsky/FiraCode/releases/download/$_firaver/Fira_Code_v$_firaver.zip")
sha256sums=('6d4a0b78e3aacd06f913f642cead1c7db4af34ed48856d7171a2e0b55d9a7945'
            'ce4284e7d1a8816d29bb3a358e33a44e55804792e7925ed0022ba1b3ab1a9d34'
            'da7c20e7622f7381e6905fbbed736dc50dd8515f412b040adbfe31dfd9b9efb4'
            '0949915ba8eb24d89fd93d10a7ff623f42830d7c5ffc3ecbf960e4ecad3e3e79')

build() {
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
  parallel -j$(nproc) python "$srcdir/font-patcher" -c {} -out "$srcdir/patched" ::: "$srcdir/Library/Fonts"/*.otf 

  #--------------------
  # ligaturize the nerd-patched font
  #

  mkdir -p "$srcdir/ligaturized"
  printf "%b" "\e[1;33m==>\e[0m ligaturizing all fonts\n"

  # Convert FiraCode TTF to OTF
  mkdir -p $srcdir/otf
  for f in $srcdir/ttf/*.ttf
  do
    file=${f##*/}
    base=${file%.*}
    fontforge -c "import fontforge; from sys import argv; f = fontforge.open(argv[1]); f.generate(argv[2])" $f $srcdir/otf/$base.otf
  done

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
