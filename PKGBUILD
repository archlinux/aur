DB_TYPE='mysql'    # the desired database type: 'mysql', 'postgresql' or 'sqlite3'
JAVA_GATEWAY='no'  # work in progress

# Maintainer: Arthur Țițeică / arthur dot titeica with gmail
# Contributor: Idares <idares at seznam dot cz>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>

pkgbase=zabbix3
pkgname=('zabbix3-server'
         'zabbix3-php-frontend'
         'zabbix3-agent'
         'zabbix3-java-gateway'
         'zabbix3-proxy'
         'zabbix3-common')
pkgver=3.2.4
pkgrel=1
pkgdesc="Zabbix is an enterprise-class open source distributed monitoring solution."
arch=('i686' 'x86_64')
url='http://www.zabbix.com/'
groups=('zabbix')
license=('GPL2')
source=("https://downloads.sourceforge.net/sourceforge/zabbix/zabbix-${pkgver}.tar.gz"
        "zabbix-common.logrotate" "zabbix.sysusers" "zabbix.tmpfiles.conf"
        "zabbix-agent.service" "zabbix-proxy.service" "zabbix-server.service" "zabbix-java-gateway.service")

if [[ -z "${DB_TYPE}" ]]; then
  printf '\e[1m Please set the DB_TYPE option at the top of the PKGBUILD \n\e[0m'
  exit 1
fi

if [[ ${JAVA_GATEWAY} = "yes" ]]; then
  JAVA_OPTION='--enable-java'
else
  JAVA_OPTION='--disable-java'
fi

prepare() {
  cd "${srcdir}/zabbix-${pkgver}"
  sed -i "s|/usr/local/etc|/etc/zabbix|g"                                     $(grep -rl "/usr/local/etc"  "conf/" "man/")
  sed -i "s|# DBSocket=/tmp/mysql.sock|DBSocket=/run/mysqld/mysqld.sock|g"    $(grep -rl "# DBSocket=/tmp" "conf/"       )
  sed -i "s|# PidFile=/tmp|PidFile=/run/zabbix|g"                             $(grep -rl "# PidFile=/tmp"  "conf/"       )
  sed -i "s|LogFile=/tmp|# LogFile=/var/log/zabbix|g"                         $(grep -rl "LogFile=/tmp"    "conf/"       )
  sed -i "s|# LogType=file|LogType=system|g"                                  $(grep -rl "LogType=file"    "conf/"       )
  sed -i "s|/usr/sbin|/usr/bin|g"                                             $(grep -rl "/usr/sbin"       "conf/"       )
}

build() {

  cd "${srcdir}"/zabbix-${pkgver}/

  ./configure \
    --disable-static \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --datadir=/etc \
    --sysconfdir=/etc/zabbix \
    --enable-ipv6 \
    --with-net-snmp \
    --with-libcurl \
    --with-ssh2 \
    --with-libxml2 \
    --with-openipmi=no \
    --with-ldap=no \
    --with-openssl=yes \
    --with-gnutls=no \
    --with-unixodbc=no \
    --with-${DB_TYPE} \
    --enable-server \
    --enable-agent \
    --enable-proxy \
    ${JAVA_OPTION}

  make

}

