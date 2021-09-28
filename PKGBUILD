# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-sf-mono
pkgver=2.1.0
pkgrel=4
pkgdesc="Monospaced variant of San Francisco. Sourced directly from Apple, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion')
conflicts=('nerd-fonts-sf-mono')
provides=('nerd-fonts-sf-mono')
source=('https://developer.apple.com/design/downloads/SF-Mono.dmg' "font-patcher-$pkgver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/font-patcher" "allow-glyphdir.diff" "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$pkgver/src/glyphs")
sha256sums=('76c415e9aee0524087cc6a042113db6b38f1a19f2e286f807aa29756461370a9' '3377615be4271f8bdeef66e6f2f82ac3f3cfb7b5677abe7b8e189409da048859' '6fad8dead6215b1d8cedbbce3d1bc1fc7c1b0bb06ea70518334bd443a7ba543f' 'SKIP')

build() {
  _patcher="font-patcher-$pkgver-glyphdir"
  # apply patch to font-patcher to allow using custom glyph directory
  patch -p1 --follow-symlinks -o "$_patcher" < allow-glyphdir.diff
  # remove previous files
  rm -rf SFMonoFonts
  # extract dmg
  7z x SF-Mono.dmg
  # extract pkg
  bsdtar xvPf "SFMonoFonts/SF Mono Fonts.pkg"
  bsdtar xvPf "SFMonoFonts.pkg/Payload"
  # patch fonts
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  for f in "$srcdir/Library/Fonts"/*.otf; do
    printf "%b" "\e[1;32m==> \e[0mNow patching $f\n"
    # patch font quiet with complete single-width glyphs
    python "$srcdir/$_patcher" --glyphdir "$srcdir/glyphs/" -q -c -s "$f" -out "$srcdir/patched" &> /dev/null
  done
}

package() {
  # install fonts
  install -d "$pkgdir/usr/share/fonts/apple"
  install -m644 "patched"/*.otf "$pkgdir/usr/share/fonts/apple/"
}
