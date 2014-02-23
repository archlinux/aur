pkgname=zabbix-server-mysql
_pkgname=zabbix-server
pkgver=2.2.2
pkgrel=1
pkgdesc="Zabbix is an enterprise-class open source distributed monitoring solution."
arch=("i686"
      "x86_64"
     )
url="http://www.zabbix.com/"
license=("GPL")
depends=("php"
         "php-gd"
         "fping"
         "traceroute"
         "net-snmp"
         "nmap"
         "sudo"
         "curl"
         "iksemel"
         "libssh2"
        )
optdepends=("mariadb: Fast SQL database server, drop-in replacement for MySQL"
            "apache: A high performance Unix-based HTTP server"
            "php-apache: Apache SAPI for PHP"
            "shellinabox: Web-based ssh/telnet client"
           )
conflicts=("${_pkgname}"
           "zabbix-agent"
          )
backup=("etc/zabbix/zabbix_server.conf"
        "etc/zabbix/zabbix_agentd.conf"
       )
install="${_pkgname}.install"
options=("emptydirs")
source=("http://downloads.sourceforge.net/sourceforge/zabbix/zabbix-${pkgver}.tar.gz"
        "${_pkgname}.install"
       )
md5sums=("7f680ad3ef7145840e3de5c7a0f19b7c"
         "385ebe40ac42c777022ccee7543e20ca"
        )
sha1sums=("0be3f194a9ee6a9354d9f18e17b717289fe35a4f"
          "4997f1aa087e0de4869234dbacd667faf59b19d5"
         )

prepare() {
cat << EOL > "${srcdir}/${_pkgname}.sudoers"
# Defaults specification
Defaults visiblepw

# User privilege specification
zabbix ALL=(root) NOPASSWD: /usr/bin/nmap
EOL

cat << EOL > "${srcdir}/${_pkgname}.service"
[Unit]
Description=Zabbix Server
After=syslog.target network.target mysqld.service

[Service]
User=zabbix
Type=oneshot
ExecStart=/usr/bin/zabbix_server
ExecReload=/usr/bin/zabbix_server -R config_cache_reload
RemainAfterExit=yes
PIDFile=/run/zabbix/zabbix_server.pid

[Install]
WantedBy=multi-user.target
EOL

cat << EOL > "${srcdir}/zabbix-agentd.service"
[Unit]
Description=Zabbix Agent
After=syslog.target network.target

[Service]
User=zabbix
Type=oneshot
ExecStart=/usr/bin/zabbix_agentd
RemainAfterExit=yes
PIDFile=/run/zabbix/zabbix_agentd.pid

[Install]
WantedBy=multi-user.target
EOL

cat << EOL > "${srcdir}/${_pkgname}.conf"
d /run/zabbix 0755 zabbix zabbix
EOL

  cd "${srcdir}/zabbix-${pkgver}"
  sed -i "s/\/usr\/local\/etc/\/etc\/zabbix/g"                                  $(grep -rl "/usr/local/etc"  "conf/" "man/")
  sed -i "s/# DBSocket=\/tmp\/mysql.sock/DBSocket=\/run\/mysqld\/mysqld.sock/g" $(grep -rl "# DBSocket=/tmp" "conf/"       )
  sed -i "s/# PidFile=\/tmp/PidFile=\/run\/zabbix/g"                            $(grep -rl "# PidFile=/tmp"  "conf/"       )
  sed -i "s/LogFile=\/tmp/LogFile=\/var\/log\/zabbix/g"                         $(grep -rl "LogFile=/tmp"    "conf/"       )
  sed -i "s/\/usr\/sbin/\/usr\/bin/g"                                           $(grep -rl "/usr/sbin"       "conf/"       )
}

build() {
  cd "${srcdir}/zabbix-${pkgver}"

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/zabbix \
    --enable-ipv6 \
    --enable-server \
    --enable-agent \
    --with-mysql \
    --with-net-snmp \
    --with-jabber \
    --with-libcurl \
    --with-ssh2 \
    --with-libxml2

  make || return 1
}

package() {
  cd "${srcdir}/zabbix-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1

  install -dm 0755 "${pkgdir}/usr/share/webapps/zabbix"
  install -dm 0755 "${pkgdir}/etc/zabbix/database"

  cp -r ${srcdir}/zabbix-${pkgver}/frontends/php/* ${pkgdir}/usr/share/webapps/zabbix/
  chown -R 33:33 "${pkgdir}/usr/share/webapps/zabbix/"
  find ${pkgdir}/usr/share/webapps/zabbix/ -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr/share/webapps/zabbix/ -type d -exec chmod 755 {} \;

  for _SQLFILE in {data,images,schema}.sql
  do
    install -D -m 0444 "${srcdir}/zabbix-${pkgver}/database/mysql/${_SQLFILE}" \
                       "${pkgdir}/etc/zabbix/database/${_SQLFILE}"
  done
  install -dm 0750                                    "${pkgdir}/etc/sudoers.d"
  install -dm 0755                                    "${pkgdir}/run/zabbix"
  install -dm 0750                                    "${pkgdir}/var/log/zabbix"
  install -Dm 0640 "${srcdir}/${_pkgname}.sudoers"    "${pkgdir}/etc/sudoers.d/${_pkgname}"
  install -Dm 0644 "${srcdir}/${_pkgname}.conf"       "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm 0644 "${srcdir}/${_pkgname}.service"    "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm 0644 "${srcdir}/zabbix-agentd.service"  "${pkgdir}/usr/lib/systemd/system/zabbix-agentd.service"
}
