# Maintainer: Sam S. <smls75@gmail.com>

pkgname=proteus-hib
pkgver=1.2+h20140516
_hibver=05162014
pkgrel=1
pkgdesc='An audio-visual exploration game (Humble Bundle version)'
url='http://www.visitproteus.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'glu' 'alsa-lib' 'libogg' 'libvorbis')
options=('!strip' '!upx')
PKGEXT='.pkg.tar.gz'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://proteus-${_hibver}-bin"
        'proteus-hib.desktop')
md5sums=('8a5911751382bcfb91483f52f781e283'
         '73388192024e7c225ed29c8219fc224c')

package() {
  cd "$srcdir"
  _target="/opt/Proteus"
  [ $CARCH == i686 ] && { _lib=lib   ; _other=lib64 ; _arch=x86    ;} \
                     || { _lib=lib64 ; _other=lib   ; _arch=x86_64 ;}
  
  # Install game files
  mkdir -p "$pkgdir"/$_target
  cp -Tal data "$pkgdir"/$_target
  
  # Remove bundled libraries (use distro versions instead)
  ( cd "$pkgdir"/$_target/$_lib
    rm -r libSDL2-2.0.so.0 libSDL2_image-2.0.so.0 libSDL2_mixer-2.0.so.0 \
          libvorbis.so.0 libvorbisfile.so.3 libogg.so.0 ../$_other )
  
  # Install desktop entry
  install -Dm644 "$pkgname".desktop \
                 "$pkgdir"/usr/share/applications/$pkgname.desktop
  
  # Install icon
  install -Dm644 data/Proteus.png "$pkgdir"/usr/share/pixmaps/proteus.png
  
  # Install launch script
  echo -e "#!/bin/sh\ncd $_target && ./Proteus.bin.$_arch" > launcher.sh
  install -Dm755 launcher.sh "$pkgdir/usr/bin/proteus"
}
