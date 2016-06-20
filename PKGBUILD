# Maintainer: Marcel Campello Ferreira <marcel.campello.ferreira@gmail.com>
pkgname=neo4j2-enterprise
pkgver=2.3.3
pkgrel=1
pkgdesc="A fully transactional graph database implemented in Java"
arch=(any)
url="http://neo4j.org/"
license=(GPL)
makedepends=(patch)
depends=(bash lsof java-runtime-headless)
conflicts=(neo4j2-community neo4j-community neo4j-enterprise)
backup=(etc/neo4j/neo4j-http-logging.xml
        etc/neo4j/neo4j-server.properties
        etc/neo4j/neo4j-wrapper.conf
        etc/neo4j/neo4j.properties)
options=(!strip)
install=neo4j.install
source=(http://dist.neo4j.org/neo4j-enterprise-$pkgver-unix.tar.gz
        bin.patch
        conf.patch
        neo4j.install
        neo4j.service
        neo4j-arbiter.service
        neo4j-tmpfile.conf)
sha256sums=('864b7ebef3a12844c809e75016aa951c60ac90fb0d075a595108824859ce7875'
            'f279a235b283d3cde494cc76f9fc8db638dd789a825bc1b90cf410018cd055ee'
            'aaff5326a79d3ba4c9efe81f12d891f630e56f4a52a070ef0fec486789090866'
            '3c4f3daea1623a5bc4c56d87ff4d76ff4737722eb730e2f9b65a0980bf3633a3'
            'ee451a5b4ac3f733ab725bb3babeefc4d852115fe24ee29a3060922716212ad7'
            'eb4869d80e51f43f3846c84544202cdb20f668d46df130123efed46d090b40bb'
            'e9ecbf86072ca92129ab1889b5f91e2494b86e84248bd15a37681a3997892d7d')

prepare() {

  cd $srcdir/neo4j-enterprise-$pkgver

  rm bin/neo4j-installer
  rm -rf bin/Neo4j-Management
  rm -rf system/resources

  # Adjust configuration to match new directory structure
  patch -Np1 -i ../conf.patch
  patch -Np1 -i ../bin.patch
}

package() {

  NEO4J_HOME=usr/share/java/neo4j
  NEO4J_SHARE=usr/share/neo4j
  NEO4J_CONFIG=etc/neo4j
  NEO4J_INSTANCE=var/lib/neo4j
  NEO4J_LOG=var/log/neo4j
  NEO4J_RUNDIR=run/neo4j
  NEO4J_PIDFILE=${NEO4J_RUNDIR}/neo4j-service.pid

  cd $srcdir/neo4j-enterprise-$pkgver

  # Config files
  install -dm755 $pkgdir/$NEO4J_CONFIG
  cp -r conf/* $pkgdir/$NEO4J_CONFIG

  # Copy JARs in lib, system and plugins
  install -dm755 $pkgdir/$NEO4J_HOME
  cp -r lib/* $pkgdir/$NEO4J_HOME

  install -dm755 $pkgdir/$NEO4J_HOME/system
  cp -r system/* $pkgdir/$NEO4J_HOME/system
  
  install -dm755 $pkgdir/$NEO4J_HOME/plugins
  cp -r plugins/* $pkgdir/$NEO4J_HOME/plugins

  # Executable files
  install -dm755 $pkgdir/$NEO4J_SHARE/bin
  cp -r bin/* $pkgdir/$NEO4J_SHARE/bin

  install -dm755 $pkgdir/usr/bin
  ln -s /$NEO4J_SHARE/bin/neo4j $pkgdir/usr/bin/neo4j
  ln -s /$NEO4J_SHARE/bin/neo4j-import $pkgdir/usr/bin/neo4j-import
  ln -s /$NEO4J_SHARE/bin/neo4j-shell $pkgdir/usr/bin/neo4j-shell

  # Data and log files
  install -dm755 $pkgdir/$NEO4J_LOG
  cp -r data/log/* $pkgdir/$NEO4J_LOG
  
  install -dm755 $pkgdir/$NEO4J_INSTANCE/data
  rm -rf data/log
  cp -r data/* $pkgdir/$NEO4J_INSTANCE/data

  # Documentation
  install -dm755 $pkgdir/usr/share/doc/neo4j
  cp CHANGES.txt README.txt UPGRADE.txt $pkgdir/usr/share/doc/neo4j

  # License files
  install -dm755 $pkgdir/usr/share/licenses/neo4j
  cp LICENSE.txt LICENSES.txt NOTICE.txt $pkgdir/usr/share/licenses/neo4j

  # Service definition files
  cd $srcdir
  install -Dm644 neo4j.service $pkgdir/usr/lib/systemd/system/neo4j.service
  install -Dm633 neo4j-arbiter.service $pkgdir/usr/lib/systemd/system/neo4j-arbiter.service

  # Runtime files
  install -Dm644 neo4j-tmpfile.conf $pkgdir/usr/lib/tmpfiles.d/neo4j.conf
}
