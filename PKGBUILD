# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-inter
_interver=3.19
_nfver=2.1.0
pkgver="${_interver}_${_nfver}"
pkgrel=2
pkgdesc="Inter Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/rsms/inter/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion' 'parallel')
source=("https://github.com/rsms/inter/releases/download/v$_interver/Inter-$_interver.zip" "font-patcher-$_nfver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$_nfver/font-patcher" "allow-glyphdir.diff" "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$_nfver/src/glyphs")
sha256sums=('150ab6230d1762a57bebf35dfc04d606ff91598a31d785f7f100356ecdcc0032' '3377615be4271f8bdeef66e6f2f82ac3f3cfb7b5677abe7b8e189409da048859' '6fad8dead6215b1d8cedbbce3d1bc1fc7c1b0bb06ea70518334bd443a7ba543f' 'SKIP')

build() {
  _patcher="font-patcher-$_nfver-glyphdir"
  # apply patch to font-patcher to allow using custom glyph directory
  patch -p1 --follow-symlinks -o "$_patcher" < allow-glyphdir.diff
  # patch fonts
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete glyphs
  parallel -j$(nproc) python "$srcdir/$_patcher" --glyphdir "$srcdir/glyphs/" -q -c {} -out "$srcdir/patched" &> /dev/null ::: "$srcdir/Inter Desktop"/*.otf
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/inter"
  install -m644 *.otf "$pkgdir/usr/share/fonts/inter/"
}
