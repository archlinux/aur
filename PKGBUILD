# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=powerline-fonts
_gitcommit=4151af0d071503fa7f728dc7779370059258a0e9
pkgver=20150818
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
url=('https://github.com/Lokaltog/powerline-fonts')
license='CPL'
pkgdesc="Patched fonts for Powerline users"
arch=('any')
source=("https://github.com/Lokaltog/$pkgname/archive/${_gitcommit}.zip")
md5sums=('58ae195f86e734fb69a1b655f0d7cc64')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -d "$pkgdir/usr/share/fonts/misc"
  install -d "$pkgdir/usr/share/kbd/consolefonts"
  install -d "$pkgdir/etc/fonts/conf.avail"

  echo ME $srcdir/powerline-fonts-$_gitcommit

  cd "$srcdir/powerline-fonts-$_gitcommit"
  find . -iname "*.ttf" -exec install -m644 {} $pkgdir/usr/share/fonts/TTF \;
  find . -iname "*.otf" -exec install -m644 {} $pkgdir/usr/share/fonts/OTF \;
  find . -iname "*.pcf.gz" -exec install -m644 {} $pkgdir/usr/share/fonts/misc \;
  find . -iname "*.psf.gz" -exec install -m644 {} $pkgdir/usr/share/kbd/consolefonts \;

  cd $srcdir/powerline/font
  install -m644 PowerlineSymbols.otf $pkgdir/usr/share/fonts/OTF/
  install -m644 10-powerline-symbols.conf $pkgdir/etc/fonts/conf.avail/
}

post_install() {
  echo -n "Updating font cache... "
  fc-cache -fs >/dev/null
  mkfontscale /usr/share/fonts/TTF /usr/share/fonts/Type1
  mkfontdir /usr/share/fonts/TTF /usr/share/fonts/Type1
  echo "done"
}

post_upgrade() {
  post_install
}

post_remove() {
  post_install
}
