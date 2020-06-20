# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Tom Keller <tom@isochrono.us>
# Contributor: Daniel Albers <daniel@lbe.rs>
# Contributor: Steven Haigh <netwiz@crc.id.au>
# Contributor: Georg Altmann <george@george-net.de>
# bacula-fd.service by Christian Hesse <arch@eworm.de>

pkgbase=bacula
_dir_backends=("${pkgbase}-dir-sqlite3" "${pkgbase}-dir-mariadb" "${pkgbase}-dir-postgresql")
pkgname=("${pkgbase}-common"
         "${pkgbase}-console"
         "${pkgbase}-fd"
         "${pkgbase}-bat"
         "${pkgbase}-sd"
         "${pkgbase}-dir"
         "${_dir_backends[@]}"
         "${pkgbase}-dir-mysql")
pkgver=9.6.5
pkgrel=2
arch=('any')
pkgdesc="${pkgbase^} - A Network Backup Tool "
url="https://www.${pkgbase}.org"
license=('AGPL3')
optdepends=('openssl-1.0: network encryption between daemons')
makedepends=('sqlite' 'libmariadbclient' 'postgresql-libs' 'qt4' 'openssl-1.0')
install="bacula.install"
source=("https://downloads.sourceforge.net/sourceforge/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"{,.sig}
        'bacula-dir.service'
        'bacula-fd.service'
        'bacula-sd.service')

sha256sums=('510f35b86138472abe6c559caded7bc773bf5eb1b9ee10905ee8f4f827c7c77a'
            'SKIP'
            'd1f06403b3460ad8cb7bd063ec31108d87c77dc58bb8a916229262d2bac4a565'
            '072a408b136f27251e9420f801d162e828218306ee74c0c5ba83b24f558e5e39'
            'a5e75ee945479f9e38415d2841cf3485200d9d9374d5a68c19c13b39467ca5bb')

# Bacula 4096 Distribution Verification Key (www.bacula.org)
validpgpkeys=('5235F5B668D81DB61704A82DC0BE2A5FE9DF3643')

_workdir="/var/lib/${pkgbase}"

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  cd autoconf

  autoconf configure.in > ../configure
  cd ..
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

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
    --with-logdir=/var/log/${pkgbase}        \
    --with-working-dir="${_workdir}"         \
    --with-openssl=/usr                      \
    --with-x

  make
  make DESTDIR="${srcdir}/install" install

  cd "${srcdir}/${pkgbase}-${pkgver}"
}

package_bacula-bat() {
  pkgdesc+="(management GUI)"
  backup=("etc/${pkgbase}/bat.conf")
  depends=("${pkgbase}-common=${pkgver}" 'qt4')

  cd "${srcdir}/install"
  cp --parents -a usr/bin/bat "${pkgdir}"
  cp --parents -a usr/bin/bacula-tray-monitor "${pkgdir}"
  cp --parents -a etc/${pkgbase}/bat.conf "${pkgdir}"
  cp --parents -a etc/${pkgbase}/bacula-tray-monitor.conf "${pkgdir}"
  cp --parents -a usr/share/man/man1/bat.1.gz "${pkgdir}"

  chmod 755 "${pkgdir}/etc/${pkgbase}" "${pkgdir}/usr/bin/bat" "${pkgdir}/usr/bin/bacula-tray-monitor"
  chmod 644 "${pkgdir}/etc/${pkgbase}/bat.conf" "${pkgdir}/etc/${pkgbase}/bacula-tray-monitor.conf"

  mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/pixmaps"
  cp -a "${srcdir}/${pkgbase}-${pkgver}/scripts/bat.desktop" "${pkgdir}/usr/share/applications/"
  cp -a "${srcdir}/${pkgbase}-${pkgver}/scripts/bacula-tray-monitor.desktop" "${pkgdir}/usr/share/applications/"
  cp -a "${srcdir}/${pkgbase}-${pkgver}/src/qt-console/images/bat_icon.png" "${pkgdir}/usr/share/pixmaps/"
}

package_bacula-fd() {
  pkgdesc+="(file daemon)"
  backup=("etc/${pkgbase}/${pkgname}.conf")
  optdepends=('openssl-1.0: network encryption between daemons'
              'lzo: LZO compression for Storage Daemon')
  depends=("${pkgbase}-common=${pkgver}")

  cd "${srcdir}/install"
  cp --parents -a etc/${pkgbase}/${pkgname}.conf "${pkgdir}"
  cp --parents -a usr/bin/${pkgname} "${pkgdir}"
  cp --parents -a usr/bin/bfdjson "${pkgdir}"
  cp --parents -a usr/lib/bpipe-fd.so "${pkgdir}"
  cp --parents -a usr/share/man/man8/${pkgname}.8.gz "${pkgdir}"

  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp -f "${srcdir}/${pkgbase}-fd.service" "${pkgdir}/usr/lib/systemd/system/"
}

