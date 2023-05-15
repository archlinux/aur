# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-inter
_interver=3.19
_nfver=3.0.1
pkgver="${_interver}_${_nfver}"
pkgrel=1
pkgdesc="Inter Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/rsms/inter/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion' 'parallel')
source=("https://github.com/rsms/inter/releases/download/v$_interver/Inter-$_interver.zip" "font-patcher-$_nfver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$_nfver/FontPatcher.zip")
sha256sums=('150ab6230d1762a57bebf35dfc04d606ff91598a31d785f7f100356ecdcc0032'
            'c1d7a1d4d600e3d312c57cda55fbb048bdf731dbb1b2e3dab4d64643df411b3b')

build() {
  # patch fonts
  cd "$srcdir"
  mkdir -p "$srcdir/patched"
  printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts. This will take very long...\n"
  # patch fonts quiet with complete glyphs
  parallel -j$(nproc) python "$srcdir/font-patcher" -q -c {} -out "$srcdir/patched" &> /dev/null ::: "$srcdir/Inter Desktop"/*.otf
}

package() {
  cd "$srcdir/patched"
  install -d "$pkgdir/usr/share/fonts/inter"
  install -m644 *.otf "$pkgdir/usr/share/fonts/inter/"
}
