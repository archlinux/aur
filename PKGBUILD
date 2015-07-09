# Maintainer: Sam S. <smls75@gmail.com>

pkgname=spaz-hib
pkgver=1.605_20120918
_hibver=1385503815
pkgrel=1
pkgdesc='Space Pirates and Zombies, a top-down space combat/strategy game (Humble Bundle version)'
url='http://spacepiratesandzombies.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
if [ $CARCH == i686 ]; then
  depends=('gcc-libs' 'libgl' 'sdl' 'openal' 'alsa-lib')
  optdepends=('alsa-plugins: PulseAudio support'
              'libpulse: PulseAudio support')
else
  depends=('lib32-gcc-libs' 'lib32-libgl' 'lib32-sdl' 'lib32-openal' 'lib32-alsa-lib')
  optdepends=('lib32-alsa-plugins: PulseAudio support'
              'lib32-libpulse: PulseAudio support')
fi
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="spaz-linux-${_hibver}.bin"
source=("hib://${_installer}"
        'spaz-hib.desktop')
md5sums=('0964827fe06d3447ea91457fd789a207'
         '544fa2a99bc3d4733909e18f2df6515d')

package() {
  cd $srcdir

  # Remove bundled libraries (to force usage of system libs instead)
  rm -f data/libSDL-1.2.so.0
  rm -f data/libopenal.so

  # Install game files
  install -d "${pkgdir}/opt/SPAZ"
  cp -r data/* "${pkgdir}/opt/SPAZ/"

  # Install desktop entry
  install -Dm644 "$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install icon
  install -Dm644 "data/SPAZ.png" "$pkgdir/usr/share/pixmaps/spaz.png"

  # Create launcher script
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\ncd /opt/SPAZ && ./SPAZ" > "$pkgdir/usr/bin/spaz"
  chmod 755 "$pkgdir/usr/bin/spaz"
}
