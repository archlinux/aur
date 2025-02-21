# Maintainer: Denes Turei <turei.denes@gmail.com>
# Contributor: Amina Khakimova <hakami1024@gmail.com>
# Contributor: Marcel Campello Ferreira <marcel.campello.ferreira@gmail.com>
pkgname=neo4j-enterprise
pkgver=5.26.2
pkgrel=1
pkgdesc='A fully transactional graph database implemented in Java'
arch=(any)
url=https://neo4j.com/
license=(custom)
makedepends=(patch)
depends=('jre21-openjdk-headless')
conflicts=(neo4j-community)
backup=(etc/neo4j/neo4j.conf)
options=(!strip)
install=neo4j.install
source=(http://dist.neo4j.org/neo4j-enterprise-$pkgver-unix.tar.gz
        startup-scripts-fix-paths.patch
        neo4j.conf
        neo4j.install
        neo4j.service
        neo4j-tmpfile.conf)

sha256sums=('6d478c1e3f1cc2a8d29ebcec4e4793831d5174cb7d81c8461a329e7df70cda1a'
            'ba057fa99e9649e77e3dcdf97f28dcf9484c3af0b2136dd520dd2a4908728a87'
            '12ba8a4bfb3af738535d481c93d190790bc59647228b254225c3aede92e85434'
            '8cdf6de9864f66b8f435b8da5c04245a7fa23dde986cc7aec3133261e4003c64'
            'e2c465a8ffb0cb81bf338cc458fbc916bd958fe11bd272823b5cfe423d42b6c5'
            'e1311352e05b1e698599b91883141b938ceb418abd7e6bc11cc964854f0a21e1')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch --forward --strip=1 --input=../startup-scripts-fix-paths.patch
}

package() {
  cd $srcdir/$pkgname-$pkgver

  # Config files
  CONFIG_DIR=etc/neo4j
  install -dm755 $pkgdir/$CONFIG_DIR
  [[ $(ls -A conf/* 2>/dev/null) ]] && cp -r data/* $pkgdir/$CONFIG_DIR
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
  LIB_DIR=usr/share/java/neo4j
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
  LICENSE_STATUS_DIR=$pkgdir/usr/share/java/neo4j/licenses
  mkdir -p $LICENSE_STATUS_DIR
  echo -n "yes" > $LICENSE_STATUS_DIR/ACCEPT_LICENSE_AGREEMENT

  # Service definition files
  install -Dm644 $srcdir/neo4j.service $pkgdir/usr/lib/systemd/system/neo4j.service

  # Runtime files
  install -Dm644 $srcdir/neo4j-tmpfile.conf $pkgdir/usr/lib/tmpfiles.d/neo4j.conf
}
