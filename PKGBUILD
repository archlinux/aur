# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: wido <widowild [ta] myopera [tod] com>

pkgname=frozensynapse
pkgver=1.0.32+h20120614
_hibver=1339710386
pkgrel=1
pkgdesc="A top-down simultaneous-turn-based tactical combat game (Humble Bundle version)"
url="http://www.frozensynapse.com/"
license=('custom: "commercial"')
arch=('i686' 'x86_64')
if [[ $CARCH == i686 ]]; then
  depends=('mesa' 'libgl' 'sdl' 'openal')
else
  depends=('lib32-mesa' 'lib32-libgl' 'lib32-sdl' 'lib32-openal')
  optdepends=("lib32-ati-dri: Support for the ATI (open-source) graphics driver"
              "lib32-intel-dri: Support for the Intel graphics driver"
              "lib32-nouveau-dri: Support for the Nouveau graphics driver")
fi
options=('!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_archive="$pkgname-linux-32-$_hibver.run"
source=("hib://$_archive"
        "$pkgname.desktop")
md5sums=('bcbfce04bd280b69bddea7a4bef0864a'
         'e5480e851062946708572273c9545b9c')

package(){
  cd "$srcdir"
  
  # Extract game files
  chmod +x $_archive
  ./$_archive --mode unattended --unattendedmodeui none --prefix "$pkgdir/opt/$pkgname"
  
  
  cd "$pkgdir"
  
  # Remove unneeded files
  rm opt/$pkgname/{uninstall,*.desktop}
  
  # Fix permissions
  chmod 644 opt/$pkgname/cacert.pem
  
  # Install launch script
  echo -e "#!/bin/sh\ncd /opt/$pkgname && exec ./FrozenSynapse \$*" \
        > "$srcdir/launcher.sh"
  install -Dm755 "$srcdir/launcher.sh" usr/bin/$pkgname

  # Install desktop entry & icon
  install -Dm644 "$srcdir/$pkgname.desktop" usr/share/applications/$pkgname.desktop
  install -Dm644 opt/$pkgname/fs_icon.png usr/share/pixmaps/$pkgname.png
}
