# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Edgar Luque <git@edgarluque.com>

pkgname=ddnet-maps-git
pkgver=r1679.g142b9c0a
pkgrel=1
pkgdesc="All released maps with configs for DDraceNetwork server"
arch=(any)
url="https://ddnet.org"
license=('custom')
makedepends=(git)
backup=(usr/share/ddnet/data/autoexec_server_maps.cfg
        usr/share/ddnet/data/reset.cfg
        usr/share/ddnet/data/storage.cfg)
source=("git+https://github.com/ddnet/${pkgname%%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%%-git}
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%%-git}
    # Remove exec permission from files
  find types/ -type f -exec chmod 644 {} \;
}

package() {
  cd ${pkgname%%-git}

  _datadir="$pkgdir/usr/share/ddnet/data"
  install -d -m755 $_datadir/{maps,types}

    # Rename autoexec_server.cfg to avoid conflict with 'ddnet' package
  install -m644 autoexec_server.cfg $_datadir/autoexec_server_maps.cfg
  install -m644 reset.cfg           $_datadir
  install -m644 storage.cfg         $_datadir

    # Unset test flag to disable cheats by default
  sed '/sv_test_cmds/s/1/0/' -i $_datadir/autoexec_server_maps.cfg

    # Set map type list, and fail if no map type is found
  _typelist=$(find types/ -name '*.map' | cut -d/ -f2 | sort -u)
  [ -n "$_typelist" ]

    # Install map types in the data directory used by DDNet Server,
    # and symlink their maps in the maps directory used by DDNet Client
  for _type in $_typelist; do
    cp -a types/$_type $_datadir/types/
    ln -rs $_datadir/types/$_type/maps/* $_datadir/maps/
  done

    # Remove conflicting maps already provided in the DDNet package
  rm -f "$_datadir/maps/Gold Mine.map" \
        "$_datadir/maps/LearnToPlay.map" \
        "$_datadir/maps/Sunny Side Up.map" \
        "$_datadir/maps/Tsunami.map" \
        "$_datadir/maps/Tutorial.map"
}
