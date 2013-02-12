pkgname=zabbix-server-mysql
pkgver=2.0.5
pkgrel=1
pkgdesc="Zabbix is an enterprise-class open source distributed monitoring solution."
arch=("i686" "x86_64")
url="http://www.zabbix.com/"
license=("GPL")
depends=("apache"   "mysql" "php"  "php-apache" "php-gd"  "fping"   "traceroute"
         "net-snmp" "nmap"  "sudo" "curl"       "iksemel" "libssh2"
        )
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
md5sums=("0c0721c31889b63bce9aa556bcb927e8" # zabbix-$pkgver.tar.gz
         "dc45e84c0b2ea22f59eab03e854bfb77" # zabbix-server.service
         "53d0f295363a26e31e21722d30aec0fd" # zabbix-agentd.service
         "433c31251286f67650123fa18f7ff834" # conf.zabbix-server
         "228d6609c0f2364f1268d7b24b4756a4" # sudoers.zabbix-server
         "1bcf99ab878cb8d82d3123ee19a094d3" # zabbix-server.install
         "4699673e5135c3a7b85a228d610f451c" # frontend.diff
         "8d2fd8057acebbfcc9befef40e7dba4b" # config.diff
        )
sha1sums=("7798e5d69e0a301be3f014cc0d800c3ee153faa0" # zabbix-$pkgver.tar.gz
          "b01e845e9fc00c9eb355bbaca27fe847f3ebaaba" # zabbix-server.service
          "e1d985367c12c6d4d2d402d25fd807f148a08f08" # zabbix-agentd.service
          "4b4423af5587d59ab68ba748242183193729ec32" # conf.zabbix-server
          "5711484ecd0efc4769b975cfff77911c2044fd18" # sudoers.zabbix-server
          "33ba26c6b53ed9ab23def3a0200a45f0de799329" # zabbix-server.install
          "bc354a6f441b82119ac570ac6893053170f36953" # frontend.diff
          "3f9924827607541dfcb929da129245b54f04200d" # config.diff
         )

build() {
  cd "${srcdir}/zabbix-${pkgver}"
  patch -p1 < "${srcdir}/config.diff"

  ./configure \
    --prefix=/usr \
    --enable-ipv6 \
    --enable-server \
    --enable-agent \
    --with-mysql \
    --with-net-snmp \
    --with-jabber \
    --with-libcurl \
    --with-ssh2 \
    --sysconfdir=/etc/zabbix

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

package() {
  cd "${srcdir}/zabbix-${pkgver}"

  _HTMLPATH="${pkgdir}/srv/http/zabbix"
  _DBPATCHDIR="${pkgdir}/etc/zabbix/database/mysql/upgrade/2.0"
  _DBSETUPDIR="${pkgdir}/etc/zabbix/database/mysql/setup/2.0"
  mkdir -p "${_HTMLPATH}"
  mkdir -p "${_DBPATCHDIR}"
  mkdir -p "${_DBSETUPDIR}"

  for _UPGFILE in patch.sql rc4_rc5.sql upgrade; do
    install -D -m 0444 "upgrades/dbpatches/2.0/mysql/${_UPGFILE}" "${_DBPATCHDIR}/${_UPGFILE}"
  done
  for _SQLFILE in {data,images,schema}.sql; do
    install -D -m 0444 "database/mysql/${_SQLFILE}" "${_DBSETUPDIR}/${_SQLFILE}"
  done

  cp -r frontends/php/* "${_HTMLPATH}/"

  cd "${_HTMLPATH}/locale/"
  patch -p1 < "${srcdir}/frontend.diff"
  ./update_po.sh
  ./make_mo.sh
  cd "${pkgdir}"

  chown -R 33:33 "${_HTMLPATH}/"
  chmod -R u=rwX,g=rX,o= "${_HTMLPATH}/"

  install -D -m 0640 "${srcdir}/conf.zabbix-server"     "${pkgdir}/etc/conf.d/zabbix-server"
  install -D -m 0640 "${srcdir}/sudoers.zabbix-server"  "${pkgdir}/etc/sudoers.d/zabbix-server"
  install -D -m 0644 "${srcdir}/zabbix-server.service"  "${pkgdir}/usr/lib/systemd/system/zabbix-server.service"
  install -D -m 0644 "${srcdir}/zabbix-agentd.service"  "${pkgdir}/usr/lib/systemd/system/zabbix-agentd.service"
  install -d -m 0750                                    "${pkgdir}/var/run/zabbix"
  install -d -m 0750                                    "${pkgdir}/var/log/zabbix"
}
