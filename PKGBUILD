# Contributor: p2k <me@p2k-network.org>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=wakfu-transition
provides=wakfu
conflicts=wakfu
pkgver=1.38
pkgrel=2
pkgdesc="A turn-based tactical Massively Multiplayer Online Role-playing Game (MMORPG) written in Java/OpenGL."
url="http://www.wakfu.com/"
license="custom"
arch=('i686' 'x86_64')
source=('http://dl.ak.ankama.com/games/installers/wakfu-amd64.tar.gz'
        'http://dl.ak.ankama.com/games/installers/wakfu-x86.tar.gz'
        'wakfu.sh'
        'wakfu.desktop'
        'transition.conf.patch')
md5sums=('7ba0cc436e6039db8155ee6b702d879e'
         'c90b4da24ab48a7daf73f25ab42eb78d'
         '56f3145a28f2a608576d3751de757380'
         '6790dbbfdcb60fe9344cb23bb3dc9ab7'
         '97e66dc65ec89fb1cc819fadf771fbd0')

# Skip this block if PKGBUILD is sourced by updpkgsums (pstree is used for this check,
# and if not available, this check is skipped)
if ! ( command -v pstree >/dev/null 2>&1 && \
       pstree --show-parents $$ | grep -q updpkgsums ) ; then
  # Remove source and md5sum for the wrong arch
  if [ "$CARCH" == "x86_64" ];then
    unset source[1] md5sums[1]
  else
    unset source[0] md5sums[0]
  fi
fi

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
