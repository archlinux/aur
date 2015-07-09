# Maintainer: Sam S. <smls75@gmail.com>

pkgname=shatter-hib
pkgver=1.0.20130609
_hibver=2013-06-09
pkgrel=1
pkgdesc='A retro-inspired brick-breaking game with unique twists (Humble Bundle version)'
url='http://www.shattergame.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
if [ $CARCH == i686 ]; then
  depends=('libgl' 'libidn' 'libxinerama' 'libxft' 'alsa-lib' 'xdg-utils'
          'nvidia-cg-toolkit' 'libtxc_dxtn')
  optdepends=('alsa-plugins: PulseAudio support'
              'libpulse: PulseAudio support')
else
  depends=('lib32-libgl' 'lib32-libidn' 'lib32-libxinerama' 'lib32-libxft'
           'lib32-alsa-lib' 'xdg-utils' 'lib32-nvidia-cg-toolkit'
           'lib32-libtxc_dxtn')
  optdepends=('lib32-alsa-plugins: PulseAudio support'
              'lib32-libpulse: PulseAudio support')
fi
install='shatter-hib.install'
options=('!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="Shatter-Release-$_hibver.sh"
source=("hib://$_installer"
        'shatter-hib.desktop')
md5sums=('0c787b00292593ad91711c0df56ded0c'
         '52e9ea073d699ae979167fd4cb4af585')

package() {
  cd $srcdir
  _installdir=/opt/Shatter; _target=$pkgdir/$_installdir

  # Extract installer
  mkdir -p $_target
  while read line; do echo -n '.'; done < <(  # show progress as dots
    sh "$_installer" --tar xvf
    lzma -d < instarchive_linux_all | tar xvf - -C $_target
    lzma -d < instarchive_all | tar xvf - -C $_target
    lzma -d < subarch | tar xvf -
  ); echo

  # Remove bundled libraries & helper binaries (use system packages instead)
  rm -rf $pkgdir/opt/Shatter/lib/lib{Cg.so,CgGL.so,SDL-1.2.so.0}
  rm -rf $pkgdir/opt/Shatter/{xdg-open,xdg-utils}

  # Fix permissions
  find $pkgdir -type f -exec chmod 644 "{}" +
  chown root:root -R $pkgdir

  # Install desktop entry & icon
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $_target/Shatter.png $pkgdir/usr/share/pixmaps/shatter.png

  # Install launcher symlink
  chmod 755 $_target/*.bin.x86
  install -d $pkgdir/usr/bin
  ln -s $_installdir/Shatter.bin.x86 $pkgdir/usr/bin/shatter
  ln -s $_installdir/SettingsEditor.bin.x86 $pkgdir/usr/bin/shatter-settings

  # Install license file
  install -Dm644 config/license $pkgdir/usr/share/licenses/$pkgname/license
}
