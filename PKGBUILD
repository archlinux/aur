# Maintainer:  <aaron.l.france@gmail.com>
pkgname=kairosdb
pkgver=0.9.6
pkgrel=1
pkgdesc="a fast distributed scalable time series database written on top of Cassandra."
arch=('i686' 'x86_64')
url="https://github.com/kairosdb/kairosdb"
license=('Apache')
depends=('cassandra')
makedepends=('deb2targz')
provides=('kairosdb')
source=('https://github.com/kairosdb/kairosdb/releases/download/v0.9.4/kairosdb_0.9.4-6_all.deb'
        'kairosdb.service'
        'kairosdb')
md5sums=('f0f656f58b0b3b0b9cb26d3c573b98fb'
         '3f957c6bfc4e1206dba09c049baa10a0'
         'ab930d18b8f13ee662a1f7d6380573a0')

build() {
  deb2targz $srcdir/kairosdb_0.9.4-6_all.deb > /dev/null 2>&1
  tar zxvf $srcdir/kairosdb_0.9.4-6_all.tar.gz > /dev/null 2>&1
}

package() {
  sed -i 's/\(kairosdb.service.datastore=org.kairosdb.datastore.h2.H2Module\)/#\1/g' \
    $srcdir/opt/kairosdb/conf/kairosdb.properties
  sed -i 's/#\(kairosdb.service.datastore=org.kairosdb.datastore.cassandra.CassandraModule\)/\1/g' \
    $srcdir/opt/kairosdb/conf/kairosdb.properties

  mv $srcdir/opt/ $pkgdir/opt/
  mkdir -p ${pkgdir}/{etc/kairosdb,var/log/kairosdb}

  install -Dm644 ${srcdir}/kairosdb.service ${pkgdir}/lib/systemd/system/kairosdb.service
  install -Dm644 ${srcdir}/kairosdb ${pkgdir}/usr/bin/kairosdb
  chmod +x ${pkgdir}/usr/bin/kairosdb
}

# vim:set ts=2 sw=2 et:
