# Maintainer: Sam S. <smls75@gmail.com>

pkgname=thomaswasalone-hib
pkgver=1+h20130429
_hibver=1369349552
pkgrel=2
pkgdesc='Thomas Was Alone, a minimalistic puzzle-platformer (Humble Bundle version)'
url='http://www.thomaswasalone.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends_i686=('glu' 'libxcursor' 'alsa-lib' 'gcc-libs')
depends_x86_64=('lib32-glu' 'lib32-libxcursor' 'lib32-alsa-lib' 'lib32-gcc-libs')
optdepends_i686=('alsa-plugins: PulseAudio support')
optdepends_x86_64=('lib32-alsa-plugins: PulseAudio support'
                   'lib32-libpulse: PulseAudio support')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://thomaswasalone-linux-${_hibver}.tar"
        'thomaswasalone-hib.desktop')
md5sums=('e7f8e766188718e16880b1137c430f35'
         '8fe996d4b1a2b3ded634a9d487ea8893')

package() {
  cd $srcdir
  _installdir="/opt/ThomasWasAlone"; _target="$pkgdir/$_installdir"

  # Fix permissions
  find "thomasLinuxStandalone" -type f -exec chmod 644 {} \;
  find "thomasLinuxStandalone" -type d -exec chmod 755 {} \;
  chmod 755 "thomasLinuxStandalone/thomasWasAlone"

  # Install game files
  mkdir -p $_target
  cp -rT "thomasLinuxStandalone" "$_target"

  # Install desktop entry
  install -Dm644 "$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install icon
  install -Dm644 "$_target/thomasWasAlone_Data/Resources/UnityPlayer.png" \
                 "$pkgdir/usr/share/pixmaps/thomaswasalone.png"

  # Install launcher script
  echo -e "#!/bin/sh\ncd $_installdir && ./thomasWasAlone" > "launcher.sh"
  install -Dm755 "launcher.sh" "$pkgdir/usr/bin/thomaswasalone"
}
