# Maintainer:  khvalera <khvalera[at]ukr[dot]net>
# Contributor: Matthias Fulz <mfulz@olznet.net>
# Contributor: Michael Spradling <mike@mspradling.com>

pkgbase='bareos'

pkgname=("bareos-common"
         "bareos-bconsole"
         "bareos-database-common"
         "bareos-database-mysql"
         "bareos-database-postgresql"
         "bareos-database-sqlite3"
         "bareos-database-tools"
         "bareos-devel"
         "bareos-director"
         "bareos-storage-fifo"
         "bareos-tools"
         "bareos-filedaemon"
         "bareos-storage"
         "bareos-storage-tape"
         "bareos-webui"
         "bareos-director-python-plugins-common"
         "bareos-filedaemon-python-plugins-common"
         "bareos-storage-python-plugins-common"
         "bareos-director-python2-plugin"
         "bareos-director-python3-plugin"
         "bareos-filedaemon-python2-plugin"
         "bareos-filedaemon-python3-plugin"
         "bareos-storage-python2-plugin"
         "bareos-storage-python3-plugin"
         "bareos-filedaemon-ldap-python-plugin"
         "bareos-traymonitor"
         )

pkgver=20.0.1
pkgmajor=${pkgver%%.*}
pkgrel=3
arch=(i686 x86_64 armv7h aarch64)
groups=('bareos')
pkgdesc="Bareos - Backup Archiving REcovery Open Sourced"
url="http://www.bareos.org"
license=('AGPL3')
makedepends=('libmariadbclient' 'postgresql-libs' 'sqlite3' 'python2' 'python' 'cmake' 'rpcsvc-proto' 'git' 'lsb-release' 'qt5-base')
source=("git+https://github.com/bareos/bareos.git#tag=Release/${pkgver}"
        "fix-build-bareos.patch"
        "fix-headlink.patch"
        "mysql.patch"
        "PoolModel.patch"
        "bootstrap-table-locale-all.min.js")
md5sums=('SKIP'
         '018310ec5860e8b78b1855cc21c7b963'
         'b26fd1ffccc2b54f3f898d6d896e8929'
         '926d71d75bb40c2023583c33712f6e2b'
         'e35a03f09797b00c098ecb829f1ad5f8'
         'e78b88f897cfc3e60129eec360521e3d')
python3_ver="3.10"

#=========================================
prepare() {
  cd bareos
  # fix: в форме востановления нельзя выбрать задание на восстановление
  #patch --forward --strip=1 --input="../../restore-form.patch"
  patch --forward --strip=1 --input="../fix-build-bareos.patch"
  patch --forward --strip=1 --input="../fix-headlink.patch"
  patch --forward --strip=1 --input="../mysql.patch"
  patch --forward --strip=1 --input="../PoolModel.patch"
}

#=========================================
build() {
  cd bareos
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/ \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/bareos \
    -Dlibdir=/usr/lib/bareos \
    -Dconio=no \
    -Ddynamic-cats-backends=yes \
    -Ddynamic-storage-backends=yes \
    -Drpath=no \
    -Dpostgresql=yes \
    -Dmysql=yes \
    -Dpython=yes \
    -Dopenssl=yes \
    -Dsqlite3=yes \
    -Dlogdir=/var/log/bareos \
    -Ddir-user=bareos \
    -Ddir-group=bareos \
    -Dsd-user=bareos \
    -Dsd-group=bareos \
    -Dfd-user=root \
    -Dfd-group=root \
    -Dpiddir=/run/bareos \
    -Dsubsysdir=/run/bareos \
    -Dconfdir=/etc/bareos \
    -Dconfigtemplatedir=/usr/share/bareos/config \
    -Dworkingdir=/var/lib/bareos \
    -Dplugindir=/usr/lib/bareos/plugins \
    -Dscriptdir=/usr/lib/bareos/scripts \
    -Dbackenddir=/usr/lib/bareos/backends \
    -Darchivedir=/var/lib/bareos/storage \
    -Dbsrdir=/var/lib/bareos \
    -Dsystemd=yes \
    -Dtraymonitor=yes

  make DESTDIR="${srcdir}/install" install
}

