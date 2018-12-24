# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=ddnet-maps
pkgname=$_name-git
pkgver=r1094.g486d51b4
pkgrel=1
pkgdesc="All released maps with configs for a DDraceNetwork server"
arch=(any)
url="https://ddnet.tw"
license=('custom')
makedepends=('git')
backup=('usr/share/ddnet/data/autoexec_server.cfg'
        'usr/share/ddnet/data/reset.cfg'
        'usr/share/ddnet/data/storage.cfg')
source=("git+https://github.com/ddnet/$_name.git")
md5sums=('SKIP')
PKGEXT='.pkg.tar'

pkgver() {
  cd $_name
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_name
  msg2 "Removing exec permission from files"
  find types/ -type f -exec chmod 644 {} \;
}

package() {
  cd $_name
  
  _datadir="$pkgdir/usr/share/ddnet/data"
  install -d -m755 $_datadir/types/
  
  install -m644 autoexec_server.cfg $_datadir
  install -m644 reset.cfg           $_datadir
  install -m644 storage.cfg         $_datadir
  
    # Disable test flag
  sed '/sv_test_cmds/s/1/0/' -i $_datadir/autoexec_server.cfg
  
    # Append a '#' to line of the map type you DO NOT want to be installed
  cp -a types/brutal    $_datadir/types/
  cp -a types/ddmax     $_datadir/types/
  cp -a types/dummy     $_datadir/types/
  cp -a types/insane    $_datadir/types/
  cp -a types/moderate  $_datadir/types/
  cp -a types/novice    $_datadir/types/
  cp -a types/oldschool $_datadir/types/
  cp -a types/race      $_datadir/types/
  cp -a types/solo      $_datadir/types/

    # Also make the maps available for the client
  install -d -m755 $_datadir/maps/
  cd $_datadir/maps/
  for type in $(ls $_datadir/types/); do
    ln -rs $_datadir/types/$type/maps/* .
  done
    # Avoid file conflicts as they are already provided in DDNet package
  rm "$_datadir/maps/Goo!.map"
  rm "$_datadir/maps/Kobra 4.map"
}
