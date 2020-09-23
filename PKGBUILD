pkgname=nerd-fonts-sf-mono
pkgver=1
pkgrel=1
pkgdesc="Monospaced variant of San Francisco. Sourced directly from Apple, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion')
conflicts=('nerd-fonts-sf-mono')
provides=('nerd-fonts-sf-mono')
source=('https://developer.apple.com/design/downloads/SF-Mono.dmg' 'https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/font-patcher' 'svn+https://github.com/ryanoasis/nerd-fonts/trunk/src/glyphs')
sha256sums=('SKIP' 'SKIP' 'SKIP')
# TODO: remove warning and msg since they are only intended for internal use by makepkg. what to use instead?

build() {
  # prepare glyphs so that font-patcher can find them
  mkdir -p "$srcdir/src"
  ln -sf "$srcdir/glyphs" "$srcdir/src/glyphs"
  # extract fonts
  cd "$srcdir"
  7z x -y SF-Mono.dmg
  7z x -y "SFMonoFonts/SF Mono Fonts.pkg"
  7z x -y "Payload~"
  # patch fonts
  mkdir -p "$srcdir/patched"
  warning "Now patching all fonts. This will take very long..."
  for f in "$srcdir/Library/Fonts"/*.otf; do
    msg "Now patching $f"
    # patch font quiet with complete single-width glyphs
    python "$srcdir/font-patcher" -q -c -s "$f" -out "$srcdir/patched" &> /dev/null
  done
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/apple"
  install -m644 *.otf "$pkgdir/usr/share/fonts/apple/"
}
