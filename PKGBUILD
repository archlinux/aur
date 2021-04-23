# Maintainer: Vilar da Camara Neto <archlinux5435 at vilarneto dot com>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Troy Engel <troyengel+arch at gmail dot com>

pkgbase=holland
pkgname=('holland' 'holland-common' 'holland-lvm' 'holland-mysql' 
         'holland-mysqldump' 'holland-mysqllvm' 'holland-pgdump'
         'holland-xtrabackup' 'holland-mariabackup' 'holland-mongodump')
pkgver=1.2.5
pkgrel=1
arch=('any')
url="http://hollandbackup.org"
license=('BSD' 'GPL2')
options=('emptydirs')
makedepends=('python-setuptools' 'python-sphinx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/holland-backup/holland/archive/v${pkgver}.tar.gz"
        "${pkgbase}-backup.github.io-${pkgver}.tar.gz::https://github.com/holland-backup/holland-backup.github.com/archive/v${pkgver}.tar.gz"
        "holland.logrotate")
sha256sums=('b8fec6ae97c1d0c0769f36510cc460392f064327a81e8857e596d9984bb994da'
            'd40e255154a16b7c963ccbc0ceb198f963e99a92651e9ab68f22ca37ed2c5b64'
            '6b0240375e5cafe24a4e0c6fd078e42eaff4f5b2030f7fba4202d052d9a54995')

prepare() {
  cd "${srcdir}"
  find -name setup.cfg -delete
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pkgbase}-backup.github.io-${pkgver}"
  make man

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.common"
  python setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.lvm"
  python setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.mysql"
  python setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mysqldump"
  python setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mysql_lvm"
  python setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.pgdump"
  python setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.xtrabackup"
  python setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mariabackup"
  python setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mongodump"
  python setup.py build
}

package_holland() {
  pkgdesc="Pluggable backup framework focusing on databases"
  license=('BSD')
  depends=('python' 'python-setuptools' 'python-six' 'python-future' 'python-configobj' 'python-sphinx' 'python-pymysql')
  backup=('etc/holland/holland.conf'
          'etc/holland/backupsets/default.conf')

  local _py2sp=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

  install -dm0755 "${pkgdir}/etc/holland/backupsets"
  install -dm0755 "${pkgdir}/etc/holland/providers"
  install -dm0755 "${pkgdir}/var/spool/holland"
  install -dm0755 "${pkgdir}/var/log/holland"

  install -dm0755 "${pkgdir}${_py2sp}/holland/lib"
  install -dm0755 "${pkgdir}${_py2sp}/holland/backup"
  install -dm0755 "${pkgdir}${_py2sp}/holland/commands"
  install -dm0755 "${pkgdir}${_py2sp}/holland/restore"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --skip-build --root "${pkgdir}" \
    --install-scripts /usr/bin

  install -Dm0644 config/holland.conf "${pkgdir}/etc/holland/holland.conf"
  install -Dm0640 config/backupsets/default.conf \
    "${pkgdir}/etc/holland/backupsets/default.conf"
  install -Dm0644 plugins/README \
    "${pkgdir}/usr/share/doc/holland/README.plugins"
  install -Dm0644 config/providers/README \
    "${pkgdir}/usr/share/doc/holland/README.providers"
  install -Dm0644 INSTALL.md "${pkgdir}/usr/share/doc/holland/INSTALL"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/holland/README"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/holland/LICENSE"
  cp -a config/backupsets/examples "${pkgdir}/usr/share/doc/holland/examples"

  install -Dm0644 "${srcdir}/holland.logrotate" \
    "${pkgdir}/etc/logrotate.d/holland"

  cd "${srcdir}/${pkgbase}-backup.github.io-${pkgver}"
  install -Dm0644 _build/holland.1 "${pkgdir}/usr/share/man/man1/holland.1"
}

package_holland-common() {
  pkgdesc="Common library functionality for Holland Plugins"
  license=('GPL2')
  depends=("holland=${pkgver}")

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.common"
  python setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 plugins/holland.lib.common/README \
    "${pkgdir}/usr/share/doc/holland/README.common"
}

