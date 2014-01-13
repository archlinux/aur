# Maintainer: Marcel Campello Ferreira <tucho.tijucano@gmail.com>
pkgname=neo4j
pkgver=2.0.0
pkgrel=2
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
sha256sums=(44a7160ead5cf70a385cceed30f7e999e29047b39ca92ac346bd230e2767f2ff
	    3b7dfe7448e82a7be4dfa31d1d30aa3921a483c6a33926800664af3bef25e3d2
	    d230ccb4d2ddd7bc504d729c50170c39acc8f16815168f99b82f4d7fdd07b094
	    6af4ac963343f8d88c2a10361391eea113737a2383eed3fbba26c89e548d4d66
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
