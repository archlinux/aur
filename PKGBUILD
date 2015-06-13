# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgbase=holland
pkgname=('holland' 'holland-common' 'holland-mysqldump' 'holland-mysqllvm'
         'holland-pgdump' 'holland-xtrabackup')
pkgver=1.0.10
pkgrel=5
changelog=holland.archlog
arch=('any')
url="http://hollandbackup.org"
license=('BSD' 'GPL2')
options=('emptydirs')
makedepends=('python2-setuptools')
source=("http://hollandbackup.org/releases/stable/1.0/${pkgbase}-${pkgver}.tar.gz"
        "holland.logrotate"
        "holland-1.0.10-cursor.patch")
md5sums=('3435350d5c9dd57102e8b0470cd636c0'
         '5b2d292dc7e1139fde8ab9439b0464ee'
         '765146149bd193c1deb57675695d4680')

prepare() {
  cd "${srcdir}"
  find -name setup.cfg -delete
  patch -p0 < holland-1.0.10-cursor.patch
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py build
  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.common"
  python2 setup.py build
  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.mysql"
  python2 setup.py build
  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.lvm"
  python2 setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mysqldump"
  python2 setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mysql_lvm"
  python2 setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.pgdump"
  python2 setup.py build

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.xtrabackup"
  python2 setup.py build
}

package_holland() {
  pkgdesc="Pluggable backup framework focusing on databases"
  license=('BSD')
  depends=('python2' 'python2-setuptools')
  backup=('etc/holland/holland.conf'
          'etc/holland/backupsets/default.conf')
  
  local _py2sp=$(python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

  install -dm0755 "${pkgdir}/etc/holland/backupsets"
  install -dm0755 "${pkgdir}/etc/holland/providers"
  install -dm0755 "${pkgdir}/var/spool/holland"
  install -dm0755 "${pkgdir}/var/log/holland"

  install -dm0755 "${pkgdir}${_py2sp}/holland/lib"
  install -dm0755 "${pkgdir}${_py2sp}/holland/backup"
  install -dm0755 "${pkgdir}${_py2sp}/holland/commands"
  install -dm0755 "${pkgdir}${_py2sp}/holland/restore"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}" \
    --install-scripts /usr/bin

  install -Dm0644 config/holland.conf "${pkgdir}/etc/holland/holland.conf"
  install -Dm0640 config/backupsets/default.conf \
    "${pkgdir}/etc/holland/backupsets/default.conf"
  install -Dm0644 docs/man/holland.1 "${pkgdir}/usr/share/man/man1/holland.1"
  install -Dm0644 plugins/README \
    "${pkgdir}/usr/share/doc/holland/README.plugins"
  install -Dm0644 config/providers/README \
    "${pkgdir}/usr/share/doc/holland/README.providers"
  install -Dm0644 CHANGES.txt "${pkgdir}/usr/share/doc/holland/CHANGES.txt"
  install -Dm0644 INSTALL "${pkgdir}/usr/share/doc/holland/INSTALL"
  install -Dm0644 README "${pkgdir}/usr/share/doc/holland/README"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/holland/LICENSE"
  cp -a config/backupsets/examples "${pkgdir}/usr/share/doc/holland/examples"

  install -Dm0644 "${srcdir}/holland.logrotate" "${pkgdir}/etc/logrotate.d/holland"
}

package_holland-common() {
  pkgdesc="Common library functionality for Holland Plugins"
  license=('GPL2')
  depends=("holland=${pkgver}" 'mysql-python')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.common"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}"
  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.mysql"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 plugins/holland.lib.common/README \
    "${pkgdir}/usr/share/doc/holland/README.common"
}

package_holland-mysqldump() {
  pkgdesc="Logical mysqldump backup plugin for Holland"
  license=('GPL2')
  depends=("holland-common=${pkgver}" 'mariadb-clients' 'mysql-python')
  backup=('etc/holland/providers/mysqldump.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mysqldump"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/mysqldump.conf \
    "${pkgdir}/etc/holland/providers/mysqldump.conf"
  install -Dm0644 plugins/holland.backup.mysqldump/README \
    "${pkgdir}/usr/share/doc/holland/README.mysqldump"
}

package_holland-mysqllvm() {
  pkgdesc="Holland LVM snapshot backup plugin for MySQL"
  license=('GPL2')
  depends=("holland-common=${pkgver}" 'lvm2' 'tar' 'mysql-python')
  backup=('etc/holland/providers/mysql-lvm.conf'
          'etc/holland/providers/mysqldump-lvm.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.lib.lvm"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}"
  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.mysql_lvm"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/mysql-lvm.conf \
    "${pkgdir}/etc/holland/providers/mysql-lvm.conf"
  install -Dm0644 config/providers/mysqldump-lvm.conf \
    "${pkgdir}/etc/holland/providers/mysqldump-lvm.conf"
  install -Dm0644 plugins/holland.backup.mysql_lvm/README \
    "${pkgdir}/usr/share/doc/holland/README.mysql_lvm"
}

package_holland-pgdump() {
  pkgdesc="Holland Backup Provider for PostgreSQL"
  license=('GPL2')
  depends=("holland-common=${pkgver}" 'python2-psycopg2')
  backup=('etc/holland/providers/pgdump.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.pgdump"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/pgdump.conf \
    "${pkgdir}/etc/holland/providers/pgdump.conf"
  install -Dm0644 plugins/holland.backup.pgdump/README \
    "${pkgdir}/usr/share/doc/holland/README.pgdump"
}

package_holland-xtrabackup() {
  pkgdesc="Xtrabackup plugin for Holland"
  license=('GPL2')
  depends=("holland-common=${pkgver}" 'xtrabackup')
  backup=('etc/holland/providers/xtrabackup.conf')

  cd "${srcdir}/${pkgbase}-${pkgver}/plugins/holland.backup.xtrabackup"
  python2 setup.py install -O1 --skip-build --root "${pkgdir}"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm0644 config/providers/xtrabackup.conf \
    "${pkgdir}/etc/holland/providers/xtrabackup.conf"
  install -Dm0644 plugins/holland.backup.xtrabackup/README \
    "${pkgdir}/usr/share/doc/holland/README.xtrabackup"
}

