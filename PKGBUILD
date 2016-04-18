# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>#
# Contributor: lafka <lafa@hackeriet.no>
# Contributor: Albert Chang <albert.chang@gmx.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz> You can also contact me on http://blog.harvie.cz/
# Contributor: zhehao

pkgname=riak
pkgver=2.1.4
pkgrel=1
pkgdesc='NOSQL database engine providing decentralized key-value store, flexible map/reduce engine and HTTP/JSON query interface'
arch=('i686' 'x86_64')
license=('APACHE')
url=http://docs.basho.com/riak/latest/downloads/
conflicts=('tsung')
makedepends=('erlang-nox-r17' 'java-environment')
optdepends=('jdk7-openjdk')
options=('!makeflags')
backup=('opt/riak/etc/riak.conf')
install='riak.install'
source=(
    "http://s3.amazonaws.com/downloads.basho.com/riak/2.1/${pkgver}/${pkgname}-${pkgver}.tar.gz"
    'riak.service'
)
md5sums=('b216c70a904afe4f3b0ad7acf04a6489'
         '60c34e8ee8bc6d314df62b3b6d30ec96')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  unset LDFLAGS
  make rel
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  install -d "$pkgdir/opt"
  install -d "$pkgdir/var/log"
  install -d "$pkgdir/etc"
  install -d "$pkgdir/usr/share/doc"

  cp -a "rel/riak" "$pkgdir/opt/riak"
  chmod -R 755 "$pkgdir/opt/riak/bin"
  ln -s /opt/riak/log "$pkgdir/var/log/riak"
  ln -s /opt/riak/etc "$pkgdir/etc/riak"
  cp -R "doc/man" "$pkgdir/usr/share"
  cp -R "doc" "$pkgdir/usr/share/doc/riak"
  rm -R "$pkgdir/usr/share/doc/riak/man"
  chmod -R 755 "$pkgdir/usr/share"

  # install daemon
  install -Dm644 "$srcdir"/riak.service "$pkgdir"/usr/lib/systemd/system/riak.service
}
