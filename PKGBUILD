# Maintainer: Antonio Voza <vozaanthony {at} gmail {dot} com>
pkgname=nerd-fonts-noto-sans-mono-extended
pkgver=3.0.2
pkgrel=2
pkgdesc="Noto Sans Mono including Condensed variants. Sourced directly from Google, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://www.google.com/get/noto/'
license=('custom')
makedepends=('git' 'python' 'fontforge' 'subversion' 'parallel')
conflicts=('nerd-fonts-noto' 'nerd-fonts-noto-sans-mono')
provides=('nerd-fonts-noto-sans-mono-extended')
source=("svn+https://github.com/googlefonts/noto-fonts/trunk/hinted/ttf/NotoSansMono"
        "font-patcher-$pkgver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FontPatcher.zip" "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$pkgver/src/glyphs")
sha256sums=('SKIP'
            'fbabf4cee0d7129dfcc369050a159ff626998d2b75140136c6136e18fb205989'
            'SKIP')

build() {
  # patch fonts
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete single-width glyphs
  parallel -j$(nproc) python font-patcher --glyphdir "$srcdir/glyphs/" -q -c -s {} -out "$srcdir/patched" ::: "$srcdir/NotoSansMono"/*.ttf
}

package() {
  # install fonts
  install -d "$pkgdir/usr/share/fonts/NotoSansMono"
  install -m644 "patched"/*.ttf "$pkgdir/usr/share/fonts/NotoSansMono/"
}