package_holland-lvm() {
  pkgdesc="LVM library functionality for Holland Plugins"
  license=('GPL2')
  depends=("holland-common=${pkgver}" 'lvm2')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.lvm"
  python setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 plugins/holland.lib.lvm/README \
    "${pkgdir}/usr/share/doc/holland/README.lvm"
}

package_holland-mysql() {
  pkgdesc="MySQL library functionality for Holland Plugins"
  license=('GPL2')
  depends=("holland-common=${pkgver}" 'python-mysqlclient')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.mysql"
  python setup.py install -O1 --skip-build --root "${pkgdir}"
}

package_holland-mysqldump() {
  pkgdesc="Holland Backup Provider for MySQL mysqldump"
  license=('GPL2')
  depends=("holland-mysql=${pkgver}" 'mariadb-clients')
  backup=('etc/holland/providers/mysqldump.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mysqldump"
  python setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/mysqldump.conf \
    "${pkgdir}/etc/holland/providers/mysqldump.conf"
  install -Dm0644 plugins/holland.backup.mysqldump/README \
    "${pkgdir}/usr/share/doc/holland/README.mysqldump"
}

package_holland-mysqllvm() {
  pkgdesc="Holland Backup Provider for MySQL LVM snapshots"
  license=('GPL2')
  depends=("holland-mysql=${pkgver}" "holland-lvm=${pkgver}" 'tar')
  backup=('etc/holland/providers/mysql-lvm.conf'
          'etc/holland/providers/mysqldump-lvm.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mysql_lvm"
  python setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/mysql-lvm.conf \
    "${pkgdir}/etc/holland/providers/mysql-lvm.conf"
  install -Dm0644 config/providers/mysqldump-lvm.conf \
    "${pkgdir}/etc/holland/providers/mysqldump-lvm.conf"
  install -Dm0644 plugins/holland.backup.mysql_lvm/README \
    "${pkgdir}/usr/share/doc/holland/README.mysql_lvm"
}

package_holland-pgdump() {
  pkgdesc="Holland Backup Provider for PostgreSQL pg_dump"
  license=('GPL2')
  depends=("holland-common=${pkgver}" 'python-psycopg2' 'postgresql-libs')
  backup=('etc/holland/providers/pgdump.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.pgdump"
  python setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/pgdump.conf \
    "${pkgdir}/etc/holland/providers/pgdump.conf"
  install -Dm0644 plugins/holland.backup.pgdump/README \
    "${pkgdir}/usr/share/doc/holland/README.pgdump"
}

package_holland-xtrabackup() {
  pkgdesc="Holland Backup Provider for MySQL Xtrabackup"
  license=('GPL2')
  depends=("holland-mysql=${pkgver}" 'xtrabackup')
  backup=('etc/holland/providers/xtrabackup.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.xtrabackup"
  python setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/xtrabackup.conf \
    "${pkgdir}/etc/holland/providers/xtrabackup.conf"
  install -Dm0644 plugins/holland.backup.xtrabackup/README \
    "${pkgdir}/usr/share/doc/holland/README.xtrabackup"
}

package_holland-mariabackup() {
  pkgdesc="Holland Backup Provider for MariaDB mariabackup"
  license=('GPL2')
  depends=("holland-mysql=${pkgver}" 'mariadb')
  backup=('etc/holland/providers/mariabackup.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mariabackup"
  python setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/mariabackup.conf \
    "${pkgdir}/etc/holland/providers/mariabackup.conf"
  install -Dm0644 plugins/holland.backup.mariabackup/README \
    "${pkgdir}/usr/share/doc/holland/README.mariabackup"
}

package_holland-mongodump() {
  pkgdesc="Holland Backup Provider for MongoDB mongodump"
  license=('GPL2')
  depends=("holland-common=${pkgver}" 'python-pymongo' 'mongodb-tools')
  backup=('etc/holland/providers/mongodump.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mongodump"
  python setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/mongodump.conf \
    "${pkgdir}/etc/holland/providers/mongodump.conf"
  install -Dm0644 plugins/holland.backup.mongodump/README \
    "${pkgdir}/usr/share/doc/holland/README.mongodump"
}

