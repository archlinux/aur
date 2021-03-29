# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-inter
_interver=3.17
_nfver=2.1.0
pkgver="${_interver}_${_nfver}"
pkgrel=1
pkgdesc="Inter Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/rsms/inter/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion')
source=("https://github.com/rsms/inter/releases/download/v$_interver/Inter-$_interver.zip" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$_nfver/font-patcher" "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$_nfver/src/glyphs")
sha256sums=('3f95f93e4f49776052d2972a30ed4e1c92764393a41fe0f6ff01059a8e2a6a16' '3377615be4271f8bdeef66e6f2f82ac3f3cfb7b5677abe7b8e189409da048859' 'SKIP')

build() {
  # prepare glyphs so that font-patcher can find them
  mkdir -p "$srcdir/src"
  ln -sf "$srcdir/glyphs" "$srcdir/src/glyphs"
  # patch fonts
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  for f in "$srcdir/Inter Desktop"/*.otf; do
    printf "%b" "\e[1;32m==> \e[0mNow patching $f\n"
    # patch font quiet with complete glyphs
    python "$srcdir/font-patcher" -q -c "$f" -out "$srcdir/patched" &> /dev/null
  done
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/inter"
  install -m644 *.otf "$pkgdir/usr/share/fonts/inter/"
}