package_bacula-common() {
  pkgdesc+="(common files)"

  cd "${srcdir}/install"
  cp --parents -a etc/${pkgbase}/scripts/${pkgbase}_config "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/btraceback.gdb "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/btraceback.dbx "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/btraceback.mdb "${pkgdir}"
  cp --parents -a usr/bin/btraceback "${pkgdir}"
  cp --parents -a usr/lib/libbac-${pkgver}.so "${pkgdir}"
  cp --parents -a usr/lib/libbaccfg-${pkgver}.so "${pkgdir}"
  cp --parents -a usr/lib/libbacfind-${pkgver}.so "${pkgdir}"
  cp --parents -a usr/share/man/man8/btraceback.8.gz "${pkgdir}"
  #cp --parents -a usr/lib/libbacpy-${pkgver}.so "${pkgdir}"

  mkdir -p "${pkgdir}${_workdir}"
  mkdir -p "${pkgdir}/var/log/${pkgbase}"
}

package_bacula-console() {
  pkgdesc+="(management CLI)"
  backup=("etc/${pkgbase}/bconsole.conf")
  depends=("${pkgbase}-common=${pkgver}")

  cd "${srcdir}/install"
  cp --parents -a usr/bin/bconsole "${pkgdir}"
  cp --parents -a usr/bin/bbconsjson "${pkgdir}"
  cp --parents -a etc/${pkgbase}/bconsole.conf "${pkgdir}"
  cp --parents -a usr/share/man/man8/bconsole.8.gz "${pkgdir}"

  chmod 755 "${pkgdir}/etc/${pkgbase}" "${pkgdir}/usr/bin/bconsole"
  chmod 644 "${pkgdir}/etc/${pkgbase}/bconsole.conf"
}

package_bacula-dir() {
  pkgdesc+="(Director)"
  depends=("${pkgbase}-common=${pkgver}")
  optdepends=("${pkgname}-sqlite3: SQLite support"
              "${pkgname}-mariadb: MariaDB support"
              "${pkgname}-postgresql: PostgreSQL support")
  backup=("etc/${pkgbase}/${pkgname}.conf")

  cd "${srcdir}/install"
  cp --parents -a etc/${pkgbase}/${pkgname}.conf "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/query.sql "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/create_${pkgbase}_database "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/delete_catalog_backup "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/drop_${pkgbase}_database "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/drop_${pkgbase}_tables "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/grant_${pkgbase}_privileges "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/make_${pkgbase}_tables "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/make_catalog_backup.pl "${pkgdir}"
  cp --parents -a etc/${pkgbase}/scripts/update_${pkgbase}_tables "${pkgdir}"
  cp --parents -a usr/bin/${pkgname} "${pkgdir}"
  cp --parents -a usr/bin/bdirjson "${pkgdir}"
  cp --parents -a usr/bin/bregex "${pkgdir}"
  cp --parents -a usr/bin/bsmtp "${pkgdir}"
  cp --parents -a usr/bin/bwild "${pkgdir}"
  cp --parents -a usr/bin/dbcheck "${pkgdir}"
  cp --parents -a usr/share/man/man1/bsmtp.1.gz "${pkgdir}"
  cp --parents -a usr/share/man/man8/${pkgname}.8.gz "${pkgdir}"
  cp --parents -a usr/share/man/man8/bregex.8.gz "${pkgdir}"
  cp --parents -a usr/share/man/man8/bwild.8.gz "${pkgdir}"
  cp --parents -a usr/share/man/man8/dbcheck.8.gz "${pkgdir}"
  cp --parents -a usr/lib/libbacsql-${pkgver}.so "${pkgdir}"

  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp -f "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/"

  ## Logwatch Support
  mkdir -p "${pkgdir}/etc/logwatch/scripts/services/" "${pkgdir}/etc/logwatch/scripts/shared/"
  mkdir -p "${pkgdir}/etc/logwatch/conf/logfiles/" "${pkgdir}/etc/logwatch/conf/services/"
  cp -a "${srcdir}/${pkgbase}-${pkgver}/scripts/logwatch/${pkgbase}" "${pkgdir}/etc/logwatch/scripts/services/"
  cp -a "${srcdir}/${pkgbase}-${pkgver}/scripts/logwatch/applybaculadate" "${pkgdir}/etc/logwatch/scripts/shared/"
  cp -a "${srcdir}/${pkgbase}-${pkgver}/scripts/logwatch/logfile.${pkgbase}.conf" "${pkgdir}/etc/logwatch/conf/logfiles/${pkgbase}.conf"
  cp -a "${srcdir}/${pkgbase}-${pkgver}/scripts/logwatch/services.${pkgbase}.conf" "${pkgdir}/etc/logwatch/conf/services/${pkgbase}.conf"

  ## Logrotate Support
  mkdir -p ${pkgdir}/etc/logrotate.d/
  cp -a ${srcdir}/${pkgbase}-${pkgver}/scripts/logrotate ${pkgdir}/etc/logrotate.d/${pkgbase}
}

