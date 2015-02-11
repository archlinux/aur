# Maintainer: Marcel Campello Ferreira <marcel@prafrentex.com.br>
pkgname=neo4j
pkgver=2.1.6
pkgrel=1
pkgdesc="A fully transactional graph database implemented in Java"
arch=(any)
url="http://neo4j.org/"
license=(GPL)
makedepends=(patch)
depends=(bash lsof java-runtime-headless)
backup=(etc/neo4j/custom-logback.xml
        etc/neo4j/logging.properties
        etc/neo4j/neo4j-http-logging.xml
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
sha256sums=('c7154f133206d30c05e6e680d182c9f04360a256029fe26b812b0edaa6e0ec1f'
            'e52e0f353ce80e09fe74662e77223f5ff35a36f874653795ad173aa8a6bd5525'
            '63426ed3ee522c2ce5f1505b15502742187156c9f09b3b1e8b2eff2379fa2a89'
            '23f69e7624323a5670e2ba537e7b858413c0e57190157b04a96f6b556cab4092'
            'ee451a5b4ac3f733ab725bb3babeefc4d852115fe24ee29a3060922716212ad7'
            'e9ecbf86072ca92129ab1889b5f91e2494b86e84248bd15a37681a3997892d7d')

prepare() {

  cd $srcdir/neo4j-community-$pkgver

  rm conf/windows-wrapper-logging.properties
  rm bin/neo4j-installer
  rm bin/org.neo4j.server.plist

  # Adjust configuration to match new directory structure
  patch -Np1 -i ../conf.patch
  patch -Np1 -i ../bin.patch
}

package() {

  cd $srcdir/neo4j-community-$pkgver

  # Config files
  install -dm755 $pkgdir/etc/neo4j
  cp -r conf/* $pkgdir/etc/neo4j

  # Copy JARs in lib, system and plugins
  install -dm755 $pkgdir/usr/share/java/neo4j
  cp -r lib/* $pkgdir/usr/share/java/neo4j
  install -dm755 $pkgdir/usr/share/java/neo4j/system
  cp -r system/* $pkgdir/usr/share/java/neo4j/system
  install -dm755 $pkgdir/usr/share/java/neo4j/plugins
  cp -r plugins/* $pkgdir/usr/share/java/neo4j/plugins

  # Executable files
  install -dm755 $pkgdir/usr/share/neo4j/bin
  cp -r bin/* $pkgdir/usr/share/neo4j/bin

  install -dm755 $pkgdir/usr/bin
  ln -s /usr/share/neo4j/bin/neo4j $pkgdir/usr/bin/neo4j
  ln -s /usr/share/neo4j/bin/neo4j-shell $pkgdir/usr/bin/neo4j-shell

  # Data and log files
  install -dm755 $pkgdir/var/lib/neo4j/data
  install -dm755 $pkgdir/var/log/neo4j

  # License files
  install -dm755 $pkgdir/usr/share/licenses/neo4j
  cp LICENSE.txt LICENSES.txt NOTICE.txt $pkgdir/usr/share/licenses/neo4j

  # Service definition files
  cd $srcdir
  install -Dm644 neo4j.service $pkgdir/usr/lib/systemd/system/neo4j.service

  # Runtime files
  install -Dm644 neo4j-tmpfile.conf $pkgdir/usr/lib/tmpfiles.d/neo4j.conf
}
