# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Edgar Luque <git@edgarluque.com>

_name=ddnet-maps
pkgname=$_name-git
pkgver=r1319.g9a8bd3bf
pkgrel=1
pkgdesc="All released maps with configs for DDraceNetwork server"
arch=(any)
url="https://ddnet.tw"
license=('custom')
makedepends=('git')
backup=('usr/share/ddnet/data/autoexec_server.cfg'
        'usr/share/ddnet/data/reset.cfg'
        'usr/share/ddnet/data/storage.cfg')
source=("git+https://github.com/ddnet/$_name.git")
md5sums=('SKIP')

# Override compression, because default xz takes too much time to compress
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
  install -d -m755 $_datadir/{maps,types}

  install -m644 autoexec_server.cfg $_datadir
  install -m644 reset.cfg           $_datadir
  install -m644 storage.cfg         $_datadir

    # Disable test flag
  sed '/sv_test_cmds/s/1/0/' -i $_datadir/autoexec_server.cfg

  _types="brutal ddmax dummy insane moderate novice oldschool race solo"
  for type in $_types; do
    cp -a types/$type   $_datadir/types/
    ln -rs $_datadir/types/$type/maps/* $_datadir/maps/
  done

    # Avoid file conflicts of maps already provided in the DDNet package
  rm -f "$_datadir/maps/Gold Mine.map" \
        "$_datadir/maps/LearnToPlay.map" \
        "$_datadir/maps/Sunny Side Up.map" \
        "$_datadir/maps/Tsunami.map"
}
