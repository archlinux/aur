# Maintainer: Sam S. <smls75@gmail.com>

pkgname=brokensword-hib
pkgver=1.0.800+h20130701
_ver=v1.0.800
_build=1372464772
pkgrel=1
pkgdesc="A classic point-and-click adventure game (2009 remake; Humble Bundle version)"
url='http://revolution.co.uk/games/bs1dc/'
arch=('i686' 'x86_64')
license=('custom: commercial')
depends=('sdl' 'libgl' 'openal' 'libvorbis' 'xdg-utils')
makedepends=('imagemagick')
options=("!upx")
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://BrokenSword1DirectorsCut_${_ver}_Linux_${_build}.tar.gz"
        "$pkgname.desktop")
md5sums=('f4867d26cda9d8b06b617abcdd8bb1b7'
         '6af18e848dff2f265da638ec5a48ea6c')

package() {
  cd $srcdir

  # Install game files
  install -d "$pkgdir/opt/"
  mv -T bs1dc_linux_$_ver "$pkgdir/opt/BrokenSword"

  # Remove unneeded libraries
  if [ $CARCH == i686   ]; then _arch=i386; _wrong_arch=x86_64; fi
  if [ $CARCH == x86_64 ]; then _arch=x86_64; _wrong_arch=i386; fi
  rm "$pkgdir/opt/BrokenSword/$_arch"/{libSDL-1.2.so.0,libopenal.so.1}
  rm -r "$pkgdir/opt/BrokenSword/$_wrong_arch"

  # Install launch script
  install -d "$pkgdir/usr/bin/"
  ln -s "/opt/BrokenSword/BS1DC" "$pkgdir/usr/bin/brokensword"

  # Install icon
  install -d "$pkgdir/usr/share/pixmaps/"
  convert "$pkgdir/opt/BrokenSword/icon.bmp" \
          "$pkgdir/usr/share/pixmaps/brokensword.png"

  # Install desktop entry
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install license
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/opt/BrokenSword/legal.txt" "$pkgdir/usr/share/licenses/$pkgname/"
}
