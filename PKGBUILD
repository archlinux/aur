DB_TYPE='mysql'
JAVA_GATEWAY='no' # work in progress
# Set here the desired database type: 'mysql', 'postgresql' or 'sqlite3'
# Set JAVA_GATEWAY to 'yes' if you intend to use it.

# Maintainer: Arthur Țițeică / arthur dot titeica with gmail
# Contributor: Idares <idares at seznam dot cz>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>

pkgbase=zabbix3
pkgname=('zabbix3-server'
         'zabbix3-php-frontend'
         'zabbix3-agent'
         'zabbix3-java-gateway'
         'zabbix3-proxy')
pkgver=3.0.0alpha6
pkgrel=1
pkgdesc="Zabbix is an enterprise-class open source distributed monitoring solution."
arch=('i686' 'x86_64')
url='http://www.zabbix.com/'
groups='zabbix'
license=('GPL2')
source=("https://downloads.sourceforge.net/sourceforge/zabbix/zabbix-${pkgver}.tar.gz"
        "zabbix-agent.logrotate" "zabbix-proxy.logrotate" "zabbix-server.logrotate"
        "zabbix-agent.service" "zabbix-proxy.service" "zabbix-server.service" "zabbix-java-gateway.service"
        "zabbix.tmpfiles.conf")

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
  [[ $DB_TYPE = "mysql" ]]      && depends=('curl' 'openssl' 'libxml2' 'libssh2' 'net-snmp' 'libmariadbclient') # unixodbc, openipmi
  [[ $DB_TYPE = "postgresql" ]] && depends=('curl' 'openssl' 'libxml2' 'libssh2' 'net-snmp' 'postgresql-libs')
  [[ $DB_TYPE = "sqlite3" ]]    && depends=('curl' 'openssl' 'libxml2' 'libssh2' 'net-snmp' 'sqlite')
  optdepends=('mariadb' 'postgresql')
  install="zabbix-server.install"
  backup=('etc/zabbix/zabbix_server.conf')
  replaces=('zabbix-server' 'zabbix-server-mysql' 'zabbix-get')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -D src/zabbix_server/zabbix_server ${pkgdir}/usr/bin/zabbix_server # executable
  install -D src/zabbix_get/zabbix_get ${pkgdir}/usr/bin/zabbix_get # executable
  install -D -m644 conf/zabbix_server.conf ${pkgdir}/etc/zabbix/zabbix_server.conf # config
  install -D misc/snmptrap/snmptrap.sh ${pkgdir}/usr/share/zabbix/snmptrap/snmptrap.sh # scripts
  install -D -m644 misc/snmptrap/zabbix_trap_receiver.pl ${pkgdir}/usr/share/zabbix/snmptrap/zabbix_trap_receiver.pl # scripts
  install -D -m644 man/zabbix_server.man ${pkgdir}/usr/share/man/man8/zabbix_server.8 # man
  install -D -m644 man/zabbix_get.man ${pkgdir}/usr/share/man/man1/zabbix_get.1 # man
  install -d ${pkgdir}/usr/share/zabbix/${DB_TYPE}
  install -m644 database/${DB_TYPE}/*.sql -t ${pkgdir}/usr/share/zabbix/${DB_TYPE} # db files
  install -D -m644 "${srcdir}/zabbix.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/zabbix-server.conf"
  install -D -m644 "${srcdir}/zabbix-server.service" "${pkgdir}/usr/lib/systemd/system/zabbix-server.service"
  install -D -m644 "${srcdir}/zabbix-server.logrotate" "${pkgdir}/etc/logrotate.d/zabbix-server"
}

package_zabbix3-agent() {
  pkgdesc="Enterprise-class Monitoring Platform - agent"
  depends=('curl' 'openssl')
  install="zabbix-agent.install"
  backup=('etc/zabbix/zabbix_agentd.conf')
  replaces=('zabbix-agent' 'zabbix-agentd' 'zabbix-sender')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -D "src/zabbix_agent/zabbix_agentd" "${pkgdir}/usr/bin/zabbix_agentd" # executable
  install -D "src/zabbix_sender/zabbix_sender" "${pkgdir}/usr/bin/zabbix_sender" # executable
  install -D -m644 "conf/zabbix_agentd.conf" "${pkgdir}/etc/zabbix/zabbix_agentd.conf" # config
  install -d "${pkgdir}/etc/zabbix/zabbix_agentd.conf.d"
  install -D -m644 "conf/zabbix_agentd/userparameter_examples.conf" "${pkgdir}/usr/share/zabbix/zabbix_agentd/userparameter_examples.conf"
  install -D -m644 "conf/zabbix_agentd/userparameter_mysql.conf" "${pkgdir}/usr/share/zabbix/zabbix_agentd/userparameter_mysql.conf"
  install -D -m644 "man/zabbix_agentd.man" "${pkgdir}/usr/share/man/man8/zabbix_agentd.8" # man
  install -D -m644 "man/zabbix_sender.man" "${pkgdir}/usr/share/man/man1/zabbix_sender.1" # man
  install -D -m644 "${srcdir}/zabbix.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/zabbix-agent.conf"
  install -D -m644 "${srcdir}/zabbix-agent.service" "${pkgdir}/usr/lib/systemd/system/zabbix-agent.service"
  install -D -m644 "${srcdir}/zabbix-agent.logrotate" "${pkgdir}/etc/logrotate.d/zabbix-agent"
}

package_zabbix3-java-gateway() {
  pkgdesc="Enterprise-class Monitoring Platform - Java gateway"
  arch=('any')
  depends=('java-environment-openjdk' 'java-runtime-headless')
  install="zabbix-java-gateway.install"
  backup=('etc/zabbix/zabbix_java_gateway.conf')
  replaces=('zabbix-java-gateway')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -D -m644 "src/zabbix_java/settings.sh" "${pkgdir}/etc/zabbix/zabbix_java_gateway.conf" # config
  install -D -m644 "${srcdir}/zabbix.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/zabbix-java-gateway.conf"
}

package_zabbix3-php-frontend() {
  pkgdesc="Enterprise-class Monitoring Platform - PHP front-end"
  arch=('any')
  depends=('php-fpm' 'php-gd')
  optdepends=('nginx' 'apache' 'lighttpd')
  options=('!strip' 'emptydirs')
  replaces=('zabbix-php-frontend' 'zabbix-server-mysql')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -d ${pkgdir}/usr/share/webapps/zabbix # create dirs
  cp -a frontends/php/* ${pkgdir}/usr/share/webapps/zabbix
  chmod -x ${pkgdir}/usr/share/webapps/zabbix/images/general/*.gif # fix permissions
  chown 33:33 ${pkgdir}/usr/share/webapps/zabbix/conf/ # write access for http user
}

package_zabbix3-proxy() {
  pkgdesc="Enterprise-class Monitoring Platform - proxy"
  [[ $DB_TYPE = "mysql" ]]      && depends=('curl' 'openssl' 'libxml2' 'net-snmp' 'libmariadbclient') # unixodbc, openipmi
  [[ $DB_TYPE = "postgresql" ]] && depends=('curl' 'openssl' 'libxml2' 'net-snmp' 'postgresql-libs')
  [[ $DB_TYPE = "sqlite3" ]]    && depends=('curl' 'openssl' 'libxml2' 'net-snmp' 'sqlite')
  install="zabbix-proxy.install"
  backup=('etc/zabbix/zabbix_proxy.conf')
  replaces=('zabbix-proxy' 'zabbix-server-mysql')

  cd "${srcdir}"/zabbix-${pkgver}/
  install -D src/zabbix_proxy/zabbix_proxy ${pkgdir}/usr/bin/zabbix_proxy # executable
  install -D -m644 conf/zabbix_proxy.conf ${pkgdir}/etc/zabbix/zabbix_proxy.conf # config
  install -D -m644 man/zabbix_proxy.man ${pkgdir}/usr/share/man/man8/zabbix_proxy.8 # man
  install -D -m644 "${srcdir}/zabbix.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/zabbix-proxy.conf"
  install -D -m644 "${srcdir}/zabbix-proxy.service" "${pkgdir}/usr/lib/systemd/system/zabbix-proxy.service"
  install -D -m644 "${srcdir}/zabbix-proxy.logrotate" "${pkgdir}/etc/logrotate.d/zabbix-proxy"
}


md5sums=('5a09982684ae90beb4d9bb039b934684'
         'ecec6e3dff473eafcdfb4d288e1f0e22'
         'e500d8d31d8dfab2ecec9e1396098235'
         '3d6481c5f827d4ef5daca8ef547edc16'
         'ddae0a6e9e63548cb53e1b2004b6dc69'
         'a74ec7fcbdc113ead7e0c83062c66805'
         '748c4661596ef21370e3d43b461e7376'
         '5588ec58fa98bed19a1333cdffd352c6'
         'bb81847230d49bf9eb438dc74ef2d6ba')
