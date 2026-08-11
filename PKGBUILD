# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-inter
_interver=4.1
_nfver=3.5.0
pkgver="${_interver}_${_nfver}"
pkgrel=2
pkgdesc="Inter Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/rsms/inter/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion' 'parallel')
source=("https://github.com/rsms/inter/releases/download/v$_interver/Inter-$_interver.zip" "font-patcher-$_nfver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$_nfver/FontPatcher.zip")
sha256sums=('9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e'
            'bcc707177d95cfee99fcc50ac3ae01a844372a6a4b66c12b7d4423563951feef')

build() {
  # patch fonts
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete glyphs
  parallel -j$(nproc) python "$srcdir/font-patcher" --variable-width-glyphs -q -c {} -out "$srcdir/patched" &> /dev/null ::: "$srcdir/extras/otf"/*.otf
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/inter"
  install -m644 *.otf "$pkgdir/usr/share/fonts/inter/"
}