package_bacula-dir-mariadb() {
  pkgdesc+="(Director - MariaDB support)"
  depends=("${pkgbase}-dir" 'libmariadbclient')
  conflicts=(${_dir_backends[@]/${pkgname}})
  replaces=("${pkgbase}-dir-mysql")
  provides=("${pkgbase}-dir-mysql")

  cd "${srcdir}/install"
  cp --parents -a usr/lib/libbaccats-mysql-${pkgver}.so "${pkgdir}"
  cp --parents -a usr/lib/libbaccats-mysql.so "${pkgdir}"
  cp -d usr/lib/libbaccats-mysql.so ${pkgdir}/usr/lib/libbaccats-${pkgver}.so
  for file in etc/${pkgbase}/scripts/*mysql*; do
    cp --parents -a "${file}" "${pkgdir}"
  done
}

package_bacula-dir-mysql() {
  pkgdesc+="(transition package)"
  depends=("${pkgbase}-dir-mariadb")
}

package_bacula-dir-postgresql() {
  pkgdesc+="(Director - PostgreSQL support)"
  depends=("${pkgbase}-dir" 'postgresql-libs')
  conflicts=(${_dir_backends[@]/${pkgname}})

  cd "${srcdir}/install"
  cp --parents -a usr/lib/libbaccats-postgresql-${pkgver}.so "${pkgdir}"
  cp --parents -a usr/lib/libbaccats-postgresql.so "${pkgdir}"
  cp -d usr/lib/libbaccats-postgresql.so "${pkgdir}/usr/lib/libbaccats-${pkgver}.so"
  for file in etc/${pkgbase}/scripts/*postgresql*; do
    cp --parents -a "${file}" "${pkgdir}"
  done
}

package_bacula-dir-sqlite3() {
  pkgdesc+="(Director - SQLite3 support)"
  depends=("${pkgbase}-dir" 'sqlite')
  conflicts=(${_dir_backends[@]/${pkgname}})

  cd "${srcdir}/install"
  cp --parents -a usr/lib/libbaccats-sqlite3-${pkgver}.so "${pkgdir}"
  cp --parents -a usr/lib/libbaccats-sqlite3.so "${pkgdir}"
  cp -d usr/lib/libbaccats-sqlite3.so "${pkgdir}/usr/lib/libbaccats-${pkgver}.so"
  for file in etc/${pkgbase}/scripts/*sqlite3*; do
    cp --parents -a "${file}" "${pkgdir}"
  done
}

package_bacula-sd() {
  pkgdesc+="(Storage Daemon)"
  backup=("etc/${pkgbase}/${pkgname}.conf")
  depends=("${pkgbase}-common")
  optdepends=('openssl-1.0: network encryption between daemons'
              'lzo: LZO compression for Storage Daemon')

  cd "${srcdir}/install"
  cp --parents -a etc/${pkgbase}/${pkgname}.conf "${pkgdir}"
  cp --parents -a usr/bin/${pkgname} "${pkgdir}"
  cp --parents -a usr/bin/bextract "${pkgdir}"
  cp --parents -a usr/bin/bls "${pkgdir}"
  cp --parents -a usr/bin/bcopy "${pkgdir}"
  cp --parents -a usr/bin/bscan "${pkgdir}"
  cp --parents -a usr/bin/bsdjson "${pkgdir}"
  cp --parents -a usr/bin/btape "${pkgdir}"
  cp --parents -a usr/lib/libbacsd-${pkgver}.so "${pkgdir}"
  cp --parents -a usr/lib/libbacsd.so "${pkgdir}"
  cp --parents -a usr/share/man/man8/${pkgname}.8.gz "${pkgdir}"
  cp --parents -a usr/share/man/man8/bextract.8.gz "${pkgdir}"
  cp --parents -a usr/share/man/man8/bls.8.gz "${pkgdir}"
  cp --parents -a usr/share/man/man8/bcopy.8.gz "${pkgdir}"
  cp --parents -a usr/share/man/man8/bscan.8.gz "${pkgdir}"
  cp --parents -a usr/share/man/man8/btape.8.gz "${pkgdir}"

  chmod +x "${pkgdir}/usr/bin"*
  mkdir -p "${pkgdir}${_workdir}"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp -f "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/"
}
