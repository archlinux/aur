# Maintainer: Daniel Albers <daniel@lbe.rs>
# Contributor: Steven Haigh <netwiz@crc.id.au>
# Contributor: Georg Altmann <george@george-net.de>
# bacula-fd.service by Christian Hesse <arch@eworm.de>

pkgbase='bacula'
_dir_backends=("${pkgbase}-dir-sqlite3" "${pkgbase}-dir-mariadb" "${pkgbase}-dir-postgresql")
pkgname=("${pkgbase}-common" "${pkgbase}-console" "${pkgbase}-fd" "${pkgbase}-bat" "${pkgbase}-sd" "${pkgbase}-dir" ${_dir_backends[@]} "${pkgbase}-dir-mysql")
pkgver=7.0.5
pkgrel=3
arch=(i686 x86_64)
pkgdesc="${pkgbase^} - A Network Backup Tool"
url="http://www.${pkgbase}.org"
license=('AGPL3')
optdepends=('openssl: network encryption between daemons')
makedepends=('sqlite' 'libmariadbclient' 'postgresql-libs' 'qt4')
source=("http://downloads.sourceforge.net/sourceforge/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"
        '00-qmake4.patch'
       )

md5sums=('b4a99d673f5e1eaae8b257ccc610241f'
         '9ac88867a9ad3a4fe0486a26d0cdb542')
sha1sums=('3c4b2430960daf2607e824f0c0641f65023e43ce'
          '58a60e8af9b4735c564c7223c2bf0c25803927f3')

_instdir="${startdir}/install"
_workdir="/var/lib/${pkgbase}"

_genfiles() {
  > "${srcdir}/${pkgbase}-dir.service" cat <<-EOF
	#
	# ${pkgbase^} Director Daemon service
	#

	[Unit]
	Description=${pkgbase^} Director
	Alias=${pkgbase}-dir
	Requires=network.target
	After=network.target remote-fs.target syslog.target
	# Dependency about the database
	# We let administrators decide if they need it (if local db instance)
	#Wants=sqlite3.service
	# Check if working dir exist and is a directory
	ConditionPathIsDirectory=${_workdir}

	[Service]
	Type=forking
	Restart=always
	PIDFile=/run/${pkgbase}-dir.9101.pid
	# EnvironmentFile=-/etc/sysconfig/${pkgbase}-dir
	ExecStart=/usr/bin/${pkgbase}-dir -c /etc/${pkgbase}/${pkgbase}-dir.conf

	[Install]
	WantedBy=multi-user.target
	EOF

  > "${srcdir}/${pkgbase}-fd.service" cat <<-EOF
	#
	# ${pkgbase^} File Daemon service
	#

	[Unit]
	Description=${pkgbase^} File Daemon
	Requires=network.target
	After=network.target remote-fs.target syslog.target

	[Service]
	Type=forking
	Restart=always
	ExecStart=/usr/bin/${pkgbase}-fd -c /etc/${pkgbase}/${pkgbase}-fd.conf
	IOSchedulingClass=idle
	PIDFile=/run/${pkgbase}-fd.9102.pid

	[Install]
	WantedBy=multi-user.target
	EOF

  > "${srcdir}/${pkgbase}-sd.service" cat <<-EOF
	#
	# ${pkgbase^} Storage Daemon service
	#

	[Unit]
	Description=${pkgbase^} Storage Daemon
	Requires=network.target
	After=network.target remote-fs.target syslog.target

	[Service]
	Type=forking
	Restart=always
	PIDFile=/run/${pkgbase}-sd.9103.pid
	# EnvironmentFile=-/etc/sysconfig/${pkgbase}-sd
	ExecStart=/usr/bin/${pkgbase}-sd -c /etc/${pkgbase}/${pkgbase}-sd.conf

	[Install]
	WantedBy=multi-user.target
	EOF
}

