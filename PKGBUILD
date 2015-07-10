# Maintainer: Sam S. <smls75@gmail.com>

pkgname=capsized-hib
pkgver=1+h20130613
_hibver=06132013
pkgrel=1
pkgdesc='A science-fiction action platformer (Humble Bundle version)'
url='http://www.capsizedgame.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('openal' 'libtheora' 'libvorbis' 'gcc-libs')
makedepends=('imagemagick')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://capsized-$_hibver-bin"
        'capsized-hib.desktop')
md5sums=('710a25b2dc5f948f0a1cf6c6fe39690f'
         'a6f5bc2ddf20690545cf095d59eec37b')

package() {
  cd $srcdir
  _installdir="/opt/Capsized"; _target="$pkgdir/$_installdir"

  # Remove files of wrong architecture
  [ $CARCH == "i686"   ] && rm -r "data/"{lib64,NePlusUltra.bin.x86_64}
  [ $CARCH == "x86_64" ] && rm -r "data/"{lib,NePlusUltra.bin.x86}

  # Remove bundled libraries (use distro versions instead)
  rm "data/lib"*/{libogg.so.0,libopenal.so.1,libtheora.so.0,libtheoradec.so.1}
  rm "data/lib"*/{libvorbis.so.0,libvorbisfile.so.3}

  # Install game files
  mkdir -p "$_target"
  mv -T "data" "$_target"

  # Install desktop entry
  install -Dm644 "$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install icon
  convert "$_target/Capsized.bmp" -resize 256x256 "capsized.png"
  install -Dm644 "capsized.png" "$pkgdir/usr/share/pixmaps/capsized.png"

  # Install launch script
  [ $CARCH == "i686" ] && _arch='x86' || _arch='x86_64'
  echo -e "#!/bin/sh\ncd $_installdir && ./NePlusUltra.bin.$_arch" > "launcher.sh"
  install -Dm755 "launcher.sh" "$pkgdir/usr/bin/capsized"
}
