# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

set -u
pkgname='pmacct'
pkgver='0.14.0'
pkgrel='1'
pkgdesc='Accounting and aggregation toolsuite for IPv4 and IPv6 able to collect data through libpcap, Netlink/ULOG, Netflow and sFlow'
arch=('i686' 'x86_64')
url='http://www.pmacct.net/'
license=('GPL2')
depends=('libpcap' 'libmysqlclient' 'postgresql-libs' 'sqlite3')
source=("http://www.pmacct.net/${pkgname}-${pkgver}.tar.gz"
        'pmacctd.rc.d' \
        'nfacctd.rc.d' \
        'sfacctd.rc.d' \
        'uacctd.rc.d')
sha256sums=('c4b4ed5608c600910bd580f92faefd8d3af0f6d5c4aabddb5ce31c6d192e0336'
            '504b31e1a3ccc6ab9fd56960800e6146cae69c479d1a87a5f491042c382e4384'
            '143e7b83d15df723e2668383efb108e458818b47fdd62a6201b159a5430379e7'
            '990915185774ccb6f167433f1f4a4c415dc60fcaaee2af9d9239dfafefcb8166'
            'dbfd2210e9e96d672483916c3c2dd38a58c1725920823a7221a2a2cd3f43c48a')
prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr' --mandir='/usr/share/man' --enable-ipv6 --enable-mysql --enable-pgsql --enable-sqlite3 --enable-64bit --enable-threads
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j $(nproc) # not big enough for multi processors
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/etc/pmacct/examples" "${pkgdir}/usr/share/pmacct"/{mysql,pgsql,sqlite3,sh} "${pkgdir}/usr/share/doc/pmacct"

  # configuration examples
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/examples/pmacctd-imt.conf.example" "${pkgdir}/etc/pmacct/pmacctd.conf"
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/examples"/*.example -t "${pkgdir}/etc/pmacct/examples/"

  # rc.d scripts
  install -Dpm755 "${srcdir}/sfacctd.rc.d" "${pkgdir}/etc/rc.d/sfacctd"
  install -Dpm755 "${srcdir}/nfacctd.rc.d" "${pkgdir}/etc/rc.d/nfacctd"
  install -Dpm755 "${srcdir}/nfacctd.rc.d" "${pkgdir}/etc/rc.d/uacctd"
  install -Dpm755 "${srcdir}/pmacctd.rc.d" "${pkgdir}/etc/rc.d/pmacctd"
  sed -i -e 's:/sbin/:/bin/:g' "${pkgdir}/etc/rc.d"/*

  # sh and sql scripts
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/sql"/*.mysql -t "${pkgdir}/usr/share/pmacct/mysql/"
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/sql"/*.pgsql -t "${pkgdir}/usr/share/pmacct/pgsql/"
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/sql"/*.sqlite3 -t "${pkgdir}/usr/share/pmacct/sqlite3/"
  install -Dpm744 "${srcdir}/${pkgname}-${pkgver}/examples"/*.sh -t "${pkgdir}/usr/share/pmacct/sh/"

  # documentation
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/sql"/README.* -t "${pkgdir}/usr/share/doc/pmacct/"
  install -Dpm644 "${srcdir}/${pkgname}-${pkgver}/docs"/* -t "${pkgdir}/usr/share/doc/pmacct/"
  cp -p 'AUTHORS' 'ChangeLog' 'CONFIG-KEYS' 'COPYING' 'EXAMPLES' 'FAQS' 'KNOWN-BUGS' 'README' 'TODO' 'TOOLS' 'UPGRADE' -t "${pkgdir}/usr/share/doc/pmacct/"

  # Ensure there are no forbidden paths (git-aurcheck)
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"

  set +u
}

set +u