prepare() {
    pushd "${srcdir}/${pkgbase}-${pkgver}"
    patch -Np3 -i ${srcdir}/00-qmake4.patch || true
    _genfiles
    popd
}

build() {
    pushd "${srcdir}/${pkgbase}-${pkgver}"

    ./configure                                \
      --enable-bat                             \
      --enable-smartalloc                      \
      --prefix=/usr                            \
      --sbindir=/usr/bin                       \
      --sysconfdir=/etc/${pkgbase}             \
      --with-scriptdir=/etc/${pkgbase}/scripts \
      --with-sqlite3                           \
      --with-mysql                             \
      --with-postgresql                        \
      --with-pid-dir=/run                      \
      --with-systemd=/usr/lib/systemd/system   \
      --with-tcp-wrappers                      \
      --with-logdir=/var/log/${pkgbase}        \
      --with-working-dir=${_workdir}           \
      --with-x

    make DESTDIR="$_instdir" install
    popd
}

package_bacula-bat() {
  pkgdesc="${pkgdesc} (management GUI)"
  backup=("etc/${pkgbase}/bat.conf")
  depends=("${pkgbase}-common=${pkgver}" 'qt4')
  pushd "${_instdir}"

  cp --parents -a usr/bin/bat ${pkgdir}
  cp --parents -a etc/${pkgbase}/bat.conf ${pkgdir}
  cp --parents -a usr/share/man/man1/bat.1.gz ${pkgdir}

  chmod 755 ${pkgdir}/etc/${pkgbase} ${pkgdir}/usr/bin/bat
  chmod 644 ${pkgdir}/etc/${pkgbase}/bat.conf

  mkdir -p ${pkgdir}/usr/share/applications ${pkgdir}/usr/share/pixmaps
  cp -a ${srcdir}/${pkgbase}-${pkgver}/scripts/bat.desktop ${pkgdir}/usr/share/applications/
  cp -a ${srcdir}/${pkgbase}-${pkgver}/src/qt-console/images/bat_icon.png ${pkgdir}/usr/share/pixmaps/

  popd
}

package_bacula-fd() {
  pkgdesc="${pkgdesc} (file daemon)"
  backup=("etc/${pkgbase}/${pkgname}.conf")
  optdepends=(
    'openssl: network encryption between daemons'
    'lzo: LZO compression for Storage Daemon'
  )
  depends=("${pkgbase}-common=${pkgver}" "tcp_wrappers")

  pushd "${_instdir}"

  cp --parents -a etc/${pkgbase}/${pkgname}.conf ${pkgdir}
  cp --parents -a usr/bin/${pkgname} ${pkgdir}
  cp --parents -a usr/lib/bpipe-fd.so ${pkgdir}
  cp --parents -a usr/share/man/man8/${pkgname}.8.gz ${pkgdir}

  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  cp -f ${srcdir}/${pkgbase}-fd.service ${pkgdir}/usr/lib/systemd/system/

  popd
}

package_bacula-common() {
  pkgdesc="${pkgdesc} (common files)"
  pushd "${_instdir}"

  cp --parents -a etc/${pkgbase}/scripts/${pkgbase}_config ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/btraceback.gdb ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/btraceback.dbx ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/btraceback.mdb ${pkgdir}
  cp --parents -a usr/bin/btraceback ${pkgdir}
  cp --parents -a usr/lib/libbac-${pkgver}.so ${pkgdir}
  cp --parents -a usr/lib/libbaccfg-${pkgver}.so ${pkgdir}
  cp --parents -a usr/lib/libbacfind-${pkgver}.so ${pkgdir}
  cp --parents -a usr/share/man/man8/btraceback.8.gz ${pkgdir}
  #cp --parents -a usr/lib/libbacpy-${pkgver}.so ${pkgdir}

  popd
}

