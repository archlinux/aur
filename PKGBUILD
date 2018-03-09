# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Schtroumpfette <fpeterschmitt@voila.fr>

# 1: use adl to launch the game. Otherwise, use official game binaries directly.
USE_ADL=1

pkgname=dofus-beta
pkgver=2.46
pkgrel=1
pkgdesc='A manga inspired, Massively Multiplayer Online Role-playing Game (MMORPG) for Adobe AIR (Beta version).'
arch=('i686' 'x86_64')
url='http://www.dofus.com/'
license=('custom:Dofus License')
install='dofus-beta.install'
depends=('adobe-air-sdk' 'qt5-base' 'libpng12')
depends_x86_64+=('lib32-gtk2' 'lib32-alsa-lib' 'lib32-alsa-plugins')
depends_i686+=('gtk2' 'alsa-lib' 'alsa-plugins')
optdepends=('pulseaudio-alsa: Required for the game to play sounds with PulseAudio')

source=('dofus-beta.desktop'
        'dofus-beta.sh'
        'air-generic-launcher.sh'
        'transition.conf.patch')
source_i686=('http://dl.ak.ankama.com/games/installers/beta/dofus-beta-x86.tar.gz')
source_x86_64=('http://dl.ak.ankama.com/games/installers/beta/dofus-beta-amd64.tar.gz')
md5sums=('0e797e4fcf39e1d06f68b51bfd215040'
         'cecd52aa9a58f756fa15925528400d66'
         '092f6852a6ea603a7b8c7175a13eb416'
         '28fa5927aad634debf7f1ff9f549f59c')
md5sums_i686=('01ce4e20df355f9a5724ef5c5b880cbf')
md5sums_x86_64=('7566e58290a158e12156ef8ab608c7d0')

prepare() {
  if [ "$USE_ADL" -eq "1" ]
  then
    cd "$srcdir"
    msg2 'Modifying transition configuration to use adl-based launchers'
    patch -p0 < transition.conf.patch
  fi
}

package() {
  msg2 'Installing main applications...'
  installdir='opt/ankama/dofus-beta'
  install -d "$pkgdir/$installdir"
  cp -r "$srcdir/DofusBeta/"* "$pkgdir/$installdir"

  msg2 'Setting up game file permissions...'
  chgrp -R games "$pkgdir/$installdir"
  chmod -R g+w "$pkgdir/$installdir"
  install -dm775 "$pkgdir/$installdir/bin"
  install -dm775 "$pkgdir/$installdir/share/reg/"
  install -dm775 "$pkgdir/$installdir/share/reg/bin"

  msg2 'Installing launcher...'
  install -Dm755 "$srcdir/dofus-beta.sh" "$pkgdir/usr/bin/dofus-beta"
  install -Dm644 "$srcdir/dofus-beta.desktop" "$pkgdir/usr/share/applications/dofus-beta.desktop"

  msg2 'Installing icons...'
  for icon in "$srcdir/DofusBeta/share/updater_data/icons/game_icon_"*'.png'
  do
    size="$(basename "$icon" | grep -o '[0-9]\+x[0-9]\+')"
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/dofus-beta.png"
  done

  if [ "$USE_ADL" -eq "1" ]
  then
    msg2 'Installing adl based launchers...'
    install -Dm755 'air-generic-launcher.sh' "$pkgdir/$installdir/bin/air-generic-launcher.sh"
    install -Dm755 'air-generic-launcher.sh' "$pkgdir/$installdir/share/reg/bin/air-generic-launcher.sh"
  else
    msg2 'Installing link to bypass Adobe Air detection...'
    ln -s '/opt/adobe-air-sdk/runtimes/air/linux/Adobe AIR/' "$pkgdir/opt/Adobe AIR"
  fi
}

# vim:set ts=2 sw=2 et:
