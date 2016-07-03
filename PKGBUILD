# Contributor: p2k <me@p2k-network.org>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: raingloom <raingloom42@gmail.com>
pkgname=wakfu-transition
provides=( wakfu )
conflicts=( wakfu )
pkgver=1.38
pkgrel=2
pkgdesc="A turn-based tactical Massively Multiplayer Online Role-playing Game (MMORPG) written in Java/OpenGL."
url="http://www.wakfu.com/"
license=( "custom" )
arch=('i686' 'x86_64')
source_x86_64=('http://dl.ak.ankama.com/games/installers/wakfu-amd64.tar.gz')
md5sums_x86_64=('f93c4f7aea95e8f181dfe65b1d231dfd')
source_i686=('http://dl.ak.ankama.com/games/installers/wakfu-x86.tar.gz')
md5sums_i686=('ffe64c2f296828da44c51667344dec4d')
source=('wakfu.sh'
        'wakfu.desktop'
        'transition.conf.patch')
md5sums=('56f3145a28f2a608576d3751de757380'
         '6790dbbfdcb60fe9344cb23bb3dc9ab7'
         '97e66dc65ec89fb1cc819fadf771fbd0')


install='wakfu.install'
depends=('libglapi' 'openal' 'java-environment' 'ankama-transition')

prepare() {
  patch -p0 < transition.conf.patch
}

package() {
  install -Dm755 wakfu.sh "$pkgdir/usr/bin/wakfu"
  install -Dm644 wakfu.desktop "$pkgdir/usr/share/applications/wakfu.desktop"
  cd Wakfu

  msg2 'Installing icons'
  for _icon in game/updater_data/icons/game_icon_*.png
  do
    _size=$(basename $_icon | grep -o '[0-9]\+x[0-9]\+')
    install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/${_size}/apps/wakfu.png"
  done

  msg2 'Installing main application'
  _installdir="opt/ankama/wakfu"
  install -d "$pkgdir/$_installdir"
  mv game "$pkgdir/$_installdir"
  install -m644 transition.conf "$pkgdir/$_installdir"
  ln -s /opt/ankama/transition "$pkgdir/$_installdir"
}
# vim:set ts=2 sw=2 et:
