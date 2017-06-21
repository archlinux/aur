# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Schtroumpfette <fpeterschmitt@voila.fr>

# 1: use adl to launch the game. Otherwise, use official game binaries directly.
USE_ADL=1

pkgname=dofus
pkgver=2.42
pkgrel=1
pkgdesc='A manga inspired, Massively Multiplayer Online Role-playing Game (MMORPG) for Adobe AIR .'
arch=('i686' 'x86_64')
url='http://www.dofus.com/'
license=('custom:Dofus License')
install='dofus.install'
depends=('adobe-air-sdk' 'qt5-base' 'libpng12')
depends_x86_64+=('lib32-gtk2' 'lib32-alsa-lib' 'lib32-alsa-plugins')
depends_i686+=('gtk2' 'alsa-lib' 'alsa-plugins')
optdeppends=('pulseaudio-alsa: Required for the game to play sounds with PulseAudio')

source=('dofus.desktop'
        'dofus.sh'
        'air-generic-launcher.sh'
        'transition.conf.patch')
source_i686=('http://dl.ak.ankama.com/games/installers/dofus-x86.tar.gz')
source_x86_64=('http://dl.ak.ankama.com/games/installers/dofus-amd64.tar.gz')
md5sums=('fcde25db66f15fe137d0412562d28a51'
         '6aa8411d57ad0b3b6d3244f60a7f24e8'
         'f179eaa5e6e6674b1853cf826fc33c3a'
         'f81ccb681ae63b4a28e1cc3023f8d84a')
md5sums_i686=('c885019d953b751d2e2177d6386cbce2')
md5sums_x86_64=('877c5c9fdad16fb7386726a745f500fc')

prepare() {
  if [ "$USE_ADL" -eq "1" ]
  then
    cd "$srcidr"
    msg2 'Modifying transition configuration to use adl-based launchers'
    patch -p0 < transition.conf.patch
  fi
}

package() {
  msg2 'Installing main applications...'
  installdir='opt/ankama/dofus'
  install -d "$pkgdir/$installdir"
  cp -r "$srcdir/Dofus/"* "$pkgdir/$installdir"

  msg2 'Setting up game file permissions...'
  chgrp -R games "$pkgdir/$installdir"
  chmod -R g+w "$pkgdir/$installdir"
  install -dm775 "$pkgdir/$installdir/bin"
  install -dm775 "$pkgdir/$installdir/share/reg/"
  install -dm775 "$pkgdir/$installdir/share/reg/bin"

  msg2 'Installing launcher...'
  install -Dm755 "$srcdir/dofus.sh" "$pkgdir/usr/bin/dofus"
  install -Dm644 "$srcdir/dofus.desktop" "$pkgdir/usr/share/applications/dofus.desktop"

  msg2 'Installing icons...'
  for icon in "$srcdir/Dofus/share/updater_data/icons/game_icon_"*'.png'
  do
    size="$(basename "$icon" | grep -o '[0-9]\+x[0-9]\+')"
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/dofus.png"
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
