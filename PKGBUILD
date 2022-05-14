pkgname=nerd-fonts-noto-sans-mono-extended
pkgver=2.1.0
pkgrel=1
pkgdesc="Noto Sans Mono including Condensed variants. Sourced directly from Google, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://www.google.com/get/noto/'
license=('custom')
makedepends=('git' 'python' 'fontforge' 'subversion' 'parallel')
conflicts=('nerd-fonts-noto' 'nerd-fonts-noto-sans-mono')
provides=('nerd-fonts-noto-sans-mono-extended')
source=("svn+https://github.com/googlefonts/noto-fonts/trunk/hinted/ttf/NotoSansMono"
        "font-patcher-$pkgver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/font-patcher" "allow-glyphdir.diff" "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$pkgver/src/glyphs")
sha256sums=('SKIP'
            '3377615be4271f8bdeef66e6f2f82ac3f3cfb7b5677abe7b8e189409da048859'
            '6fad8dead6215b1d8cedbbce3d1bc1fc7c1b0bb06ea70518334bd443a7ba543f'
            'SKIP')

build() {
  _patcher="font-patcher-$pkgver-glyphdir"
  # apply patch to font-patcher to allow using custom glyph directory
  patch -p1 --follow-symlinks -o "$_patcher" < allow-glyphdir.diff
  # patch fonts
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete single-width glyphs
  parallel -j$(nproc) python "$srcdir/$_patcher" --glyphdir "$srcdir/glyphs/" -q -c -s {} -out "$srcdir/patched" &> /dev/null ::: "$srcdir/NotoSansMono"/*.ttf
}

package() {
  # install fonts
  install -d "$pkgdir/usr/share/fonts/NotoSansMono"
  install -m644 "patched"/*.ttf "$pkgdir/usr/share/fonts/NotoSansMono/"
}
