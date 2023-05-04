# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=nerd-fonts-inter
_interver=3.19
_nfver=3.0.0
pkgver="${_interver}_${_nfver}"
pkgrel=1
pkgdesc="Inter Font, patched with the Nerd Fonts Patcher"
arch=('any')
url='https://github.com/rsms/inter/'
license=('custom:OFL')
makedepends=('git' 'p7zip' 'python' 'fontforge' 'subversion' 'parallel')
source=("https://github.com/rsms/inter/releases/download/v$_interver/Inter-$_interver.zip" "font-patcher-$_nfver::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$_nfver/FontPatcher.zip")
sha256sums=('150ab6230d1762a57bebf35dfc04d606ff91598a31d785f7f100356ecdcc0032'
            'db7984cd5523f5eb735119e9591e71b7433bc67bdeccf086cdae521940429a7e')

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
