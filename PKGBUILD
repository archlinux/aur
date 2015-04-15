# Maintainer: Marcel Campello Ferreira <marcel@prafrentex.com.br>
pkgname=neo4j
pkgver=2.2.1
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
sha256sums=('a5116c47a2fb2a209ba6a381e57b580fe6e912e8835edb32dbf66d9b16b3d367'
            'd161c1b0397843a78c16cf06f3087ca52f01efb300749874d52013fde87d26f8'
            'bb9ea8ae8a684e9981a24ca7bb242a4c2aaa8fdacb820abf8da7f56f413d1e5f'
            '3c4f3daea1623a5bc4c56d87ff4d76ff4737722eb730e2f9b65a0980bf3633a3'
            'ee451a5b4ac3f733ab725bb3babeefc4d852115fe24ee29a3060922716212ad7'
            'e9ecbf86072ca92129ab1889b5f91e2494b86e84248bd15a37681a3997892d7d')

prepare() {

  cd $srcdir/neo4j-community-$pkgver

  rm conf/windows-wrapper-logging.properties
  rm bin/neo4j-installer
  rm -rf system/resources

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
  ln -s /usr/share/neo4j/bin/neo4j-import $pkgdir/usr/bin/neo4j-import

  # Data and log files
  install -dm755 $pkgdir/var/lib/neo4j/data
  install -dm755 $pkgdir/var/log/neo4j

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
