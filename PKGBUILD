# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-sf-mono
pkgver=3.0.1
pkgrel=1
_fontver=10
pkgdesc="Monospaced variant of San Francisco. Sourced directly from Apple, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion' 'parallel')
conflicts=('nerd-fonts-sf-mono')
provides=('nerd-fonts-sf-mono')
source=("SF-Mono-$_fontver.dmg::https://developer.apple.com/design/downloads/SF-Mono.dmg" "font-patcher-$pkgver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/FontPatcher.zip")
sha256sums=('abaf6d62cd5b17ae1837ab40a35386733a3f603cf641a84cf59b1d7fb4caac39'
            'c1d7a1d4d600e3d312c57cda55fbb048bdf731dbb1b2e3dab4d64643df411b3b')

build() {
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
  # patch fonts quiet with complete single-width glyphs
  parallel -j$(nproc) python "$srcdir/font-patcher" -q -c -s {} -out "$srcdir/patched" &> /dev/null ::: "$srcdir/Library/Fonts"/*.otf
}

package() {
  # install fonts
  install -d "$pkgdir/usr/share/fonts/apple"
  install -m644 "patched"/*.otf "$pkgdir/usr/share/fonts/apple/"
}
