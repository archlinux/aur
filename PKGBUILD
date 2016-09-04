# Maintainer: Joseph Lansdowne <J49137@gmail.com>
# Forked from dustforce-hib
#     Commit: https://aur.archlinux.org/cgit/aur.git/commit/?h=dustforce-hib&id=652033563defbd0b002b57a14ab0b4070714e9a4
#     Author: Sam S. <smls75@gmail.com>

pkgname=dustforce-hib-dustmod
pkgver=1.0+h20141222
_hibver=2014-12-22
_hibver_windows=07012015
pkgrel=1
pkgdesc='A fast-paced 2D action platformer (Humble Bundle version, with Dustmod)'
url='https://dustkidblog.wordpress.com/2016/03/09/dustmod/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('mesa' 'libgl' 'sdl2' 'libxdamage' 'freealut' 'libidn' 'libvorbis'
         'libxft' 'xdg-utils')
install=dustforce-hib-dustmod.install
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="Dustforce-Linux-${_hibver}.sh"
_installer_windows="dustforce_dx_${_hibver_windows}.zip"
source=("hib://${_installer}"
        "hib://${_installer_windows}"
        'http://dustkid.com/dmcontent/scripts/main2_drmfree'
        'dustforce-hib-dustmod.desktop')
md5sums=('e2fa7efd5b9ec64fc453f32480f63ad4'
         'fed1b6d82bdbea66d242eaaaf7d3a2f2'
         '67f78300d0451755ba897ef3fdec9ac0'
         'cc98a6127bc6d6cbdcfced14c69327cf')

[[ $CARCH == "i686" ]] && _arch='x86' || _arch='x86_64'

package() {
  cd "$srcdir"
  _installdir=/opt/dustforce-dustmod; _target="$pkgdir"/"$_installdir"

  # Install game files
  mkdir -p "$pkgdir"/"$_installdir"
  cp -TRl data/noarch "$pkgdir"/"$_installdir"
  cp -TRl data/"$_arch" "$pkgdir"/"$_installdir"

  # Include missing music track from Windows version
  ln {"Dustforce DX","$pkgdir"/"$_installdir"}/"content/audio/music/Sun Bleach.ogg"

  # Install Dustmod
  cp "$srcdir"/main2_drmfree "$pkgdir"/"$_installdir"/content/scripts/main2

  # Fix permissions
  find "$pkgdir" -type d -exec chmod 755 "{}" +
  find "$pkgdir" -type f -exec chmod 644 "{}" +
  chmod 755 "$_target"/Dustforce.bin."$_arch"

  # Install icon & desktop entry
  install -Dm644 data/noarch/Dustforce.png \
                 "$pkgdir"/usr/share/pixmaps/dustforce-dustmod.png
  install -Dm644 "$pkgname".desktop \
                 "$pkgdir"/usr/share/applications/"$pkgname".desktop

  # Install launcher symlink
  install -d "$pkgdir"/usr/bin
  ln -s "$_installdir"/Dustforce.bin."$_arch" \
        "$pkgdir"/usr/bin/dustforce-dustmod
}
