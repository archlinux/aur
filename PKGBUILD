# Maintainer:  <aaron.l.france@gmail.com>
pkgname=kairosdb
pkgver=1.2.2
pkgrel=1
pkgdesc="a fast distributed scalable time series database written on top of Cassandra."
arch=('i686' 'x86_64')
url="https://github.com/kairosdb/kairosdb"
license=('Apache')
depends=('cassandra')
makedepends=('deb2targz')
provides=('kairosdb')
source=('https://github.com/kairosdb/kairosdb/releases/download/v1.2.2/kairosdb-1.2.2-1.tar.gz'
        'kairosdb.service'
        'kairosdb')
md5sums=('269076a61419397b22bc35c6dfa0af17'
         '3f957c6bfc4e1206dba09c049baa10a0'
         'ab930d18b8f13ee662a1f7d6380573a0')

build() {
  tar zxvf $srcdir/kairosdb-1.2.2-1.tar.gz
}

package() {
  sed -i 's/\(kairosdb.service.datastore=org.kairosdb.datastore.h2.H2Module\)/#\1/g' \
    $srcdir/kairosdb/conf/kairosdb.properties
  sed -i 's/#\(kairosdb.service.datastore=org.kairosdb.datastore.cassandra.CassandraModule\)/\1/g' \
    $srcdir/kairosdb/conf/kairosdb.properties

  mkdir -p ${pkgdir}/{etc/kairosdb,var/log/kairosdb,opt}
  cp -r $srcdir/kairosdb $pkgdir/opt/kairosdb

  install -Dm644 ${srcdir}/kairosdb.service ${pkgdir}/usr/lib/systemd/system/kairosdb.service
  install -Dm644 ${srcdir}/kairosdb/bin/kairosdb.sh ${pkgdir}/opt/kairosdb/bin/kairosdb
  chmod +x ${pkgdir}/opt/kairosdb/bin/kairosdb
}

# vim:set ts=2 sw=2 et:
