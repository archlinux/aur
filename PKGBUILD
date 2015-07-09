# Maintainer: Sam S. <smls75@gmail.com>

pkgname=rochard-hib
pkgver=1.42+h20130620
pkgrel=1
pkgdesc='A sci-fi action platformer that centers around manipulating gravity (Humble Bundle version)'
url='http://www.rochardthegame.com'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('mesa' 'libgl' 'glu')
options=("!upx")
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

if [ $CARCH == i686 ]
then _arch=32; _build='1371746493'; _md5='bf1939c719eccef9cb04745aec5c0387';
else _arch=64; _build='1371746492'; _md5='94944c149291287900d3face338d1b4b';
fi
source=("hib://Rochard_v1.42_Linux_x${_arch}_${_build}.tar.gz"
        'rochard-hib.desktop')
md5sums=("$_md5"
         'a84ba958254ba229f5f9d66d5c6672ea')

package() {
  cd $srcdir

  # Install game files
  install -d "$pkgdir/opt/"
  mv -T Rochard_x$_arch "$pkgdir/opt/Rochard"

  # Install launcher script
  echo -e "#!/bin/sh\ncd /opt/Rochard && ./Rochard" > "launcher.sh"
  install -Dm755 "launcher.sh" "$pkgdir/usr/bin/rochard"

  # Install icon
  install -Dm644 "$pkgdir/opt/Rochard/Rochard_Data/Resources/UnityPlayer.png" \
                 "$pkgdir/usr/share/pixmaps/rochard.png"

  # Install desktop entry
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  # Install license
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/opt/Rochard/EULA.rtf" "$pkgdir/usr/share/licenses/$pkgname/"
}
