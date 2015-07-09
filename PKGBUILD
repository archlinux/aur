# Maintainer: Capi Etheriel <barraponto AT gmail DOT com>
# Based on work by Malte Wessel <muunleit AT lavabit DOT com>

pkgname=atomzombiesmasher-hib
_pkgname=atomzombiesmasher
pkgver=1.953
pkgrel=1
pkgdesc="RTS, evacuating civilians out of zombie-contaminated cities. (Commercial)"
arch=('any')
url="http://blendogames.com/atomzombiesmasher/"
license=("custom:commercial")
[ "$CARCH" = "x86_64" ] && depends=('libgdiplus' 'mono' 'csfml-bin')
conflicts=("atomzombiesmasherdemo" "atomzombiesmasher")
_gamepkg="${_pkgname}_v${pkgver//./_}-er.tar.gz"
source=("$_gamepkg::hib://$_gamepkg"
        "atomzombiesmasher.desktop"
        "https://apps.ubuntu.com/site_media/icons/2013/12/atom-zombie-smashertCCn9V.png")
md5sums=("6902c845a21e92c62f5b33b38715c797"
         "73ed32320ac1dc645754a6520b4e4e8b"
         "341ce551a8525be96d6c59c1bf9efd2a")

build() {
  # rely on realpath to get the actual directory
  sed -i 's|`dirname $0`/game|"$(dirname $(realpath $0))"/game|' $srcdir/$_pkgname/AtomZombieSmasher
  # arch command has been deprecated upstream
  sed -i 's/arch/uname -m/' $srcdir/$_pkgname/AtomZombieSmasher
}

package() {
  # Create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/doc/$_pkgname
  install -d $pkgdir/usr/share/applications
  install -g games -d $pkgdir/opt/$_pkgname

  # Copy game
  cp -a $srcdir/$_pkgname/*              $pkgdir/opt/$_pkgname
  mv $pkgdir/opt/$_pkgname/readme.html   $pkgdir/usr/share/doc/$_pkgname
  cp -a $srcdir/$_pkgname.desktop        $pkgdir/usr/share/applications/

  # Copy game icon
  mv $srcdir/atom-zombie-smashertCCn9V.png $pkgdir/opt/$_pkgname/game/$_pkgname.png

  # Link executable
  ln -s /opt/$_pkgname/AtomZombieSmasher $pkgdir/usr/bin/$_pkgname
}
