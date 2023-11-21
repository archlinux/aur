# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-inter
_interver=3.19
_nfver=3.1.0
pkgver="${_interver}_${_nfver}"
pkgrel=2
pkgdesc="Inter Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/rsms/inter/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion' 'parallel')
source=("https://github.com/rsms/inter/releases/download/v$_interver/Inter-$_interver.zip" "font-patcher-$_nfver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$_nfver/FontPatcher.zip")
sha256sums=('150ab6230d1762a57bebf35dfc04d606ff91598a31d785f7f100356ecdcc0032'
            '73cbf6cd548a69d64a5db5910a22b7eddfdee8ae1ae187616ae748e4c7f16ea4')

build() {
  # patch fonts
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete glyphs
  parallel -j$(nproc) python "$srcdir/font-patcher" --variable-width-glyphs -q -c {} -out "$srcdir/patched" &> /dev/null ::: "$srcdir/Inter Desktop"/*.otf
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/inter"
  install -m644 *.otf "$pkgdir/usr/share/fonts/inter/"
}
