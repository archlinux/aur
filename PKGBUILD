# Maintainer:  khvalera <khvalera[at]ukr[dot]net>
# Contributor: Matthias Fulz <mfulz@olznet.net>
# Contributor: Michael Spradling <mike@mspradling.com>

pkgbase='bareos'

pkgname=("bareos-bconsole"
         "bareos-common"
         "bareos-database-common"
         "bareos-database-postgresql"
         "bareos-database-tools"
         "bareos-director"
         "bareos-director-python-plugins-common"
         "bareos-director-python2-plugin"
         "bareos-director-python3-plugin"
         "bareos-filedaemon"
         "bareos-filedaemon-glusterfs-plugin"
         "bareos-filedaemon-ldap-python-plugin"
         "bareos-filedaemon-libcloud-python-plugin"
         "bareos-filedaemon-mariabackup-python-plugin"
         "bareos-filedaemon-percona-xtrabackup-python-plugin"
         "bareos-filedaemon-postgresql-python-plugin"
         "bareos-filedaemon-python-plugins-common"
         "bareos-filedaemon-python2-plugin"
         "bareos-filedaemon-python3-plugin"
         "bareos-storage"
         "bareos-storage-ceph"
         "bareos-storage-droplet"
         "bareos-storage-fifo"
         "bareos-storage-glusterfs"
         "bareos-storage-python-plugins-common"
         "bareos-storage-python2-plugin"
         "bareos-storage-python3-plugin"
         "bareos-storage-tape"
         "bareos-tools"
         "bareos-vmware-plugin"
         "bareos-webui"
         "bareos-devel"
         "bareos-traymonitor"
         )

pkgver=21.1.3
pkgmajor=${pkgver%%.*}
pkgrel=2
arch=(i686 x86_64 armv7h aarch64)
groups=('bareos')
pkgdesc="Bareos - Backup Archiving Recovery Open Sourced"
url="http://www.bareos.org"
license=('AGPL3')
makedepends=('cmake' 'gcc' 'libmariadbclient' 'postgresql-libs' 'python2' 'python' 'rpcsvc-proto' 'git' 'lsb-release' 'qt5-base' 'glusterfs' 'jansson' 'pam_wrapper' 'ceph-libs')
source=("git+https://github.com/bareos/bareos.git#tag=Release/${pkgver}"
        "0001-distver.patch"
        "0002-libdroplet.patch"
        "0003-zend.patch"
        "0004-logspam.patch"
        "0005-version.patch"
        "0006-sqlspam.patch"
        "0007-hostname.patch"
        "0008-httpd.patch"
        "009-fix-timer_thread.patch"
        "bootstrap-table-locale-all.min.js")
md5sums=('SKIP'
         '419b0c64af750aa3e8ea668edf464d3e'
         'f2a2a4e1a83d80ee3ba42b38b2062208'
         'f9b885e18313d9c070372d313e1b422d'
         '39724df5903b712fb8d34209c7ac8f1e'
         '5bf1233d94dfecc9060746bfb39b9d2b'
         'ca4c929a2462cafaead8d0b49e3cebed'
         'b0068e1a248ac0d0e83fb8ae1e034f62'
         '33d9c3a1d25b30ac2182aa8d874e28a5'
         'c8d3568ddf543a576c6fdbe586d8d3d3'
         'e78b88f897cfc3e60129eec360521e3d')
python3_ver="3.10"
python2_ver="2.7"

#=========================================
prepare() {
    # Apply maintainer patches
    cd "${srcdir}/${pkgbase}"
    local _src
    local _patch="patch -N -t -p0 -l --no-backup-if-mismatch -i"
    for _src in "${source[@]}"; do
        _src="${_src%%::*}"
        _src="${_src##*/}"
        [[ $_src = *.patch ]] || continue
        echo "Applying patch $_src..."
        $_patch "../$_src"
    done
}