package_zabbix3-server() {
  pkgdesc="Enterprise-class Monitoring Platform - server"
  _common_depends=("zabbix3-common=${pkgver}-${pkgrel}" 'curl' 'openssl' 'libxml2' 'libssh2' 'net-snmp')
  [[ $DB_TYPE = "mysql" ]]      && depends=(${_common_depends[@]} 'libmariadbclient') # unixodbc, openipmi
  [[ $DB_TYPE = "postgresql" ]] && depends=(${_common_depends[@]} 'postgresql-libs')
  [[ $DB_TYPE = "sqlite3" ]]    && depends=(${_common_depends[@]} 'sqlite')
  optdepends=('mariadb' 'postgresql')
  backup=('etc/zabbix/zabbix_server.conf')
  replaces=('zabbix-server' 'zabbix-server-mysql' 'zabbix-get')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -D "src/zabbix_server/zabbix_server" "${pkgdir}/usr/bin/zabbix_server" # executable
  install -D "src/zabbix_get/zabbix_get" "${pkgdir}/usr/bin/zabbix_get" # executable
  install -D -m644 "conf/zabbix_server.conf" "${pkgdir}/etc/zabbix/zabbix_server.conf" # config
  install -D "misc/snmptrap/snmptrap.sh" "${pkgdir}/usr/share/zabbix/snmptrap/snmptrap.sh" # scripts
  install -D -m644 "misc/snmptrap/zabbix_trap_receiver.pl" "${pkgdir}/usr/share/zabbix/snmptrap/zabbix_trap_receiver.pl" # scripts
  install -D -m644 "man/zabbix_server.man" "${pkgdir}/usr/share/man/man8/zabbix_server.8" # man
  install -D -m644 "man/zabbix_get.man" "${pkgdir}/usr/share/man/man1/zabbix_get.1" # man
  install -d "${pkgdir}/usr/share/zabbix/${DB_TYPE}"
  install -m644 database/${DB_TYPE}/*.sql -t ${pkgdir}/usr/share/zabbix/${DB_TYPE} # db files
  install -D -m644 "${srcdir}/zabbix-server.service" "${pkgdir}/usr/lib/systemd/system/zabbix-server.service"
}

package_zabbix3-agent() {
  pkgdesc="Enterprise-class Monitoring Platform - agent"
  depends=("zabbix3-common=${pkgver}-${pkgrel}" 'curl' 'openssl')
  backup=('etc/zabbix/zabbix_agentd.conf')
  replaces=('zabbix-agent' 'zabbix-agentd' 'zabbix-sender')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -D       "src/zabbix_agent/zabbix_agentd" "${pkgdir}/usr/bin/zabbix_agentd"  # executable
  install -D       "src/zabbix_sender/zabbix_sender" "${pkgdir}/usr/bin/zabbix_sender" # executable
  install -D -m644 "conf/zabbix_agentd.conf" "${pkgdir}/etc/zabbix/zabbix_agentd.conf" # config
  install -d       "${pkgdir}/etc/zabbix/zabbix_agentd.conf.d"
  install -D -m644 "conf/zabbix_agentd/userparameter_examples.conf" "${pkgdir}/usr/share/zabbix/zabbix_agentd/userparameter_examples.conf"
  install -D -m644 "conf/zabbix_agentd/userparameter_mysql.conf" "${pkgdir}/usr/share/zabbix/zabbix_agentd/userparameter_mysql.conf"
  install -D -m644 "man/zabbix_agentd.man" "${pkgdir}/usr/share/man/man8/zabbix_agentd.8" # man
  install -D -m644 "man/zabbix_sender.man" "${pkgdir}/usr/share/man/man1/zabbix_sender.1" # man
  install -D -m644 "${srcdir}/zabbix-agent.service" "${pkgdir}/usr/lib/systemd/system/zabbix-agent.service"
}

package_zabbix3-java-gateway() {
  pkgdesc="Enterprise-class Monitoring Platform - Java gateway"
  arch=('any')
  depends=("zabbix3-common=${pkgver}-${pkgrel}" 'java-environment-openjdk' 'java-runtime-headless')
  backup=('etc/zabbix/zabbix_java_gateway.conf')
  replaces=('zabbix-java-gateway')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -D -m644 "src/zabbix_java/settings.sh" "${pkgdir}/etc/zabbix/zabbix_java_gateway.conf" # config
}

package_zabbix3-php-frontend() {
  pkgdesc="Enterprise-class Monitoring Platform - PHP front-end"
  arch=('any')
  # depends=('php-fpm' 'php-gd')
  optdepends=('nginx' 'apache' 'lighttpd' 'php-fpm' 'php-gd')
  options=('!strip' 'emptydirs')
  replaces=('zabbix-php-frontend' 'zabbix-server-mysql')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -d "${pkgdir}/usr/share/webapps/zabbix" # create dirs
  cp -a frontends/php/* "${pkgdir}/usr/share/webapps/zabbix"
  chmod -x ${pkgdir}/usr/share/webapps/zabbix/images/general/*.gif # fix permissions
  chown 33:33 ${pkgdir}/usr/share/webapps/zabbix/conf/ # write access for http user
}

package_zabbix3-proxy() {
  pkgdesc="Enterprise-class Monitoring Platform - proxy"
  _common_depends=("zabbix3-common=${pkgver}-${pkgrel}" 'curl' 'openssl' 'libxml2' 'net-snmp')
  [[ $DB_TYPE = "mysql" ]]      && depends=(${_common_depends[@]} 'libmariadbclient') # unixodbc, openipmi
  [[ $DB_TYPE = "postgresql" ]] && depends=(${_common_depends[@]} 'postgresql-libs')
  [[ $DB_TYPE = "sqlite3" ]]    && depends=(${_common_depends[@]} 'sqlite')
  backup=('etc/zabbix/zabbix_proxy.conf')
  replaces=('zabbix-proxy' 'zabbix-server-mysql')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -D  "src/zabbix_proxy/zabbix_proxy" "${pkgdir}/usr/bin/zabbix_proxy"          # executable
  install -D -m644 "conf/zabbix_proxy.conf" "${pkgdir}/etc/zabbix/zabbix_proxy.conf"    # config
  install -D -m644 "man/zabbix_proxy.man" "${pkgdir}/usr/share/man/man8/zabbix_proxy.8" # man
  install -D -m644 "${srcdir}/zabbix-proxy.service" "${pkgdir}/usr/lib/systemd/system/zabbix-proxy.service"
}

package_zabbix3-common() {
  pkgdesc="Enterprise-class Monitoring Platform - common files"
  install="zabbix-common.install"
  install -d "${pkgdir}/var/lib/zabbix" # home directory
  install -D -m644 "${srcdir}/zabbix-common.logrotate" "${pkgdir}/etc/logrotate.d/zabbix-common"
  install -D -m644 "${srcdir}/zabbix.tmpfiles.conf"    "${pkgdir}/usr/lib/tmpfiles.d/zabbix-common.conf"
  install -D -m644 "${srcdir}/zabbix.sysusers"         "${pkgdir}/usr/lib/sysusers.d/zabbix-common.conf"
}


md5sums=('58716947118a79e2a772379229f2f05a'
         '2550b61809e65b3506954605edc07066'
         '564022867b5bdfa3a98a4ed46ac97f47'
         'cfb62758de880609adb67d0c09d662c5'
         '05da3aadbd4a91b38cad931e929e9a1e'
         'f41f74947c89c74b18fdd2e734ab0401'
         '85847fcc0e502d4a807d923aecbfcee1'
         '5588ec58fa98bed19a1333cdffd352c6')
