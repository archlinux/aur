# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

# TODO: Replace rc.d with systemd services

set -u
pkgname='pmacct'
#pkgname+='-git'
pkgver=1.7.5
_pkgver="${pkgver%%.r[0-9]*}"
_pkgverb="${_pkgver%%.[a-z]*}"
_pkgverb="${_pkgverb%%[a-z]*}"
pkgrel=1
pkgdesc='Accounting and aggregation toolsuite for IPv4 and IPv6 able to collect data through libpcap, Netlink/ULOG, Netflow and sFlow'
arch=('i686' 'x86_64')
url='http://www.pmacct.net/'
license=('GPL2')
depends=('libpcap' 'libmariadbclient' 'postgresql-libs' 'sqlite3')
_verwatch=("${url}" "${url}${pkgname%-git}-\([0-9\.]\+\)\.tar\.gz" 'l')
_srcdir="${pkgname%-git}-${_pkgver%%[a-z]*}"
source=(
  "${url}${pkgname%-git}-${_pkgver}.tar.gz"
  'pmacctd.rc.d'
  'nfacctd.rc.d'
  'sfacctd.rc.d'
  'uacctd.rc.d'
)
md5sums=('4ce9e8f38ce37d3c60bfa3d66e0d5184'
         '3b9313a756b75b4b571b17693db0ae04'
         'f732e33cbccba5a492d2ee95b5f88221'
         '235c1e77690fbe939a69c98dad041203'
         '9a49065076b645df94e30278052a8796')
sha256sums=('2e778bd3cdd968c4b9f22e28008b9b72f229980201d2cc2ee04cb02f6b0bdcd5'
            '504b31e1a3ccc6ab9fd56960800e6146cae69c479d1a87a5f491042c382e4384'
            '143e7b83d15df723e2668383efb108e458818b47fdd62a6201b159a5430379e7'
            '990915185774ccb6f167433f1f4a4c415dc60fcaaee2af9d9239dfafefcb8166'
            'dbfd2210e9e96d672483916c3c2dd38a58c1725920823a7221a2a2cd3f43c48a')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  _srcdir="${pkgname%-git}"
  source[0]="${_srcdir}::git://github.com/pmacct/pmacct.git"
  #source[0]+="#branch=${_pkgverb}"
  makedepends+=('git')
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  provides=("${pkgname%-git}=${_pkgver}")
  conflicts=("${pkgname%-git}")
pkgver() {
  set -u
  cd "${_srcdir}"
  local _gver
  _gver="$(git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g')"
  local _clver="$(grep -m1 -hE -e '^[0-9.]{5}[^ ]* +--' 'ChangeLog')"
  _clver="${_clver%% *}"
  if [ ! -z "${_clver}" ] && [ "$(vercmp "${_clver}" "${_gver}")" -gt 0 ]; then
    printf '%s.r%s' "${_clver}" "${_gver##*.r}"
  else
    printf '%s' "${_gver}"
  fi
  set +u
}
elif [ "${_pkgver}" != "${pkgver}" ]; then
pkgver() {
  printf '%s' "${_pkgver}"
}
fi

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    ./autogen.sh
  fi
  if [ ! -s 'Makefile' ]; then
    if [ "$(vercmp "${_pkgverb}" '1.7.4')" -ge 0 ]; then
      CFLAGS+=' -fcommon' # gcc-10
    fi
    ./configure --prefix='/usr' --mandir='/usr/share/man' --sbindir='/usr/bin' --enable-ipv6 --enable-mysql --enable-pgsql --enable-sqlite3 --enable-64bit --enable-threads --enable-jansson
  fi
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  if [ -z "${MAKEFLAGS:=}" ] || [ "${MAKEFLAGS//-j/}" = "${MAKEFLAGS}" ]; then
    MAKEFLAGS+=" -j${_nproc}"
  fi
  nice make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s -j1 DESTDIR="${pkgdir}" install

  # configuration examples
  install -Dpm644 'examples/pmacctd-imt.conf.example' "${pkgdir}/etc/pmacct/pmacctd.conf"
  install -Dpm644 examples/*.example -t "${pkgdir}/etc/pmacct/examples/"

  # rc.d scripts
  install -Dpm755 "${srcdir}/sfacctd.rc.d" "${pkgdir}/etc/rc.d/sfacctd"
  install -Dpm755 "${srcdir}/nfacctd.rc.d" "${pkgdir}/etc/rc.d/nfacctd"
  install -Dpm755 "${srcdir}/nfacctd.rc.d" "${pkgdir}/etc/rc.d/uacctd"
  install -Dpm755 "${srcdir}/pmacctd.rc.d" "${pkgdir}/etc/rc.d/pmacctd"
  sed -e 's:/sbin/:/bin/:g' -i "${pkgdir}/etc/rc.d"/*

  # sh and sql scripts
  install -Dpm644 sql/*.mysql -t "${pkgdir}/usr/share/pmacct/mysql/"
  install -Dpm644 sql/*.pgsql -t "${pkgdir}/usr/share/pmacct/pgsql/"
  install -Dpm644 sql/*.sqlite3 -t "${pkgdir}/usr/share/pmacct/sqlite3/"
  #install -Dpm744 "/examples"/*.sh -t "${pkgdir}/usr/share/pmacct/sh/"

  # documentation
  install -Dpm644 sql/README.* -t "${pkgdir}/usr/share/doc/pmacct/"
  install -Dpm644 docs/* -t "${pkgdir}/usr/share/doc/pmacct/" || :
  cp -p 'AUTHORS' 'ChangeLog' 'CONFIG-KEYS' 'COPYING' 'QUICKSTART' 'FAQS' 'UPGRADE' -t "${pkgdir}/usr/share/doc/pmacct/"
  #cp -p 'KNOWN-BUGS' 'README' 'TODO' -t "${pkgdir}/usr/share/doc/pmacct/" || :
  # EXAMPLES changed to QUICKSTART
  set +u
}

set +u
