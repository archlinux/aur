# Maintainer: Denes Turei <turei.denes@gmail.com>
# Contributor: Amina Khakimova <hakami1024@gmail.com>
# Contributor: Marcel Campello Ferreira <marcel.campello.ferreira@gmail.com>
pkgname=neo4j-enterprise
pkgver=5.12.0
pkgrel=1
pkgdesc='A fully transactional graph database implemented in Java'
arch=(any)
url=http://neo4j.org/
license=(custom)
makedepends=(patch)
depends=('jre17-openjdk-headless')
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

sha256sums=('282c8601cbcc04fc49dfefec305c1f3d824ba2cd16ea3d30721051bfcea05239'
            '421dc29e493850104fa8909bd1e9ca8b5588193090f9c61f0608e432d64f1a79'
            '5d5b0a2137dd093b1e18b264b4a54b9d1f84029100ef6a513361d71d1ddeb8f6'
            '8cdf6de9864f66b8f435b8da5c04245a7fa23dde986cc7aec3133261e4003c64'
            '42d4fa137d2a0eb1541780a4afef1bdaebf6c6e593cf7f285b527ea0e07bdf74'
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
