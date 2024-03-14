# Maintainer: neeshy <neeshy@tfwno.gf>
_pkgname=terminus-font
pkgname="$_pkgname-italic"
pkgver=4.49.1
pkgrel=3
pkgdesc="Monospace bitmap font (for X11 and console, Italic version)"
arch=('any')
url="https://terminus-font.sourceforge.net/"
license=('OFL-1.1 AND GPL-2.0-or-later')
makedepends=('xorg-bdftopcf' 'python' 'mkbold-mkitalic')
source=("https://downloads.sourceforge.net/project/terminus-font/terminus-font-${pkgver%.1}/terminus-font-$pkgver.tar.gz")
sha256sums=('d961c1b781627bf417f9b340693d64fc219e0113ad3a3af1a3424c7aa373ef79')

build() {
  cd "$_pkgname-$pkgver"
  local _font
  for _font in {{12..24..2},28,32}{n,b}; do
    python bin/ucstoany.py -f "ter-u$_font.bdf" ISO10646 1 uni/{x11gr,10646-1}.uni |
      mkitalic | bdftopcf | gzip >"ter-x${_font%n}i.pcf.gz"
  done
}

package() {
  cd "$_pkgname-$pkgver"
  local _font
  for _font in ter-x{{12..24..2},28,32}{,b}i.pcf.gz; do
    install -Dm644 "$_font" "$pkgdir/usr/share/fonts/misc/$_font"
  done
  install -Dm644 OFL.TXT "$pkgdir/usr/share/licenses/$pkgname/OFL.TXT"
}
