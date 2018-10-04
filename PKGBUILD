# Maintainer: Amina Khakimova <hakami1024@gmail.com>
# Maintainer: Marcel Campello Ferreira <marcel.campello.ferreira@gmail.com>
pkgname=neo4j-community
pkgver=3.4.8
pkgrel=1
pkgdesc='A fully transactional graph database implemented in Java'
arch=(any)
url=http://neo4j.org/
license=(custom)
makedepends=(patch)
depends=('java-runtime-headless>=8')
conflicts=(neo4j-enterprise)
backup=(etc/neo4j/neo4j.conf)
options=(!strip)
install=neo4j.install
source=(http://dist.neo4j.org/neo4j-community-$pkgver-unix.tar.gz
        bin.patch
        neo4j.conf
        neo4j.install
        neo4j.service
        neo4j-tmpfile.conf)
sha256sums=('5bf8f530e8e9584e2a3810d18e44c7f8ba956239e9a047094986fd5ebcc3bdd5'
            '163a1fad08a26c1367ea24a09e3231dab9aa0ed6b86b6421663cad622e2b680b'
            '8b58f52fc827a02eda8aa58fd40c3a19aab9f5ea0687f5eebc421ba49828713b'
            'f95936abc4a519b01d2cd987cd38a253003cf4cd39bfab29948708e82d98de66'
            'cf3148bd65ddc06f5ca8cf2ad37013d2e1aa561c5759e4b295f361465e603928'
            'e1311352e05b1e698599b91883141b938ceb418abd7e6bc11cc964854f0a21e1')            
prepare() {

  cd $srcdir/neo4j-community-$pkgver
  patch -Np1 -i ../bin.patch
}

package() {
  cd $srcdir/neo4j-community-$pkgver

  # Config files
  CONFIG_DIR=etc/neo4j
  install -dm755 $pkgdir/$CONFIG_DIR
  install -dm700 $pkgdir/$CONFIG_DIR/certificates
  install -Dm644 $srcdir/neo4j.conf $pkgdir/etc/neo4j/neo4j.conf

  # Data, import and log files
  DATA_DIR=var/lib/neo4j/data
  install -dm755 $pkgdir/$DATA_DIR
  [[ $(ls -A data/* 2>/dev/null) ]] && cp -r data/* $pkgdir/$DATA_DIR

  IMPORT_DIR=var/lib/neo4j/import
  install -dm755 $pkgdir/$IMPORT_DIR
  [[ $(ls -A import/* 2>/dev/null) ]] && cp -r import/* $pkgdir/$IMPORT_DIR

  LOG_DIR=var/log/neo4j
  install -dm755 $pkgdir/$LOG_DIR
  [[ $(ls -A logs/* 2>/dev/null) ]] && cp -r logs/* $pkgdir/$LOG_DIR

  # Copy JARs in lib and plugins
  LIB_DIR=usr/share/java/neo4j/lib
  install -dm755 $pkgdir/$LIB_DIR
  [[ $(ls -A lib/* 2>/dev/null) ]] && cp -r lib/* $pkgdir/$LIB_DIR

  PLUGINS_DIR=usr/share/java/neo4j/plugins
  install -dm755 $pkgdir/$PLUGINS_DIR
  [[ $(ls -A plugins/* 2>/dev/null) ]] && cp -r plugins/* $pkgdir/$PLUGINS_DIR

  # Executable files
  BIN_DIR=usr/share/neo4j/bin
  install -dm755 $pkgdir/$BIN_DIR
  [[ $(ls -A bin/* 2>/dev/null) ]] && cp -r bin/* $pkgdir/$BIN_DIR

  SYSTEM_BIN_DIR=usr/bin
  install -dm755 $pkgdir/$SYSTEM_BIN_DIR
  for file in $(find $pkgdir/$BIN_DIR -maxdepth 1 -type f); do
    b_file=$(basename $file)
    ln -s /$BIN_DIR/$b_file $pkgdir/$SYSTEM_BIN_DIR/$b_file;
  done

  # Documentation
  DOC_DIR=usr/share/doc/neo4j
  install -dm755 $pkgdir/$DOC_DIR
  cp README.txt UPGRADE.txt $pkgdir/$DOC_DIR

  # License files
  LICENSES_DIR=usr/share/licenses/neo4j
  install -dm755 $pkgdir/$LICENSES_DIR
  cp LICENSE.txt LICENSES.txt NOTICE.txt $pkgdir/$LICENSES_DIR

  # Service definition files
  install -Dm644 $srcdir/neo4j.service $pkgdir/usr/lib/systemd/system/neo4j.service

  # Runtime files
  install -Dm644 $srcdir/neo4j-tmpfile.conf $pkgdir/usr/lib/tmpfiles.d/neo4j.conf
}
