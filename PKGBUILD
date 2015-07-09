# Maintainer: Sam S. <smls75@gmail.com>

pkgname=avirusnamedtom-hib
pkgver=0+h20131019
_hibver=10192013
pkgrel=1
pkgdesc='A Virus Named TOM, a fast-paced action-puzzler (Humble Bundle version)'
url='http://www.avirusnamedtom.com/'
arch=('i686' 'x86_64')
license=('custom: commercial')
depends=('sdl2' 'openal' 'gcc-libs' 'libvorbis' 'libtheora')
makedepends=('imagemagick')
options=('!strip' '!upx')
PKGEXT='.pkg.tar.gz'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_archive="avnt-${_hibver}-bin"
source=("hib://$_archive"
        'avirusnamedtom-hib.desktop')
md5sums=('4431412ea1ec5164ab63924161c8b4b4'
         '1d68b4a3457c20486796c3e3f01dc88f')

build() {
  convert "data/A Virus Named TOM.bmp" icon.png
}

package() {
  cd "$srcdir"
  [ $CARCH == "i686" ] && { _arch=x86    && _other=x86_64 && _libother=64 ;} \
                       || { _arch=x86_64 && _other=x86    && _libother=   ;}
  _target=/opt/AVirusNamedTOM
  
  # Install game files
  mkdir -p "$pkgdir/$_target"
  cp -TRl data "$pkgdir/$_target"
  
  # Remove unneeded files
  rm -r "$pkgdir/$_target"/lib$_libother
  rm "$pkgdir/$_target"/lib*/lib{SDL*,openal*,ogg*,vorbis*,theora{.so.0,dec.so.1}}
  rm "$pkgdir/$_target"/{AVirusNamedTOM,CircuitGame.bin.$_other}
  
  # Install icon & desktop entry
  install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/avirusnamedtom.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  
  # Install launch script
  echo -e "#!/bin/sh\n" \
          "cd $_target && exec ./CircuitGame.bin.$_arch \$*" > launcher.sh
  install -Dm755 launcher.sh "$pkgdir"/usr/bin/avirusnamedtom
}
