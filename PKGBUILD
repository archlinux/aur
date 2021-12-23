# Maintainer: Joe Maples <joe@maples.dev>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-cozette-ttf
_cozettever=1.13.0
_nfver=2.1.0
pkgver="${_interver}_${_nfver}"
pkgrel=1
pkgdesc="Cozette Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/slavfox/cozette/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion')
source=("https://github.com/slavfox/Cozette/releases/download/v.${_cozettever}/CozetteVector.ttf" "font-patcher-$_nfver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$_nfver/font-patcher" "allow-glyphdir.diff" "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$_nfver/src/glyphs")
sha256sums=('b2a0d2694844ce8fab8686c5be38396f8ff26a5d175269424c21a60417d5129c' '3377615be4271f8bdeef66e6f2f82ac3f3cfb7b5677abe7b8e189409da048859' '6fad8dead6215b1d8cedbbce3d1bc1fc7c1b0bb06ea70518334bd443a7ba543f' 'SKIP')

build() {
  _patcher="font-patcher-$_nfver-glyphdir"
  # apply patch to font-patcher to allow using custom glyph directory
  patch -p1 --follow-symlinks -o "$_patcher" < allow-glyphdir.diff
  # patch fonts
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete glyphs
  python "$srcdir/$_patcher" --glyphdir "$srcdir/glyphs/" -out "$srcdir/patched" "$srcdir/CozetteVector.ttf"
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