package_bacula-console() {
  pkgdesc="${pkgdesc} (management CLI)"
  backup=("etc/${pkgbase}/bconsole.conf")
  depends=("${pkgbase}-common=${pkgver}")
  pushd "${_instdir}"

  cp --parents -a usr/bin/bconsole ${pkgdir}
  cp --parents -a etc/${pkgbase}/bconsole.conf ${pkgdir}
  cp --parents -a usr/share/man/man8/bconsole.8.gz ${pkgdir}

  chmod 755 ${pkgdir}/etc/${pkgbase} ${pkgdir}/usr/bin/bconsole
  chmod 644 ${pkgdir}/etc/${pkgbase}/bconsole.conf

  popd
}

package_bacula-dir() {
  pkgdesc="${pkgdesc} (Director)"
  depends=("${pkgbase}-common=${pkgver}")
  optdepends=(
    "${pkgname}-sqlite3: SQLite support"
    "${pkgname}-mariadb: MariaDB support"
    "${pkgname}-postgresql: PostgreSQL support")
  backup=("etc/${pkgbase}/${pkgname}.conf")
  pushd "${_instdir}"

  cp --parents -a etc/${pkgbase}/${pkgname}.conf ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/query.sql ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/create_${pkgbase}_database ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/delete_catalog_backup ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/drop_${pkgbase}_database ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/drop_${pkgbase}_tables ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/grant_${pkgbase}_privileges ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/make_${pkgbase}_tables ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/make_catalog_backup.pl ${pkgdir}
  cp --parents -a etc/${pkgbase}/scripts/update_${pkgbase}_tables ${pkgdir}
  cp --parents -a usr/bin/${pkgname} ${pkgdir}
  cp --parents -a usr/bin/bregex ${pkgdir}
  cp --parents -a usr/bin/bsmtp ${pkgdir}
  cp --parents -a usr/bin/bwild ${pkgdir}
  cp --parents -a usr/bin/dbcheck ${pkgdir}
  cp --parents -a usr/share/man/man1/bsmtp.1.gz ${pkgdir}
  cp --parents -a usr/share/man/man8/${pkgname}.8.gz ${pkgdir}
  cp --parents -a usr/share/man/man8/bregex.8.gz ${pkgdir}
  cp --parents -a usr/share/man/man8/bwild.8.gz ${pkgdir}
  cp --parents -a usr/share/man/man8/dbcheck.8.gz ${pkgdir}
  cp --parents -a usr/lib/libbacsql-${pkgver}.so ${pkgdir}

  mkdir -p ${pkgdir}${_workdir}

  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  cp -f ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/

  ## Logwatch Support
  mkdir -p ${pkgdir}/etc/logwatch/scripts/services/ ${pkgdir}/etc/logwatch/scripts/shared/
  mkdir -p ${pkgdir}/etc/logwatch/conf/logfiles/ ${pkgdir}/etc/logwatch/conf/services/
  cp -a ${srcdir}/${pkgbase}-${pkgver}/scripts/logwatch/${pkgbase} ${pkgdir}/etc/logwatch/scripts/services/
  cp -a ${srcdir}/${pkgbase}-${pkgver}/scripts/logwatch/applybaculadate ${pkgdir}/etc/logwatch/scripts/shared/
  cp -a ${srcdir}/${pkgbase}-${pkgver}/scripts/logwatch/logfile.${pkgbase}.conf ${pkgdir}/etc/logwatch/conf/logfiles/${pkgbase}.conf
  cp -a ${srcdir}/${pkgbase}-${pkgver}/scripts/logwatch/services.${pkgbase}.conf ${pkgdir}/etc/logwatch/conf/services/${pkgbase}.conf

  ## Logrotate Support
  mkdir -p ${pkgdir}/etc/logrotate.d/
  cp -a ${srcdir}/${pkgbase}-${pkgver}/scripts/logrotate ${pkgdir}/etc/logrotate.d/${pkgbase}
}