#=========================================
build() {
  cd "${srcdir}/${pkgbase}"
  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/ \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/bareos \
    -Dlibdir=/usr/lib/bareos \
    -Dlogdir=/var/log/bareos \
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
    -Dwebuiconfdir=/etc/bareos-webui \
    -DBAREOS_BINARY_INFO="Arch Linux" \
    -DBAREOS_JOBLOG_MESSAGE="Arch Linux AUR" \
    -Ddynamic-cats-backends=yes \
    -Ddynamic-storage-backends=yes \
    -Dpostgresql=yes \
    -Dpython=yes \
    -Dopenssl=yes \
    -Ddir-user=bareos \
    -Ddir-group=bareos \
    -Dsd-user=bareos \
    -Dsd-group=bareos \
    -Dfd-user=root \
    -Dfd-group=root \
    -Dscsi-crypto=yes \
    -Dsystemd=yes \
    -Dtraymonitor=yes

  make DESTDIR="${srcdir}/install" install
}

#=========================================
# + only directory created
# - skip a line
# directory - add recursively an arbitrary directory
cp_pkgdir() {
  if [ "${1:0:1}" = "-" ] ; then
     return
  elif [ "${1:0:1}" = "+" ] ; then
     dir_name=$pkgdir/`echo "$1" | sed "s|+||"`
     mkdir -p "$dir_name"
     return
  fi
  for n in $2$1 \
  ; do
    if [ -f "$n" ]; then
       dir_name=$pkgdir/$(dirname "$n" | sed "s|$2||")
    else
       dir_name=$pkgdir/`echo "$n" | sed "s|$2||"`
    fi
    if [ "${dir_name:0:1}" == "." ]; then
        return
    else
       mkdir -p "$dir_name"
    fi
    if [ -f "$n" ]; then
       cp -a "$n" "$dir_name"
    elif [ -d "$n" ]; then
       cp -aR "$n" "$(dirname $dir_name)"
    fi
  done
}

#=========================================
package_bareos-bconsole() {
  pkgdesc="${pkgdesc} - Admin Tool (CLI)"
  depends=("bareos-common=${pkgver}" 'readline' 'jansson')
  groups+=("bareos-client")
  install=bareos-bconsole.install
  backup=("etc/bareos/bconsole.conf")

  for f in \
     usr/share/bareos/config/bconsole.conf \
     usr/bin/bconsole \
     usr/share/man/man1/bconsole.1* \
     +etc/bareos \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
  install -m640 "${srcdir}/install/usr/share/bareos/config/bconsole.conf" \
          "${pkgdir}/etc/bareos/bconsole.conf"
}

#=========================================
package_bareos-common() {
  pkgdesc="${pkgdesc} - Common files"
  depends=('libcap' 'openssl' 'acl' 'bash' 'lzo' 'jansson' 'zlib')
  install=bareos-common.install
  for f in \
     usr/lib/bareos/libbareos.so* \
     usr/lib/bareos/libbareosfastlz.so* \
     usr/lib/bareos/libbareosfind.so* \
     usr/lib/bareos/libbareoslmdb.so* \
     usr/lib/bareos/libbareosndmp.so* \
     usr/lib/bareos/libbareossd.so* \
     usr/lib/bareos/scripts/bareos-config \
     usr/lib/bareos/scripts/bareos-config-lib.sh \
     usr/lib/bareos/scripts/bareos-explorer \
     usr/lib/bareos/scripts/btraceback.gdb \
     usr/bin/bsmtp \
     usr/bin/btraceback \
     usr/share/man/man1/bsmtp.1* \
     usr/share/man/man8/btraceback.8* \
     var/lib/bareos \
     +etc/bareos \
     +var/log/bareos \
     +run/bareos \
     +usr/share/licenses/${pkgname} \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
  install -Dm644 ${srcdir}/bareos/core/{AGPL-3.0.txt,LICENSE,README.*} "${pkgdir}/usr/share/licenses/${pkgname}/"
}


