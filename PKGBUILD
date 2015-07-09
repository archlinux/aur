# Maintainer: Sam S. <smls75@gmail.com>

pkgname=eetsmunchies-hib
pkgver=beta97446+h20140311  # beta build number from eets2/manifest.json
_hibver=1394496804
pkgrel=1
pkgdesc='Eets Munchies, a family-friendly puzzle game (beta; Humble Bundle version)'
url='http://kleientertainment.com/games/eets-munchies/'
arch=('i686' 'x86_64')
license=('custom: commercial')
depends=('sdl2' 'libgl')
options=('!strip' '!upx')
PKGEXT='.pkg.tar.gz'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

[[ $CARCH == i686 ]] && { _arch=32; _md5='cdbae24ea2579ff9169f2b3d68be8a09'; } \
                     || { _arch=64; _md5='ee7694ca24aabb4c3890123f8cb2474e'; }
source=("hib://eets2-${_arch}x_linux_${_hibver}.tar"
        'eetsmunchies-hib.desktop')
md5sums=("$_md5"
         '36154f360150b2812a8e2fd44b1d8021')

package() {
  cd "$srcdir"
  _target=/opt/EetsMunchies
  
  # Install game files
  mkdir -p "$pkgdir/$_target"
  cp -TRl eets2 "$pkgdir/$_target"
  
  # Remove unneeded files
  rm "$pkgdir/$_target"/bin/lib/libSDL2*
  
  # Install icon & desktop entry
  install -Dm644 eets2/eets2.xpm "$pkgdir"/usr/share/pixmaps/eetsmunchies.xpm
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  
  # Install launch script
  echo -e "#!/bin/sh\ncd $_target/bin && exec ./eets2 \$*" > launcher.sh
  install -Dm755 launcher.sh "$pkgdir"/usr/bin/eetsmunchies
}
