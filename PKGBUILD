# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Edgar Luque <git@edgarluque.com>

pkgname=ddnet-maps-git
pkgver=r1383.g0dc84418
pkgrel=1
pkgdesc="All released maps with configs for DDraceNetwork server"
arch=(any)
url="https://ddnet.tw"
license=('custom')
makedepends=('git')
backup=('usr/share/ddnet/data/autoexec_server.cfg'
        'usr/share/ddnet/data/reset.cfg'
        'usr/share/ddnet/data/storage.cfg')
source=("git+https://github.com/ddnet/${pkgname%%-git}.git")
md5sums=('SKIP')

# Override compression, because default xz takes too much time to compress
PKGEXT='.pkg.tar'

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

  install -m644 autoexec_server.cfg $_datadir
  install -m644 reset.cfg           $_datadir
  install -m644 storage.cfg         $_datadir

    # Disable test flag
  sed '/sv_test_cmds/s/1/0/' -i $_datadir/autoexec_server.cfg

    # Set map type list, and fail if no map type is found
  _typelist=$(ls -d types/* | sed 's|.*/||')
  [ -n "$_typelist" ]

  for _type in $_typelist; do
    cp -a types/$_type $_datadir/types/
    ln -rs $_datadir/types/$_type/maps/* $_datadir/maps/
  done

    # Avoid file conflicts of maps already provided in the DDNet package
  rm -f "$_datadir/maps/Gold Mine.map" \
        "$_datadir/maps/LearnToPlay.map" \
        "$_datadir/maps/Sunny Side Up.map" \
        "$_datadir/maps/Tsunami.map"
}
