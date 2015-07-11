# Maintainer: Jeremy Pope <jpope@jpope.org> PGP-Key: E00B4261
pkgname=pumpio-git
pkgver=0.3.0.3.g1029ac7
pkgrel=1
pkgdesc="This is pump.io. It's a stream server that does most of what people really want from a social network. (git version)"
url='http://pump.io'
license=('Apache')
arch=('i686' 'x86_64')
depends=('nodejs' 'graphicsmagick')
makedepends=('git' 'python2')
optdepends=('mongodb' 'redis')
provides=('pumpio')
conflicts=('pumpio')
install=${pkgname}.install
backup=('etc/webapps/pumpio/pump.io.json')
source=('git://github.com/e14n/pump.io.git'
        'pumpio.service'
        'pump.io.json')
sha256sums=('SKIP'
            '6274e77edd4f97fa974049877f51d40b3555104b2fec31187212b07a579a9016'
            'e7e94e20cecf7354856a88ad9b9635bb7e748e05990d4050e755d79154c587fa')

_pkgname=pumpio
_gitname='pump.io'

pkgver() {
  cd $_gitname
  git describe --tags | sed -e 's|-|.|g' -e 's|^v||'
}

build() {
  rm -rf $_gitname/.git*

  cd $_gitname

#  npmpy=$(npm config get python)
#  npm config set python python2

  npm install
  npm install databank-mongodb
  npm install databank-redis

#  if [[ $npmpy == 'undefined' ]];then
#    npm config delete python
#  else
#    npm config set python $npmpy
#  fi
}

package() {
  mkdir -p $pkgdir/usr/share/webapps/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  mkdir -p $pkgdir/etc/webapps/pumpio/

  cp -r $_gitname $pkgdir/usr/share/webapps/$_pkgname
  cp pump.io.json $pkgdir/etc/webapps/pumpio/pump.io.json
  cp pumpio.service $pkgdir/usr/lib/systemd/system/
}
