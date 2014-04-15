# Maintainer: Marcel Campello Ferreira <tucho.tijucano@gmail.com>
pkgname=neo4j
pkgver=2.0.2
pkgrel=1
pkgdesc="A fully transactional graph database implemented in Java"
arch=(any)
url="http://neo4j.org/"
license=(GPL)
depends=(bash lsof java-runtime)
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
sha256sums=(e137fd4f259c584f4e3ec6ed446031d80e6099874a0b5dec9440bfbb81fdd5c0
            870d0fe93a07053df8edcee32c5638414336116a2a26531fa689e849032fdf9e
            47f7648c0d609d363ae8e4ad5317a7f37f7625c4ac05a356d2d41a9bfbde495a
            7cec057ea41df6333389ef5d9654fa7769ea141dbe5da5bf1b526c6de292e22f
            27e044354f10cb4c844b827442850326d900bc40e01443dbc0cd446bd057af27
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
  
  # Documentation files
  install -dm 755 $pkgdir/usr/share/doc/neo4j
  cp -r doc/* $pkgdir/usr/share/doc/neo4j
  
  # License files
  install -dm755 $pkgdir/usr/share/licenses/neo4j
  cp LICENSE.txt LICENSES.txt NOTICE.txt $pkgdir/usr/share/licenses/neo4j
  
  # Service definition files
  cd $srcdir
  install -Dm644 neo4j.service $pkgdir/usr/lib/systemd/system/neo4j.service
  
  # Runtime files
  install -Dm644 neo4j-tmpfile.conf $pkgdir/usr/lib/tmpfiles.d/neo4j.conf
}