#=========================================
_cp() {
  mkdir -p "$(dirname $2)"
  cp -a "$1" "$(dirname $2)"
}

#=========================================
package_bareos-common() {
  pkgdesc="${pkgdesc} - Common files"
  depends=('libcap' 'openssl' 'acl' 'bash' 'lzo' 'jansson' 'zlib')
  install=bareos-common.install

  for f in \
      usr/lib/bareos/libbareos.so.$pkgver \
      usr/lib/bareos/libbareos.so.$pkgmajor \
      usr/lib/bareos/libbareos.so \
      usr/lib/bareos/libbareosfind.so.$pkgver \
      usr/lib/bareos/libbareosfind.so.$pkgmajor \
      usr/lib/bareos/libbareosfind.so \
      usr/lib/bareos/libbareoslmdb.so.$pkgver \
      usr/lib/bareos/libbareoslmdb.so.$pkgmajor \
      usr/lib/bareos/libbareoslmdb.so \
      usr/lib/bareos/libbareosndmp.so.$pkgver \
      usr/lib/bareos/libbareosndmp.so.$pkgmajor \
      usr/lib/bareos/libbareosndmp.so \
      usr/lib/bareos/libbareosfastlz.so \
      usr/lib/bareos/libbareosfastlz.so.$pkgver \
      usr/lib/bareos/libbareosfastlz.so.$pkgmajor \
      usr/lib/bareos/scripts/bareos-config \
      usr/lib/bareos/scripts/bareos-config-lib.sh \
      usr/lib/bareos/scripts/btraceback.gdb \
      usr/bin/bsmtp \
      usr/bin/btraceback \
      usr/share/man/man1/bsmtp.1 \
      usr/share/man/man8/btraceback.8 \
  ; do
    _cp $srcdir/install/$f $pkgdir/$f
  done
  install -d -m750 ${pkgdir}/var/lib/bareos
  install -d -m750 ${pkgdir}/etc/bareos
  install -d -m750 ${pkgdir}/run/bareos
  install -d -m750 ${pkgdir}/var/log/bareos
}

