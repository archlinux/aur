# Maintainer: Sam S. <smls75@gmail.com>

pkgname=dustforce-hib
pkgver=1.0+h20141222
_hibver=2014-12-22
pkgrel=1
pkgdesc='A fast-paced 2D action platformer (Humble Bundle version)'
url='http://dustforce.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('mesa' 'libgl' 'sdl2' 'libxdamage' 'freealut' 'libidn' 'libvorbis'
         'libxft' 'xdg-utils')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="Dustforce-Linux-${_hibver}.sh"
source=("hib://${_installer}"
        'dustforce-hib.desktop')
md5sums=('e2fa7efd5b9ec64fc453f32480f63ad4'
         '4cb8d6d22ac618e38386fc0340865244')

[[ $CARCH == "i686" ]] && _arch='x86' || _arch='x86_64'

package() {
  cd $srcdir
  _installdir=/opt/Dustforce; _target="$pkgdir"/$_installdir

  # Install game files
  mkdir -p "$pkgdir"/$_installdir
  cp -TRl data/noarch "$pkgdir"/$_installdir
  cp -TRl data/$_arch "$pkgdir"/$_installdir

  # Fix permissions
  find "$pkgdir" -type d -exec chmod 755 "{}" +
  find "$pkgdir" -type f -exec chmod 644 "{}" +
  chmod 755 "$_target"/Dustforce.bin.$_arch

  # Install icon & desktop entry
  install -Dm644 data/noarch/Dustforce.png \
                 "$pkgdir"/usr/share/pixmaps/dustforce.png
  install -Dm644 $pkgname.desktop \
                 "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Install launcher symlink
  install -d "$pkgdir"/usr/bin
  ln -s $_installdir/Dustforce.bin.$_arch "$pkgdir"/usr/bin/dustforce
}
