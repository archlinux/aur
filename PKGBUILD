pkgname=nerd-fonts-inter
_interver=3.15
_nfver=2.1.0
pkgver="${_interver}_${_nfver}"
pkgrel=1
pkgdesc="Inter Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/rsms/inter/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion')
conflicts=('nerd-fonts-inter')
provides=('nerd-fonts-inter')
source=("https://github.com/rsms/inter/releases/download/v$_interver/Inter-$_interver.zip" "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$_nfver/font-patcher" "svn+https://github.com/ryanoasis/nerd-fonts/tags/v$_nfver/src/glyphs")
sha256sums=('1534288eb599f57acbf2c5ac0010da9495c2ee53116e08d799555c6f8ee22156' '3377615be4271f8bdeef66e6f2f82ac3f3cfb7b5677abe7b8e189409da048859' 'SKIP')
# TODO: remove warning and msg since they are only intended for internal use by makepkg. what to use instead?

build() {
  # prepare glyphs so that font-patcher can find them
  mkdir -p "$srcdir/src"
  ln -sf "$srcdir/glyphs" "$srcdir/src/glyphs"
  # patch fonts
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  warning "Now patching all fonts. This will take very long..."
  for f in "$srcdir/Inter Desktop"/*.otf; do
    msg "Now patching $f"
    # patch font quiet with complete glyphs
    python "$srcdir/font-patcher" -q -c "$f" -out "$srcdir/patched" &> /dev/null
  done
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/inter"
  install -m644 *.otf "$pkgdir/usr/share/fonts/inter/"
}