package_bacula-dir-mariadb() {
  pkgdesc="${pkgdesc} (Director - MariaDB support)"
  depends=("${pkgbase}-dir" 'libmariadbclient')
  conflicts=(${_dir_backends[@]/${pkgname}})
  replaces="${pkgbase}-dir-mysql"
  provides="${pkgbase}-dir-mysql"
  pushd "${_instdir}"

  cp --parents -a usr/lib/libbaccats-mysql-${pkgver}.so ${pkgdir}
  cp --parents -a usr/lib/libbaccats-mysql.so ${pkgdir}
  cp -d usr/lib/libbaccats-mysql.so ${pkgdir}/usr/lib/libbaccats-${pkgver}.so
  for file in etc/${pkgbase}/scripts/*mysql*; do
    cp --parents -a "$file" "${pkgdir}"
  done
}

package_bacula-dir-mysql() {
  pkgdesc="${pkgdesc} (transition package)"
  depends=("${pkgbase}-dir-mariadb")
  pushd "${_instdir}"
}

package_bacula-dir-postgresql() {
  pkgdesc="${pkgdesc} (Director - PostgreSQL support)"
  depends=("${pkgbase}-dir" 'postgresql-libs')
  conflicts=(${_dir_backends[@]/${pkgname}})
  pushd "${_instdir}"

  cp --parents -a usr/lib/libbaccats-postgresql-${pkgver}.so ${pkgdir}
  cp --parents -a usr/lib/libbaccats-postgresql.so ${pkgdir}
  cp -d usr/lib/libbaccats-postgresql.so ${pkgdir}/usr/lib/libbaccats-${pkgver}.so
  for file in etc/${pkgbase}/scripts/*postgresql*; do
    cp --parents -a "$file" "${pkgdir}"
  done
}

package_bacula-dir-sqlite3() {
  pkgdesc="${pkgdesc} (Director - SQLite3 support)"
  depends=("${pkgbase}-dir" 'sqlite')
  conflicts=(${_dir_backends[@]/${pkgname}})
  pushd "${_instdir}"

  cp --parents -a usr/lib/libbaccats-sqlite3-${pkgver}.so ${pkgdir}
  cp --parents -a usr/lib/libbaccats-sqlite3.so ${pkgdir}
  cp -d usr/lib/libbaccats-sqlite3.so ${pkgdir}/usr/lib/libbaccats-${pkgver}.so
  for file in etc/${pkgbase}/scripts/*sqlite3*; do
    cp --parents -a "$file" "${pkgdir}"
  done
}

package_bacula-sd() {
  pkgdesc="${pkgdesc} (Storage Daemon)"
  backup=("etc/${pkgbase}/${pkgname}.conf")
  depends=("${pkgbase}-common")
  optdepends=(
    'openssl: network encryption between daemons'
    'lzo: LZO compression for Storage Daemon'
  )
  pushd "${_instdir}"

  cp --parents -a etc/${pkgbase}/${pkgname}.conf ${pkgdir}
  cp --parents -a usr/bin/${pkgname} ${pkgdir}
  cp --parents -a usr/bin/bextract ${pkgdir}
  cp --parents -a usr/bin/bls ${pkgdir}
  cp --parents -a usr/bin/bcopy ${pkgdir}
  cp --parents -a usr/bin/bscan ${pkgdir}
  cp --parents -a usr/bin/btape ${pkgdir}
  cp --parents -a usr/share/man/man8/${pkgname}.8.gz ${pkgdir}
  cp --parents -a usr/share/man/man8/bextract.8.gz ${pkgdir}
  cp --parents -a usr/share/man/man8/bls.8.gz ${pkgdir}
  cp --parents -a usr/share/man/man8/bcopy.8.gz ${pkgdir}
  cp --parents -a usr/share/man/man8/bscan.8.gz ${pkgdir}
  cp --parents -a usr/share/man/man8/btape.8.gz ${pkgdir}

  mkdir -p ${pkgdir}${_workdir}

  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  cp -f ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/
}