#=========================================
package_bareos-bconsole() {
  pkgdesc="${pkgdesc} - Admin Tool (CLI)"
  depends=("bareos-common=${pkgver}" 'readline' 'jansson')
  groups+=("bareos-client")
  install=bareos-bconsole.install
  backup=("etc/bareos/bconsole.conf")

  install -d -m750 ${pkgdir}/etc/bareos
  install -m640 "${srcdir}/install/usr/share/bareos/config/bconsole.conf" \
          "${pkgdir}/etc/bareos/bconsole.conf"

  for f in \
    usr/bin/bconsole \
    usr/share/man/man1/bconsole.1 \
    usr/share/bareos/config/bconsole.conf \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-database-common() {
  pkgdesc="${pkgdesc} - Generic abstration libs and tools for sql catalog"
  depends=("bareos-common=${pkgver}" 'libcap' 'lzo' 'zlib' 'openssl' 'bash' 'jansson')

  for f in \
    usr/lib/bareos/libbareoscats.so.${pkgver} \
    usr/lib/bareos/libbareoscats.so.${pkgmajor} \
    usr/lib/bareos/libbareoscats.so \
    usr/lib/bareos/libbareossql.so.${pkgver} \
    usr/lib/bareos/libbareossql.so.${pkgmajor} \
    usr/lib/bareos/libbareossql.so \
    usr/lib/bareos/scripts/create_bareos_database \
    usr/lib/bareos/scripts/drop_bareos_database \
    usr/lib/bareos/scripts/drop_bareos_tables \
    usr/lib/bareos/scripts/grant_bareos_privileges \
    usr/lib/bareos/scripts/make_bareos_tables \
    usr/lib/bareos/scripts/update_bareos_tables \
    usr/lib/bareos/scripts/ddl/versions.map \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-database-mysql() {
  pkgdesc="${pkgdesc} - Libs and tools for mysql catalog"
  provides=("bareos-database=${pkgver}")
  depends=("bareos-database-common=${pkgver}" 'libmariadbclient')
  install=bareos-database-mysql.install

  for f in \
    usr/lib/bareos/backends/libbareoscats-mysql.so \
    usr/lib/bareos/scripts/ddl/drops/mysql.sql \
    usr/lib/bareos/scripts/ddl/grants/mysql.sql \
    usr/lib/bareos/scripts/ddl/grants/mysql-readonly.sql \
    usr/lib/bareos/scripts/ddl/creates/mysql.sql \
    usr/lib/bareos/scripts/ddl/updates/mysql.10_11.sql \
    usr/lib/bareos/scripts/ddl/updates/mysql.11_12.sql \
    usr/lib/bareos/scripts/ddl/updates/mysql.12_14.sql \
    usr/lib/bareos/scripts/ddl/updates/mysql.14_2001.sql \
    usr/lib/bareos/scripts/ddl/updates/mysql.2001_2002.sql \
    usr/lib/bareos/scripts/ddl/updates/mysql.2002_2003.sql \
    usr/lib/bareos/scripts/ddl/updates/mysql.2003_2004.sql \
    usr/lib/bareos/scripts/ddl/updates/mysql.2004_2171.sql \
    usr/lib/bareos/scripts/ddl/updates/mysql.2171_2192.sql \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-database-postgresql() {
  pkgdesc="${pkgdesc} - Libs and tools for postgresql catalog"
  provides=("bareos-database=${pkgver}")
  depends=("bareos-database-common=${pkgver}" "postgresql-libs")
  install=bareos-database-postgresql.install

  for f in \
    usr/lib/bareos/backends/libbareoscats-postgresql.so \
    usr/lib/bareos/scripts/ddl/drops/postgresql.sql \
    usr/lib/bareos/scripts/ddl/grants/postgresql-change_owner.dbconfig-template.sql \
    usr/lib/bareos/scripts/ddl/grants/postgresql-readonly.sql \
    usr/lib/bareos/scripts/ddl/grants/postgresql.sql \
    usr/lib/bareos/scripts/ddl/creates/postgresql.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.10_11.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.11_12.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.12_14.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.14_2001.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.2001_2002.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.2002_2003.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.2003_2004.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.2004_2171.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.2171_2192.sql \
    usr/lib/bareos/scripts/ddl/updates/postgresql.bee.1017_2004.sql \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-database-sqlite3() {
  pkgdesc="${pkgdesc} - Libs and tools for sqlite3 catalog"
  provides=("bareos-database=${pkgver}")
  depends=("bareos-database-common=${pkgver}" "sqlite3")

  for f in \
    usr/lib/bareos/backends/libbareoscats-sqlite3.so \
    usr/lib/bareos/scripts/ddl/creates/sqlite3.sql \
    usr/lib/bareos/scripts/ddl/updates/sqlite3.10_11.sql \
    usr/lib/bareos/scripts/ddl/updates/sqlite3.11_12.sql \
    usr/lib/bareos/scripts/ddl/updates/sqlite3.12_14.sql \
    usr/lib/bareos/scripts/ddl/updates/sqlite3.14_2001.sql \
    usr/lib/bareos/scripts/ddl/updates/sqlite3.2001_2002.sql \
    usr/lib/bareos/scripts/ddl/updates/sqlite3.2002_2003.sql \
    usr/lib/bareos/scripts/ddl/updates/sqlite3.2003_2004.sql \
    usr/lib/bareos/scripts/ddl/updates/sqlite3.2004_2171.sql \
    usr/lib/bareos/scripts/ddl/updates/sqlite3.2171_2192.sql \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-database-tools() {
  pkgdesc="${pkgdesc} - CLI tools with database dpendencies (dbcheck, bscan)"
  depends=("bareos-database-common=${pkgver}" 'openssl' 'jansson')

  for f in \
    usr/bin/bareos-dbcheck \
    usr/bin/bscan \
    usr/share/man/man8/bareos-dbcheck.8 \
    usr/share/man/man8/bscan.8 \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-devel() {
  pkgdesc="${pkgdesc} - Devel headers"
  arch=(any)
  # TODO
  install -d ${pkgdir}/usr/include/bareos
  install -m640 ${srcdir}/install/usr/include/bareos/* ${pkgdir}/usr/include/bareos
}

#=========================================
package_bareos-director() {
  pkgdesc="${pkgdesc} - Director daemon"
  depends=("bareos-common=${pkgver}" 'openssl' 'bash' 'jansson')
  install=bareos-director.install

  for f in \
    usr/lib/bareos/scripts/delete_catalog_backup \
    usr/lib/bareos/scripts/make_catalog_backup \
    usr/lib/bareos/scripts/make_catalog_backup.pl \
    usr/lib/bareos/scripts/query.sql \
    usr/share/bareos/config/bareos-dir.d/catalog/MyCatalog.conf \
    usr/share/bareos/config/bareos-dir.d/client/bareos-fd.conf \
    usr/share/bareos/config/bareos-dir.d/console/bareos-mon.conf \
    usr/share/bareos/config/bareos-dir.d/director/bareos-dir.conf \
    usr/share/bareos/config/bareos-dir.d/fileset/Catalog.conf \
    usr/share/bareos/config/bareos-dir.d/fileset/LinuxAll.conf \
    usr/share/bareos/config/bareos-dir.d/fileset/SelfTest.conf \
    usr/share/bareos/config/bareos-dir.d/fileset/Windows\ All\ Drives.conf \
    usr/share/bareos/config/bareos-dir.d/job/backup-bareos-fd.conf \
    usr/share/bareos/config/bareos-dir.d/job/BackupCatalog.conf \
    usr/share/bareos/config/bareos-dir.d/job/RestoreFiles.conf \
    usr/share/bareos/config/bareos-dir.d/jobdefs/DefaultJob.conf \
    usr/share/bareos/config/bareos-dir.d/messages/Daemon.conf \
    usr/share/bareos/config/bareos-dir.d/messages/Standard.conf \
    usr/share/bareos/config/bareos-dir.d/pool/Differential.conf \
    usr/share/bareos/config/bareos-dir.d/pool/Full.conf \
    usr/share/bareos/config/bareos-dir.d/pool/Incremental.conf \
    usr/share/bareos/config/bareos-dir.d/pool/Scratch.conf \
    usr/share/bareos/config/bareos-dir.d/profile/operator.conf \
    usr/share/bareos/config/bareos-dir.d/schedule/WeeklyCycleAfterBackup.conf \
    usr/share/bareos/config/bareos-dir.d/schedule/WeeklyCycle.conf \
    usr/share/bareos/config/bareos-dir.d/storage/File.conf \
    usr/bin/bareos-dir \
    usr/share/man/man8/bareos-dir.8 \
    usr/share/man/man8/bareos.8 \
    etc/logrotate.d/bareos-dir \
  ; do
    # pacman LINT tool currently does not like spaces
    space_removal=`echo $f | tr ' ' '_'`
    _cp "${srcdir}/install/$f" "${pkgdir}/${space_removal}"
  done

  # Currently upstream systemd file does not automatically create run directory
  sed -i '/\[Service\]/a RuntimeDirectory=bareos' ${srcdir}/bareos/core/platforms/systemd/bareos-dir.service
  _cp ${srcdir}/bareos/core/platforms/systemd/bareos-dir.service ${pkgdir}/usr/lib/systemd/system/bareos-dir.service
  _cp ${srcdir}/install/etc/logrotate.d ${pkgdir}/etc/logrotate.d
}

#=========================================
package_bareos-storage-fifo() {
  pkgdesc="${pkgdesc} - FIFO support for storage daemon"
  depends=("bareos-storage=${pkgver}" 'zlib' 'libcap' 'openssl' 'jansson' 'lzo')
  for f in \
    usr/lib/bareos/backends/libbareossd-fifo.so \
    usr/share/bareos/config/bareos-dir.d/storage/NULL.conf.example \
    usr/share/bareos/config/bareos-sd.d/device/NULL.conf.example \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-tools() {
  pkgdesc="${pkgdesc} - CLI tools (bcopy, bextract, bls, bregeq, bwild)"
  depends=("bareos-common=${pkgver}" 'glibc')

  for f in \
    usr/bin/bregex \
    usr/bin/bwild \
    usr/bin/bcopy \
    usr/bin/bextract \
    usr/bin/bls \
    usr/bin/bpluginfo \
    usr/share/man/man1/bwild.1 \
    usr/share/man/man1/bregex.1 \
    usr/share/man/man8/bcopy.8 \
    usr/share/man/man8/bextract.8 \
    usr/share/man/man8/bls.8 \
    usr/share/man/man8/bpluginfo.8 \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-filedaemon() {
  pkgdesc="${pkgdesc} - File daemon"
  depends=("bareos-common=${pkgver}" 'jansson' 'zlib' 'gcc-libs')
  groups+=('bareos-client')
  install=bareos-filedaemon.install

  for f in \
    usr/share/bareos/config/bareos-fd.d/client/myself.conf \
    usr/share/bareos/config/bareos-fd.d/director/bareos-dir.conf \
    usr/share/bareos/config/bareos-fd.d/director/bareos-mon.conf \
    usr/share/bareos/config/bareos-fd.d/messages/Standard.conf \
    usr/bin/bareos-fd \
    usr/lib/bareos/plugins/bpipe-fd.so \
    usr/share/man/man8/bareos-fd.8 \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done

  # Currently upstream systemd file does not automatically create run directory
  sed -i '/\[Service\]/a RuntimeDirectory=bareos' ${srcdir}/bareos/core/platforms/systemd/bareos-fd.service
  _cp ${srcdir}/bareos/core/platforms/systemd/bareos-fd.service ${pkgdir}/usr/lib/systemd/system/bareos-fd.service
}

#=========================================
package_bareos-storage() {
  pkgdesc="${pkgdesc} - Storage daemon"
  depends=("bareos-common=${pkgver}" 'zlib' 'lzo' 'jansson' 'openssl' 'libcap')
  install=bareos-storage.install

  for f in \
    usr/lib/bareos/plugins/autoxflate-sd.so \
    usr/lib/bareos/scripts/disk-changer \
    usr/share/bareos/config/bareos-sd.d/device/FileStorage.conf \
    usr/share/bareos/config/bareos-sd.d/director/bareos-dir.conf \
    usr/share/bareos/config/bareos-sd.d/director/bareos-mon.conf \
    usr/share/bareos/config/bareos-sd.d/messages/Standard.conf \
    usr/share/bareos/config/bareos-sd.d/storage/bareos-sd.conf \
    usr/bin/bareos-sd \
    usr/share/man/man8/bareos-sd.8 \
    usr/lib/bareos/libbareossd.so \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done

  install -d -m750 ${pkgdir}/var/lib/bareos/storage
  # Currently upstream systemd file does not automatically create run directory
  sed -i '/\[Service\]/a RuntimeDirectory=bareos' ${srcdir}/bareos/core/platforms/systemd/bareos-sd.service
  _cp ${srcdir}/bareos/core/platforms/systemd/bareos-sd.service ${pkgdir}/usr/lib/systemd/system/bareos-sd.service
}

#=========================================
package_bareos-storage-tape() {
  pkgdesc="${pkgdesc} - Tape support for storage daemon"
  depends=("bareos-storage=${pkgver}" 'zlib' 'libcap' 'bash' 'openssl' 'jansson' 'lzo' "mtx")
  backup=(etc/bareos/mtx-changer.conf)

  for f in \
    etc/bareos/mtx-changer.conf \
    usr/share/bareos/config/bareos-dir.d/storage/Tape.conf.example \
    usr/share/bareos/config/bareos-sd.d/autochanger/autochanger-0.conf.example \
    usr/share/bareos/config/bareos-sd.d/device/tapedrive-0.conf.example \
    usr/lib/bareos/backends/libbareossd-gentape.so \
    usr/lib/bareos/backends/libbareossd-tape.so \
    usr/lib/bareos/scripts/mtx-changer \
    usr/share/man/man8/bscrypto.8 \
    usr/share/man/man8/btape.8 \
    usr/bin/bscrypto \
    usr/bin/btape \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-director-python-plugins-common() {
  pkgdesc="${pkgdesc} - This package contains the common files for the python 2 and python 3 director plugins"
  depends=("bareos-director=${pkgver}")

  for f in \
    usr/lib/bareos/plugins/BareosDirPluginBaseclass.py \
    usr/lib/bareos/plugins/bareos-dir-class-plugin.py \
    usr/lib/bareos/plugins/BareosDirWrapper.py \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-filedaemon-python-plugins-common() {
  pkgdesc="${pkgdesc} - This package contains the common files for the python 2 and python 3 filedaemon plugins"
  depends=("bareos-filedaemon=${pkgver}")

  for f in \
    usr/lib/bareos/plugins/bareos-fd-local-fileset.py \
    usr/lib/bareos/plugins/BareosFdPluginBaseclass.py \
    usr/lib/bareos/plugins/BareosFdPluginLocalFileset.py \
    usr/lib/bareos/plugins/BareosFdPluginLocalFilesBaseclass.py \
    usr/lib/bareos/plugins/BareosFdWrapper.py \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-storage-python-plugins-common() {
  pkgdesc="${pkgdesc} - This package contains the common files for the python 2 and python 3 storage plugins"
  depends=("bareos-storage=${pkgver}")

  for f in \
    usr/lib/bareos/plugins/BareosSdPluginBaseclass.py \
    usr/lib/bareos/plugins/BareosSdWrapper.py \
    usr/lib/bareos/plugins/bareos-sd-class-plugin.py \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-director-python2-plugin() {
  conflicts=("bareos-director-python-plugin")
  pkgdesc="${pkgdesc} - Python plugin for director daemon"
  depends=("bareos-director=${pkgver}"
           "bareos-director-python-plugins-common=${pkgver}"
           'python2' 'libcap' 'jansson' 'lzo')

  for f in \
    usr/lib/bareos/plugins/python-dir.so \
    usr/lib/python2.7/site-packages/bareosdir.so \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-director-python3-plugin() {
  conflicts=("bareos-director-python-plugin")
  pkgdesc="${pkgdesc} - Python plugin for director daemon"
  depends=("bareos-director=${pkgver}"
           "bareos-director-python-plugins-common=${pkgver}"
           'python' 'libcap' 'jansson' 'lzo')

  for f in \
    usr/lib/bareos/plugins/python3-dir.so \
    usr/lib/python${python3_ver}/site-packages/bareosdir.cpython-${python3_ver//\./}-x86_64-linux-gnu.so \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-filedaemon-python2-plugin() {
  conflicts=("bareos-filedaemon-python-plugin")
  pkgdesc="${pkgdesc} - Python plugin for file daemon"
  depends=("bareos-filedaemon=${pkgver}"
           "bareos-filedaemon-python-plugins-common=${pkgver}"
           'python2' 'libcap' 'lzo' 'jansson')

  for f in \
    usr/lib/bareos/plugins/python-fd.so \
    usr/lib/python2.7/site-packages/bareosfd.so \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-filedaemon-python3-plugin() {
  conflicts=("bareos-filedaemon-python-plugin")
  pkgdesc="${pkgdesc} - Python plugin for file daemon"
  depends=("bareos-filedaemon=${pkgver}"
           "bareos-filedaemon-python-plugins-common=${pkgver}"
           'python' 'libcap' 'lzo' 'jansson')

  for f in \
    usr/lib/bareos/plugins/python3-fd.so \
    usr/lib/python${python3_ver}/site-packages/bareosfd.cpython-${python3_ver//\./}-x86_64-linux-gnu.so \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-storage-python2-plugin() {
  conflicts=("bareos-storage-python-plugin")
  pkgdesc="${pkgdesc} - Python plugin for storage daemon"
  depends=("bareos-storage=${pkgver}"
           "bareos-storage-python-plugins-common=${pkgver}"
           'python2' 'lzo' 'libcap' 'jansson')

  for f in \
    usr/lib/bareos/plugins/python-sd.so \
    usr/lib/python2.7/site-packages/bareossd.so \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-storage-python3-plugin() {
  conflicts=("bareos-storage-python-plugin")
  pkgdesc="${pkgdesc} - Python plugin for storage daemon"
  depends=("bareos-storage=${pkgver}"
           "bareos-storage-python-plugins-common=${pkgver}"
           'python' 'lzo' 'libcap' 'jansson')

  for f in \
    usr/lib/bareos/plugins/python3-sd.so \
    usr/lib/python${python3_ver}/site-packages/bareossd.cpython-${python3_ver//\./}-x86_64-linux-gnu.so \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-filedaemon-ldap-python-plugin() {
  pkgdesc="${pkgdesc} - LDAP Python plugin for Bareos File daemon"
  depends=("bareos-filedaemon=${pkgver}"
           "bareos-filedaemon-python3-plugin=${pkgver}"
           'python-ldap')
  #backup=("etc/bareos/bareos-dir.d/plugin-python-ldap.conf")

  for f in \
    usr/lib/bareos/plugins/bareos-fd-ldap.py \
    usr/lib/bareos/plugins/BareosFdPluginLDAP.py \
    usr/share/bareos/config/bareos-dir.d/fileset/plugin-ldap.conf.example \
    usr/share/bareos/config/bareos-dir.d/job/backup-ldap.conf.example \
    usr/share/bareos/config/bareos-dir.d/job/restore-ldap.conf.example \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-traymonitor() {
  groups+=("bareos-client")
  pkgdesc="${pkgdesc} - This package contains the tray monitor (QT based)"
  depends=("bareos-common=${pkgver}")
  #backup=("etc/bareos/tray-monitor.d/tray-monitor.conf")
  install=bareos-traymonitor.install

  install -d -m750 ${pkgdir}/etc/bareos/tray-monitor.d/monitor

  for f in \
    usr/bin/bareos-tray-monitor \
    usr/share/man/man1/bareos-tray-monitor.1 \
    usr/share/applications/bareos-tray-monitor.desktop \
    etc/xdg/autostart/bareos-tray-monitor.desktop \
    usr/share/pixmaps/bareos-tray-monitor.png \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
}

#=========================================
package_bareos-webui() {
  pkgdesc="${pkgdesc} - Webui (Bareos web administration)"
  depends=('php7' 'php7-fpm' 'jansson')
  optdepend=('nginx' 'php7-apache')
  backup=('etc/bareos-webui/directors.ini'
          'etc/bareos-webui/configuration.ini'
          'etc/bareos/bareos-dir.d/console/admin.conf.example'
          'etc/bareos/bareos-dir.d/profile/webui-admin.conf'
          'etc/httpd/conf/extra/bareos-webui.conf')

  _cp ${srcdir}/install/usr/share/bareos-webui ${pkgdir}/usr/share/webapps/bareos-webui
  sed -e "s|usr/share/bareos-webui/public|usr/share/webapps/bareos-webui/public|g" -i ${srcdir}/install/etc/httpd/conf.d/bareos-webui.conf
  _cp ${srcdir}/install/etc/httpd/conf.d/bareos-webui.conf ${pkgdir}/etc/httpd/conf/extra/bareos-webui.conf
  for f in \
    etc/bareos/bareos-dir.d/console/admin.conf.example \
    etc/bareos/bareos-dir.d/profile/webui-admin.conf \
    etc/bareos-webui \
  ; do
    _cp ${srcdir}/install/$f ${pkgdir}/$f
  done
  cp ${srcdir}/bootstrap-table-locale-all.min.js ${pkgdir}/usr/share/webapps/bareos-webui/public/js/bootstrap-table-locale-all.min.js
}
