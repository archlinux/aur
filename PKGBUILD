# Maintainer: Sam S. <smls75@gmail.com> 
# Contributor: trya <tryagainprod@gmail.com>

pkgname=braid-hib
pkgver=1.0.2
pkgrel=2
pkgdesc="A puzzle-platformer where the player manipulates the flow of time (Humble Bundle/Store version)"
url="http://braid-game.com"
license=('custom: "commercial"')
arch=('i686' 'x86_64')
depends=('sdl' 'nvidia-cg-toolkit' 'libgl')
optdepends=('libtxc_dxtn: For more efficient texture handling when using one of the open-source Mesa graphics drivers')
makedepends=('unzip')
options=('!strip' '!upx')
replaces=('braid')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_gamepkg="braid-linux-build2.run.bin"
source=("$_gamepkg::hib://$_gamepkg"
        'braid.desktop')
md5sums=('f8933b7f7c77a234763cf73e2f9312a7'
         'e479ba41d20c1a15a9d8a29fd3b4ff76')

build() {
  cd "$srcdir"
  unzip -o $_gamepkg || true
  
  # Create launch script
  echo -e '#!/bin/sh\ncd /opt/Braid && ./braid "$@"' > "$srcdir"/launcher
}

package() {
  cd "$srcdir"
  [ $CARCH == "i686" ] && _arch=x86 || _arch=amd64
  
  # Install game files
  install -d "$pkgdir"/opt/Braid
  cp -a data/gamedata/{data,README-linux.txt} "$pkgdir"/opt/Braid/
  install -Dm755 data/$_arch/braid "$pkgdir"/opt/Braid/braid
  
  # Install launch script
  install -Dm755 launcher "$pkgdir"/usr/bin/braid
  
  # Install icon & desktop entry
  install -Dm644 data/gamedata/braid.png "$pkgdir"/usr/share/pixmaps/braid.png
  install -Dm644 braid.desktop "$pkgdir"/usr/share/applications/braid.desktop
  
  # Install licenses
  install -d "$pkgdir"/usr/share/licenses/braid
  cp -a data/gamedata/licenses "$pkgdir"/usr/share/licenses/braid/
}
