# Maintainer: Artem Shustrov <artem dot shustrov at gmail dot com>
_dbtype=mysql
_pkgname=zabbix
pkgname=${_pkgname}-server-${_dbtype}
pkgver=3.0.2
pkgrel=1
pkgdesc="Zabbix is an enterprise-class open source distributed monitoring solution."
arch=("i686"
      "x86_64")
url="http://www.zabbix.com/"
license=("GPLv2")
depends=("php>=5.4.0"
         "php-gd"
         "fping"
         "traceroute"
         "net-snmp"
         "iksemel"
         "nmap"
         "sudo"
         "curl"
         "libssh2"
         "openipmi")
optdepends=("mariadb: Fast SQL database server, drop-in replacement for MySQL"
            "apache: A high performance Unix-based HTTP server"
            "php-apache: Apache SAPI for PHP"
            "shellinabox-git: Web-based ssh/telnet client")
conflicts=("${_pkgname}-server"
           "${_pkgname}-agent")
backup=("etc/${_pkgname}/${_pkgname}_server.conf"
        "etc/${_pkgname}/${_pkgname}_agentd.conf")
install="${_pkgname}-server.install"
options=("emptydirs")
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-server.install")
md5sums=("9b16ba5a69cb1c0be78d65feda61af47"
         "ff761cbdafa70b6c4b26a39b8115ac64")
sha1sums=("2de4f6f245e02786ff51747db5fad933b626387a"
          "173b60c310ae9453a0e75429b0917ad8bbf31e6f")

prepare() {
cat << EOL > "${srcdir}/${_pkgname}-server.sudoers"
# Defaults specification
Defaults visiblepw

# User privilege specification
zabbix ALL=(root) NOPASSWD: /usr/bin/nmap
zabbix ALL=(root) NOPASSWD: /usr/bin/arping
EOL

cat << EOL > "${srcdir}/${_pkgname}-server.service"
[Unit]
Description=Zabbix Server
After=syslog.target network.target mysqld.service

[Service]
User=zabbix
Type=simple
ExecStart=/usr/bin/zabbix_server
ExecReload=/usr/bin/zabbix_server -R config_cache_reload
RemainAfterExit=yes
PIDFile=/run/zabbix/zabbix_server.pid

[Install]
WantedBy=multi-user.target
EOL

cat << EOL > "${srcdir}/${_pkgname}-agentd.service"
[Unit]
Description=Zabbix Agent
After=syslog.target network.target

[Service]
User=zabbix
Type=simple
ExecStart=/usr/bin/zabbix_agentd
RemainAfterExit=yes
PIDFile=/run/zabbix/zabbix_agentd.pid

[Install]
WantedBy=multi-user.target
EOL

cat << EOL > "${srcdir}/${_pkgname}-server.logrotate"
/var/log/zabbix/zabbix_server.log {
    monthly
    rotate 12
    compress
    missingok
    notifempty
    create 0640 zabbix zabbix
    sharedscripts
}
EOL

cat << EOL > "${srcdir}/${_pkgname}-agentd.logrotate"
/var/log/zabbix/zabbix_agentd.log {
    monthly
    rotate 12
    compress
    missingok
    notifempty
    nocreate
}
EOL

cat << EOL > "${srcdir}/${_pkgname}_traps.logrotate"
/tmp/zabbix_traps.tmp {
    monthly
    rotate 12
    compress
    missingok
    notifempty
    su root root
    create 0644 zabbix zabbix
    sharedscripts
}
EOL

cat << EOL > "${srcdir}/${_pkgname}-server.tmpfiles"
d /run/zabbix 0755 zabbix zabbix
f /tmp/zabbix_traps.tmp 0644 zabbix zabbix
EOL

  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i "s/\/usr\/local\/etc/\/etc\/zabbix/g"                                  $(grep -rl "/usr/local/etc"  "conf/" "man/")
  sed -i "s/# DBSocket=\/tmp\/mysql.sock/DBSocket=\/run\/mysqld\/mysqld.sock/g" $(grep -rl "# DBSocket=/tmp" "conf/"       )
  sed -i "s/# PidFile=\/tmp/PidFile=\/run\/zabbix/g"                            $(grep -rl "# PidFile=/tmp"  "conf/"       )
  sed -i "s/LogFile=\/tmp/LogFile=\/var\/log\/zabbix/g"                         $(grep -rl "LogFile=/tmp"    "conf/"       )
  sed -i "s/\/usr\/sbin/\/usr\/bin/g"                                           $(grep -rl "/usr/sbin"       "conf/"       )
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/zabbix \
    --enable-server \
    --enable-agent \
    --enable-ipv6 \
    --with-${_dbtype} \
    --with-net-snmp \
    --with-openipmi \
    --with-openssl \
    --with-libcurl \
    --with-libxml2 \
    --with-jabber \
    --with-ssh2

  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1

  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}"
  install -dm 0755 "${pkgdir}/usr/share/${_pkgname}/snmptrap"
  install -dm 0755 "${pkgdir}/usr/share/${_pkgname}/database"
  install -dm 0755 "${pkgdir}/usr/share/${_pkgname}/zabbix_agentd"

  cp -r ${srcdir}/${_pkgname}-${pkgver}/frontends/php/* ${pkgdir}/usr/share/webapps/${_pkgname}/
  chown -R 33:33 "${pkgdir}/usr/share/webapps/${_pkgname}/"
  find ${pkgdir}/usr/share/webapps/${_pkgname}/ -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr/share/webapps/${_pkgname}/ -type d -exec chmod 755 {} \;

  for _SQLFILE in {data,images,schema}.sql
  do
    install -Dm 0644 "${srcdir}/${_pkgname}-${pkgver}/database/${_dbtype}/${_SQLFILE}" \
                     "${pkgdir}/usr/share/${_pkgname}/database/${_SQLFILE}"
  done
  for _SNMPTRAPFILE in snmptrap.sh zabbix_trap_receiver.pl
  do
    install -Dm 0755 "${srcdir}/${_pkgname}-${pkgver}/misc/snmptrap/${_SNMPTRAPFILE}" \
                     "${pkgdir}/usr/share/${_pkgname}/snmptrap/${_SNMPTRAPFILE}"
  done
  for _USERPARAMETERFILE in userparameter_{examples,mysql}.conf
  do
    install -Dm 0644 "${srcdir}/${_pkgname}-${pkgver}/conf/zabbix_agentd/${_USERPARAMETERFILE}" \
                     "${pkgdir}/usr/share/${_pkgname}/zabbix_agentd/${_USERPARAMETERFILE}"
  done
  for _LOGROTATE in ${_pkgname}{-server,-agentd,_traps}
  do
    install -Dm 0644 "${srcdir}/${_LOGROTATE}.logrotate" "${pkgdir}/etc/logrotate.d/${_LOGROTATE}"
  done
  install -dm 0750                                         "${pkgdir}/etc/sudoers.d"
  install -dm 0755                                         "${pkgdir}/run/${_pkgname}"
  install -dm 0750                                         "${pkgdir}/var/log/${_pkgname}"
  install -Dm 0640 "${srcdir}/${_pkgname}-server.sudoers"  "${pkgdir}/etc/sudoers.d/${_pkgname}-server"
  install -Dm 0644 "${srcdir}/${_pkgname}-server.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}-server.conf"
  install -Dm 0644 "${srcdir}/${_pkgname}-server.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}-server.service"
  install -Dm 0644 "${srcdir}/${_pkgname}-agentd.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}-agentd.service"
}
