# Maintainer: Sam S. <smls75@gmail.com>

pkgname=markoftheninja-hib
pkgver=1.38+h20131002
_hibver=38_1380755375
pkgrel=1
pkgdesc='Mark of the Ninja, a side-scrolling stealth game (Humble Bundle version)'
url='http://www.markoftheninja.com/'
arch=('i686' 'x86_64')
license=('custom: commercial')
depends=('sdl' 'libgl' 'gcc-libs' 'xdg-utils')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://markoftheninja_linux${_hibver}.zip"
        'markoftheninja-hib.desktop')
md5sums=('7871a48068ef43e93916325eedd6913e'
         '51019af45678e517235a50bb23eb98b4')

package() {
  cd "$srcdir"
  [ $CARCH == i686 ] && { _arch=32; _other=64; } || { _arch=64; _other=32; }
  _target=/opt/MarkOfTheNinja
  
  # Install game files
  mkdir -p "$pkgdir/$_target"
  cp -Rl {bin,data,data-pc} "$pkgdir/$_target"
  
  # Remove unneeded files
  rm "$pkgdir/$_target"/bin/lib$_arch/libSDL*
  rm -r "$pkgdir/$_target"/bin/{lib,ninja-bin}$_other
  
  # Fix permissions
  find "$pkgdir" -type f -exec chmod 644 "{}" +
  chmod 755 "$pkgdir/$_target"/bin/ninja-bin*
  
  # Install icon & desktop entry
  install -Dm644 bin/motn_icon.xpm "$pkgdir"/usr/share/pixmaps/markoftheninja.xpm
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  
  # Install launch script
  echo -e "#!/bin/sh\n" \
          "export force_s3tc_enable=true\n" \
          "cd $_target/bin && exec ./ninja-bin$_arch \$*" > launcher.sh
  install -Dm755 launcher.sh "$pkgdir"/usr/bin/markoftheninja
}
