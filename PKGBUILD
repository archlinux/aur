pkgname=zabbix-server-mysql
pkgver=2.0.6
pkgrel=2
pkgdesc="Zabbix is an enterprise-class open source distributed monitoring solution."
arch=("i686"
      "x86_64"
     )
url="http://www.zabbix.com/"
license=("GPL")
depends=("apache>=2"
         "mariadb>=5.5"
         "php"
         "php-apache"
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
optdepends=("shellinabox: web-based ssh client")
conflicts=("zabbix-server"
           "zabbix-agent"
          )
backup=("etc/zabbix/zabbix_server.conf"
        "etc/zabbix/zabbix_agentd.conf"
        "etc/conf.d/zabbix-server"
       )
install="zabbix-server.install"
options=("emptydirs")
source=("http://downloads.sourceforge.net/sourceforge/zabbix/zabbix-${pkgver}.tar.gz"
        "zabbix-server.service"
        "zabbix-agentd.service"
        "conf.zabbix-server"
        "sudoers.zabbix-server"
        "zabbix-server.install"
        "frontend.diff"
        "config.diff"
       )
md5sums=("f7261987731dd74b58cb1da890655ddc" # zabbix-$pkgver.tar.gz
         "e365377bbe269cac640a096204605c6b" # zabbix-server.service
         "2f0476fc3d6c9618fb2265991656ab59" # zabbix-agentd.service
         "433c31251286f67650123fa18f7ff834" # conf.zabbix-server
         "228d6609c0f2364f1268d7b24b4756a4" # sudoers.zabbix-server
         "99a25ef72b46e5729b80634c85c438ce" # zabbix-server.install
         "4699673e5135c3a7b85a228d610f451c" # frontend.diff
         "651e284397532f500b92c34bb0a2feda" # config.diff
        )
sha1sums=("75a747ddcfa4bcd5792f69dc8d7de9c5839b8595" # zabbix-$pkgver.tar.gz
          "2137bee9c763e62914e9b267cfb014c7f6130cba" # zabbix-server.service
          "b0729a353349e965d0a5fb83b2d017137071007f" # zabbix-agentd.service
          "4b4423af5587d59ab68ba748242183193729ec32" # conf.zabbix-server
          "5711484ecd0efc4769b975cfff77911c2044fd18" # sudoers.zabbix-server
          "2959c2198b99523e623e6f9cdb3061d4ac6e48e8" # zabbix-server.install
          "bc354a6f441b82119ac570ac6893053170f36953" # frontend.diff
          "82239b23cfb4f8f43d9a5a33f77e58103e567af4" # config.diff
         )

build() {
  cd "${srcdir}/zabbix-${pkgver}"
  patch -p1 < "${srcdir}/config.diff"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/zabbix \
    --enable-ipv6 \
    --enable-server \
    --enable-agent \
    --with-mysql \
    --with-net-snmp \
    --with-jabber \
    --with-libcurl \
    --with-ssh2

  make || return 1
}

package() {
  cd "${srcdir}/zabbix-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1

  mkdir -p "${pkgdir}/usr/share/webapps/zabbix"
  mkdir -p "${pkgdir}/etc/zabbix/database/mysql/upgrade/2.0"
  mkdir -p "${pkgdir}/etc/zabbix/database/mysql/setup/2.0"

  cp -r ${srcdir}/zabbix-${pkgver}/frontends/php/* ${pkgdir}/usr/share/webapps/zabbix/

  cd "${pkgdir}/usr/share/webapps/zabbix/locale/"
  patch -p1 < "${srcdir}/frontend.diff"
  ./update_po.sh
  ./make_mo.sh
  cd "${pkgdir}"

  chown -R 33:33 "${pkgdir}/usr/share/webapps/zabbix/"
  find ${pkgdir}/usr/share/webapps/zabbix/ -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr/share/webapps/zabbix/ -type d -exec chmod 755 {} \;

  for _UPGFILE in patch.sql rc4_rc5.sql upgrade
  do
    install -D -m 0444 "${srcdir}/zabbix-${pkgver}/upgrades/dbpatches/2.0/mysql/${_UPGFILE}" \
                       "${pkgdir}/etc/zabbix/database/mysql/upgrade/2.0/${_UPGFILE}"
  done
  for _SQLFILE in {data,images,schema}.sql
  do
    install -D -m 0444 "${srcdir}/zabbix-${pkgver}/database/mysql/${_SQLFILE}" \
                       "${pkgdir}/etc/zabbix/database/mysql/setup/2.0/${_SQLFILE}"
  done
  install -d -m 0750                                    "${pkgdir}/etc/sudoers.d/"
  install -d -m 0755                                    "${pkgdir}/run/zabbix"
  install -d -m 0750                                    "${pkgdir}/var/log/zabbix"
  install -D -m 0640 "${srcdir}/conf.zabbix-server"     "${pkgdir}/etc/conf.d/zabbix-server"
  install -D -m 0640 "${srcdir}/sudoers.zabbix-server"  "${pkgdir}/etc/sudoers.d/zabbix-server"
  install -D -m 0644 "${srcdir}/zabbix-server.service"  "${pkgdir}/usr/lib/systemd/system/zabbix-server.service"
  install -D -m 0644 "${srcdir}/zabbix-agentd.service"  "${pkgdir}/usr/lib/systemd/system/zabbix-agentd.service"
}
