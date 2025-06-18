# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-sf-mono
pkgver=3.4.0
pkgrel=1
_fontver=15
pkgdesc="Monospaced variant of San Francisco. Sourced directly from Apple, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion' 'parallel')
conflicts=('nerd-fonts-sf-mono')
provides=('nerd-fonts-sf-mono')
source=("SF-Mono-$_fontver.dmg::https://developer.apple.com/design/downloads/SF-Mono.dmg" "font-patcher-$pkgver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FontPatcher.zip")
sha256sums=('6d4a0b78e3aacd06f913f642cead1c7db4af34ed48856d7171a2e0b55d9a7945'
            'a8f11e511ed7c69e96680858c06b50a643ea7752e26d5cd13dd5e5cc53ab1760')

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