#=========================================
package_bareos-database-common() {
  pkgdesc="${pkgdesc} - Generic abstration libs and tools for sql catalog"
  depends=("bareos-common=${pkgver}" 'libcap' 'lzo' 'zlib' 'openssl' 'bash' 'jansson')
  for f in \
     usr/lib/bareos/libbareossql.so* \
     usr/lib/bareos/libbareoscats.so* \
     usr/lib/bareos/scripts/create_bareos_database \
     usr/lib/bareos/scripts/drop_bareos_database \
     usr/lib/bareos/scripts/drop_bareos_tables \
     usr/lib/bareos/scripts/grant_bareos_privileges \
     usr/lib/bareos/scripts/make_bareos_tables \
     usr/lib/bareos/scripts/update_bareos_tables \
     usr/lib/bareos/scripts/ddl/versions.map \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-database-postgresql() {
  pkgdesc="${pkgdesc} - Libs and tools for postgresql catalog"
  provides=("bareos-database=${pkgver}")
  depends=("bareos-database-common=${pkgver}" "postgresql-libs")
  install=bareos-database-postgresql.install
  for f in \
     usr/lib/bareos/backends/libbareoscats-postgresql.so* \
     usr/lib/bareos/scripts/ddl/*/postgresql*.sql \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-database-tools() {
  pkgdesc="${pkgdesc} - CLI tools with database dpendencies (dbcheck, bscan)"
  depends=("bareos-database-common=${pkgver}" 'openssl' 'jansson')

  for f in \
     usr/bin/bareos-dbcheck \
     usr/bin/bscan \
     usr/share/man/man8/bareos-dbcheck.8* \
     usr/share/man/man8/bscan.8* \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-devel() {
  pkgdesc="${pkgdesc} - Devel headers"
  arch=(any)
  # TODO
  install -d ${pkgdir}/usr/include/bareos
  install -m640 ${srcdir}/bareos/core/src/lib/*.h ${pkgdir}/usr/include/bareos
}

#=========================================
package_bareos-director() {
  pkgdesc="${pkgdesc} - Director daemon"
  depends=("bareos-common=${pkgver}" 'openssl' 'bash' 'jansson')
  install=bareos-director.install
  for f in \
     etc/logrotate.d/bareos-dir \
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
     usr/share/bareos/config/bareos-dir.d/fileset/Windows?All?Drives.conf \
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
     usr/share/bareos/config/bareos-dir.d/user \
     usr/share/bareos/config/tray-monitor.d/director/Director-local*.conf \
     usr/bin/bareos-dir \
     usr/share/man/man8/bareos-dir.8* \
     usr/share/man/man8/bareos.8* \
     usr/lib/systemd/system/bareos-dir.service \
  ; do
    # pacman LINT tool currently does not like spaces
    #space_removal=`echo $f | tr ' ' '_'`
    cp_pkgdir "$f" "$srcdir/install/"
  done

  # Currently upstream systemd file does not automatically create run directory
  sed -i '/\[Service\]/a RuntimeDirectory=bareos' ${pkgdir}/usr/lib/systemd/system/bareos-dir.service
}

#=========================================
package_bareos-director-python-plugins-common() {
  pkgdesc="${pkgdesc} - This package contains the common files for the python 2 and python 3 director plugins"
  depends=("bareos-director=${pkgver}")

  for f in \
     usr/lib/bareos/plugins/BareosDirWrapper.py* \
     usr/lib/bareos/plugins/BareosDirPluginBaseclass.py* \
     usr/lib/bareos/plugins/bareos-dir-class-plugin.py* \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
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
    cp_pkgdir "$f" "$srcdir/install/"
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
     usr/lib/python${python3_ver}/site-packages/bareosdir.cpython*.so \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
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
     usr/share/bareos/config/tray-monitor.d/client/FileDaemon-local*.conf \
     usr/bin/bareos-fd \
     usr/lib/bareos/plugins/bpipe-fd.so \
     usr/share/man/man8/bareos-fd.8* \
     usr/lib/systemd/system/bareos-fd.service \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
  # Currently upstream systemd file does not automatically create run directory
  sed -i '/\[Service\]/a RuntimeDirectory=bareos' ${pkgdir}/usr/lib/systemd/system/bareos-fd.service
}

#=========================================
package_bareos-filedaemon-glusterfs-plugin() {
  pkgdesc="${pkgdesc} - GlusterFS plugin for Bareos File daemon"
  depends=("bareos-filedaemon=${pkgver}"
           "glusterfs")
  for f in \
     usr/lib/bareos/plugins/gfapi-fd.so \
     usr/share/bareos/config/bareos-dir.d/fileset/plugin-gfapi.conf.example \
     usr/share/bareos/config/bareos-dir.d/job/BackupGFAPI.conf.example \
     usr/share/bareos/config/bareos-dir.d/job/RestoreGFAPI.conf.example \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
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
     usr/lib/bareos/plugins/bareos-fd-ldap.py* \
     usr/lib/bareos/plugins/BareosFdPluginLDAP.py* \
     usr/share/bareos/config/bareos-dir.d/fileset/plugin-ldap.conf.example \
     usr/share/bareos/config/bareos-dir.d/job/backup-ldap.conf.example \
     usr/share/bareos/config/bareos-dir.d/job/restore-ldap.conf.example \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-filedaemon-libcloud-python-plugin() {
  pkgdesc="${pkgdesc} - Libcloud Python plugin for Bareos File daemon"
  depends=("bareos-filedaemon=${pkgver}"
           "python-apache-libcloud")
  for f in \
     usr/lib/bareos/plugins/bareos-fd-libcloud.py* \
     usr/lib/bareos/plugins/BareosFdPluginLibcloud.py* \
     usr/lib/bareos/plugins/BareosLibcloudApi.py \
     usr/lib/bareos/plugins/bareos_libcloud_api \
     usr/lib/bareos/plugins/bareos_libcloud_api/* \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-filedaemon-mariabackup-python-plugin() {
  pkgdesc="${pkgdesc} - MariaBackup plugin for Bareos File daemon"
  depends=("bareos-filedaemon=${pkgver}"
           "mariadb")
  for f in \
     usr/lib/bareos/plugins/bareos-fd-mariabackup.py* \
     usr/lib/bareos/plugins/BareosFdPluginMariabackup.py* \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-filedaemon-percona-xtrabackup-python-plugin() {
  pkgdesc="${pkgdesc} - XtraBackup plugin for Bareos File daemon"
  depends=("bareos-filedaemon=${pkgver}"
           "xtrabackup")
  for f in \
     usr/lib/bareos/plugins/bareos-fd-percona-xtrabackup.py* \
     usr/lib/bareos/plugins/BareosFdPluginPerconaXtraBackup.py* \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-filedaemon-postgresql-python-plugin() {
  pkgdesc="${pkgdesc} - PostgreSQL plugin for Bareos File daemon"
  depends=("bareos-filedaemon=${pkgver}"
           "postgresql")
  for f in \
     usr/lib/bareos/plugins/bareos-fd-postgres.py* \
     usr/lib/bareos/plugins/BareosFdPluginPostgres.py* \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-filedaemon-python-plugins-common() {
  pkgdesc="${pkgdesc} - This package contains the common files for the python 2 and python 3 filedaemon plugins"
  depends=("bareos-filedaemon=${pkgver}")
  for f in \
     usr/lib/bareos/plugins/bareos-fd-local-fileset.py* \
     usr/lib/bareos/plugins/BareosFdPluginBaseclass.py* \
     usr/lib/bareos/plugins/BareosFdPluginLocalFileset.py* \
     usr/lib/bareos/plugins/BareosFdPluginLocalFilesBaseclass.py* \
     usr/lib/bareos/plugins/BareosFdWrapper.py* \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
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
    usr/lib/python${python2_ver}/site-packages/bareosfd.so \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
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
    usr/lib/python${python3_ver}/site-packages/bareosfd.cpython*.so \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
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
     usr/share/bareos/config/tray-monitor.d/storage/StorageDaemon-local*.conf \
     usr/bin/bareos-sd \
     usr/share/man/man8/bareos-sd.8 \
     usr/lib/systemd/system/bareos-sd.service \
     +var/lib/bareos/storage \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done

  # Currently upstream systemd file does not automatically create run directory
  sed -i '/\[Service\]/a RuntimeDirectory=bareos' ${pkgdir}/usr/lib/systemd/system/bareos-sd.service
}

#=========================================
package_bareos-storage-ceph() {
  pkgdesc="${pkgdesc} - Backup Archiving Recovery Open Sourced - storage daemon CEPH backend"
  depends=("bareos-storage=${pkgver}")
  for f in \
     usr/lib/bareos/backends/libbareossd-rados.so* \
     usr/lib/bareos/backends/libbareossd-cephfs.so* \
     usr/share/bareos/config/bareos-dir.d/storage/Rados.conf.example \
     usr/share/bareos/config/bareos-sd.d/device/RadosStorage.conf.example \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-storage-droplet() {
  pkgdesc="${pkgdesc} - Droplet support for storage daemon"
  depends=("bareos-storage=${pkgver}")
  for f in \
     usr/lib/bareos/libbareosdroplet.so* \
     usr/lib/bareos/backends/libbareossd-chunked.so* \
     usr/lib/bareos/backends/libbareossd-droplet.so* \
     usr/share/bareos/config/bareos-dir.d/storage/S3_Object.conf.example \
     usr/share/bareos/config/bareos-sd.d/device/S3_ObjectStorage.conf.example \
     usr/share/bareos/config/bareos-sd.d/device/droplet \
     usr/share/bareos/config/bareos-sd.d/device/droplet/aws_eu-central-1.profile.example \
     usr/share/bareos/config/bareos-sd.d/device/droplet/ceph-rados-gateway.profile.example \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-storage-fifo() {
  pkgdesc="${pkgdesc} - FIFO support for storage daemon"
  depends=("bareos-storage=${pkgver}" 'zlib' 'libcap' 'openssl' 'jansson' 'lzo')
  for f in \
    usr/lib/bareos/backends/libbareossd-fifo.so* \
    usr/share/bareos/config/bareos-dir.d/storage/NULL.conf.example \
    usr/share/bareos/config/bareos-sd.d/device/NULL.conf.example \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-storage-glusterfs() {
  pkgdesc="${pkgdesc} - GlusterFS support for storage daemon"
  depends=("bareos-storage=${pkgver}" 
           "glusterfs")
  for f in \
     usr/lib/bareos/backends/libbareossd-gfapi.so* \
     usr/share/bareos/config/bareos-dir.d/storage/Gluster.conf.example \
     usr/share/bareos/config/bareos-sd.d/device/GlusterStorage.conf.example \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-storage-python-plugins-common() {
  pkgdesc="${pkgdesc} - This package contains the common files for the python 2 and python 3 storage plugins"
  depends=("bareos-storage=${pkgver}")
  for f in \
    usr/lib/bareos/plugins/BareosSdPluginBaseclass.py* \
    usr/lib/bareos/plugins/BareosSdWrapper.py* \
    usr/lib/bareos/plugins/bareos-sd-class-plugin.py* \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
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
    usr/lib/python${python2_ver}/site-packages/bareossd.so \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
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
    usr/lib/python${python3_ver}/site-packages/bareossd.cpython*.so \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
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
     usr/lib/bareos/backends/libbareossd-gentape.so* \
     usr/lib/bareos/backends/libbareossd-tape.so* \
     usr/lib/bareos/plugins/scsicrypto-sd.so \
     usr/lib/bareos/plugins/scsitapealert-sd.so \
     usr/lib/bareos/scripts/mtx-changer \
     usr/share/man/man8/bscrypto.8* \
     usr/share/man/man8/btape.8* \
     usr/bin/bscrypto \
     usr/bin/btape \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-tools() {
  pkgdesc="${pkgdesc} - CLI tools (bcopy, bextract, bls, bregeq, bwild, bregex)"
  depends=("bareos-common=${pkgver}" 'glibc')
  for f in \
     usr/bin/bregex \
     usr/bin/bwild \
     usr/bin/bcopy \
     usr/bin/bextract \
     usr/bin/bls \
     usr/bin/bregex \
     usr/bin/bwild \
     usr/bin/bpluginfo \
     usr/share/man/man1/bwild.1* \
     usr/share/man/man1/bregex.1* \
     usr/share/man/man8/bcopy.8* \
     usr/share/man/man8/bextract.8* \
     usr/share/man/man8/bls.8* \
     usr/share/man/man8/bpluginfo.8* \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
}

#=========================================
package_bareos-traymonitor() {
  groups+=("bareos-client")
  pkgdesc="${pkgdesc} - This package contains the tray monitor (QT based)"
  depends=("bareos-common=${pkgver}")
  backup=("etc/bareos/tray-monitor.d/monitor/bareos-mon.conf"
          "etc/bareos/tray-monitor.d/client/file-daemon.conf"
          "etc/bareos/tray-monitor.d/director/director.conf"
          "etc/bareos/tray-monitor.d/storage/storage-daemon.conf")
  install=bareos-traymonitor.install
  for f in \
    usr/bin/bareos-tray-monitor \
    usr/share/bareos/config/tray-monitor.d/client/FileDaemon-local.conf \
    usr/share/bareos/config/tray-monitor.d/director/Director-local.conf \
    usr/share/bareos/config/tray-monitor.d/monitor/bareos-mon.conf \
    usr/share/bareos/config/tray-monitor.d/storage/StorageDaemon-local.conf \
    usr/share/man/man1/bareos-tray-monitor.1 \
    usr/share/applications/bareos-tray-monitor.desktop \
    etc/xdg/autostart/bareos-tray-monitor.desktop \
    usr/share/pixmaps/bareos-tray-monitor.png \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done

  # tray-monitor needs configuration files to run
  install -d -m750 ${pkgdir}/etc/bareos/tray-monitor.d/{client,director,monitor,storage}
  install -m640 "${pkgdir}/usr/share/bareos/config/tray-monitor.d/monitor/bareos-mon.conf"          "${pkgdir}/etc/bareos/tray-monitor.d/monitor/bareos-mon.conf"
  install -m640 "${pkgdir}/usr/share/bareos/config/tray-monitor.d/client/FileDaemon-local.conf"     "${pkgdir}/etc/bareos/tray-monitor.d/client/file-daemon.conf"
  install -m640 "${pkgdir}/usr/share/bareos/config/tray-monitor.d/director/Director-local.conf"     "${pkgdir}/etc/bareos/tray-monitor.d/director/director.conf"
  install -m640 "${pkgdir}/usr/share/bareos/config/tray-monitor.d/storage/StorageDaemon-local.conf" "${pkgdir}/etc/bareos/tray-monitor.d/storage/storage-daemon.conf"
}

#=========================================
package_bareos-vmware-plugin() {
  pkgdesc="${pkgdesc} - Bareos VMware plugin"
  depends=('python2')
  for f in \
     usr/lib/bareos/plugins/BareosFdPluginVMware.py \
     usr/lib/bareos/plugins/bareos-fd-vmware.py \
     -usr/bin/vmware_cbt_tool.py \
     +usr/bin \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
  install -m755 "${srcdir}/bareos/core/src/vmware/vmware_cbt_tool/vmware_cbt_tool.py" "${pkgdir}/usr/bin/vmware_cbt_tool.py"
}

#=========================================
package_bareos-webui() {
  pkgdesc="${pkgdesc} - Webui (Bareos web administration)"
  depends=('php7' 'php7-fpm' 'jansson')
  optdepend=('apache' 'nginx' 'php7-apache' )
  backup=('etc/bareos-webui/directors.ini'
          'etc/bareos-webui/configuration.ini'
          'etc/bareos/bareos-dir.d/console/admin.conf.example'
          'etc/bareos/bareos-dir.d/profile/webui-admin.conf'
          'etc/httpd/conf/extra/bareos-webui.conf')
  #_cp ${srcdir}/install/usr/share/bareos-webui ${pkgdir}/usr/share/webapps/bareos-webui
  for f in \
     etc/bareos/bareos-dir.d/console/admin.conf.example \
     etc/bareos/bareos-dir.d/profile/webui-admin.conf \
     etc/bareos/bareos-dir.d/profile/webui-limited.conf.example \
     etc/bareos/bareos-dir.d/profile/webui-readonly.conf \
     etc/httpd/conf/extra/bareos-webui.conf \
     etc/bareos-webui/directors.ini \
     etc/bareos-webui/configuration.ini \
     usr/share/bareos-webui \
     +usr/share/licenses/${pkgname} \
  ; do
    cp_pkgdir "$f" "$srcdir/install/"
  done
  cp ${srcdir}/bootstrap-table-locale-all.min.js ${pkgdir}/usr/share/bareos-webui/public/js/bootstrap-table-locale-all.min.js
  install -Dm644 ${srcdir}/bareos/webui/{README.md,LICENSE,doc/README-TRANSLATION.md} "${pkgdir}/usr/share/licenses/${pkgname}/"
}
