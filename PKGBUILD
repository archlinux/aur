# Maintainer: neeshy <neeshy@tfwno.gf>
_pkgname=terminus-font
pkgname="$_pkgname-italic"
pkgver=4.48
pkgrel=1
pkgdesc="Monospace bitmap font (for X11 and console, Italic version)"
arch=('any')
url="http://terminus-font.sourceforge.net/"
license=('GPL2' 'custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('xorg-bdftopcf' 'fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir' 'python3'
             'mkbold-mkitalic')
optdepends=('xorg-fonts-alias')
source=("https://downloads.sourceforge.net/project/terminus-font/terminus-font-$pkgver/terminus-font-$pkgver.tar.gz")
sha256sums=('34799c8dd5cec7db8016b4a615820dfb43b395575afbb24fc17ee19c869c94af')

build() {
  cd "$_pkgname-$pkgver"
  local _font
  for _font in {{12..24..2},28,32}{n,b}; do
    python bin/ucstoany.py -f "ter-u$_font.bdf" ISO10646 1 uni/{x11gr,10646-1}.uni |
      mkitalic | bdftopcf | gzip > "ter-x${_font%n}i.pcf.gz"
  done
}

package() {
  cd "$_pkgname-$pkgver"
  local _font
  for _font in *.pcf.gz; do
    install -Dm644 "$_font" "$pkgdir/usr/share/fonts/misc/$_font"
  done
  install -Dm644 OFL.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
