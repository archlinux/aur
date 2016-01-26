# Maintainer: Marcel Campello Ferreira <marcel.campello.ferreira@gmail.com>
pkgname=neo4j-community
pkgver=2.3.2
pkgrel=1
pkgdesc="A fully transactional graph database implemented in Java"
arch=(any)
url="http://neo4j.org/"
license=(GPL)
makedepends=(patch)
depends=(bash lsof java-runtime-headless)
conflicts=(neo4j-enterprise)
backup=(etc/neo4j/neo4j-http-logging.xml
        etc/neo4j/neo4j-server.properties
        etc/neo4j/neo4j-wrapper.conf
        etc/neo4j/neo4j.properties)
options=(!strip)
install=neo4j.install
source=(http://dist.neo4j.org/neo4j-community-$pkgver-unix.tar.gz
        bin.patch
        conf.patch
        neo4j.install
        neo4j.service
        neo4j-tmpfile.conf)
sha256sums=('37e24d95c914c54d5cbbe99473d4beef89da78adb2db04eb87258a489225932a'
            '57d2b4e76b468c2eb4e5ee0c6dfa79e044342cff3eb8841a42fe21305068c401'
            '7df8e1228fcb1aa48634a44d979d7e0a73b329528ade917c8b42b6f95a1b0f1b'
            '3c4f3daea1623a5bc4c56d87ff4d76ff4737722eb730e2f9b65a0980bf3633a3'
            'ee451a5b4ac3f733ab725bb3babeefc4d852115fe24ee29a3060922716212ad7'
            'e9ecbf86072ca92129ab1889b5f91e2494b86e84248bd15a37681a3997892d7d')

prepare() {

  cd $srcdir/neo4j-community-$pkgver

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

  cd $srcdir/neo4j-community-$pkgver

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

  # Runtime files
  install -Dm644 neo4j-tmpfile.conf $pkgdir/usr/lib/tmpfiles.d/neo4j.conf
}
