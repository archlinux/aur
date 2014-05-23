# Maintainer: Marcel Campello Ferreira <tucho.tijucano@gmail.com>
pkgname=neo4j
pkgver=2.0.3
pkgrel=2
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
sha256sums=(f7698c0f479bdffc8713d299314a322305cfa094859a88a99b50e8cf3df099e9
            870d0fe93a07053df8edcee32c5638414336116a2a26531fa689e849032fdf9e
            47f7648c0d609d363ae8e4ad5317a7f37f7625c4ac05a356d2d41a9bfbde495a
            b86e71e80ad7c2e10a095dfd42296c117ffafa10ee1cc923e1072f6d64ac9dfa
            9b6438b75b88a89e89751996942c453fb60c6e8b0bd5aa432bbefddc753362d8
            e9ecbf86072ca92129ab1889b5f91e2494b86e84248bd15a37681a3997892d7d)

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
