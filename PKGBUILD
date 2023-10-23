# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname='proftpd'
#pkgname+='-git'
pkgver=1.3.8a
pkgrel=1
epoch='2'
pkgdesc='High-performance, scalable FTP SSL TLS and SFTP server'
arch=('x86_64' 'i686')
url='http://www.proftpd.org/'
license=('GPL')
depends=('mariadb-libs' 'postgresql-libs' 'libcap' 'pam' 'hiredis')
depends+=('libsodium' 'acl' 'perl' 'zlib' 'libxcrypt' 'libldap' 'ncurses' 'glibc' 'openssl')
backup=('etc/proftpd.conf')
options=('!emptydirs')
source=(
  "ftp://ftp.proftpd.org/distrib/source/${pkgname}-${pkgver}.tar.gz"
  'proftpd.logrotate'
  'proftpd.service'
  'proftpd.tmpfiles'
)
md5sums=('28f84d8f27380956dbb9cf4dcf606b7c'
         '4d7a3eedc1852d4fa9faafc072fb8320'
         'f7e0c3a402a845ba8d546b2801f77ed2'
         '907b149a120b046f05647c73502e23c9')
sha256sums=('56093b890a712220b09b98e29de2974a590e8fae6b36ed78c698a90945466aaf'
            'eaacf8df09c3d267cb08e962910af9cab50d1d5b007b232eb79b5240d8c5a721'
            '3a4558773ed747ab66b51551b6fc1732148e30908edc010f00a5e8675c817e64'
            '359cb8f5b30e66627929f7c50cbdd7dcc6919f7261f36eb617045210caf90abb')

_srcdir="${pkgname}-${pkgver}"
if [ "${pkgname%-git}" != "${pkgname}" ]; then
  source[0]='git+https://github.com/proftpd/proftpd.git'
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  _srcdir="${pkgname%-git}"
  makedepends+=('git')
  provides=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts=("${pkgname%-git}")
  unset epoch
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -E -e 's:([^-]*-g):r\1:' -e 's:-:.:g' -e 's:^v::g'
  set +u
}
fi

prepare() {
  set -u
  cd "${_srcdir}"
  local _f
  shopt -s nullglob
  for _f in "${startdir}"/*.localpatch; do
    patch -Nup1 -i "${_f}"
    set +u; msg2 "Patch ${_f}"; set -u
  done
  shopt -u nullglob
  set +u
}

_configure() {
  set -u
  cd "${_srcdir}"
  #CFLAGS+=' -fcommon'
  #CFLAGS+=' -fno-strict-aliasing'
  CFLAGS+=' -DOPENSSL_NO_DSA'
  local _modules=(
    'mod_digest'
    'mod_dynmasq'
    'mod_facl'
    'mod_ldap'
    'mod_quotatab'
    'mod_quotatab_file'
    'mod_quotatab_sql'
    'mod_sftp'
    'mod_sql'
    'mod_sql_mysql'
    'mod_sql_passwd'
    'mod_sql_postgres'
    'mod_tls'
    'mod_tls_shmcache'
  )
  _modules+=()
  local _m="$(printf '%s:' "${_modules[@]}")"
  local _conf=(
    --prefix='/usr'
    --sbindir='/usr/bin'
    --libexecdir='/usr/lib'
    --sysconfdir='/etc'
    --localstatedir='/run/proftpd'
    --enable-ctrls
    --enable-facl
    --enable-ipv6
    --enable-nls
    --disable-pam
    --enable-redis
    --with-includes='/usr/include/mysql:/usr/include/postgresql'
    --with-libraries='/usr/lib/mysql:/usr/lib/postgresql'
    --with-modules="${_m%:}"
    --with-systemd
    #CC=gcc-9 CXX=g++-9
  )
  ./configure "${_conf[@]}"
  cd "${srcdir}"
  set +u
}

build() {
  _configure
  set -u
  cd "${_srcdir}"
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  make -s -j1 DESTDIR="${pkgdir}" install
  sed -e 's|nogroup|nobody|g' -i "${pkgdir}/etc/proftpd.conf"

  install -Dpm644 '../proftpd.logrotate' "${pkgdir}/etc/logrotate.d/proftpd"
  install -Dpm755 'contrib/xferstats.holger-preiss' "${pkgdir}/usr/bin/ftpstats"

  install -Dpm644 '../proftpd.service' -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dpm644 '../proftpd.tmpfiles' "${pkgdir}/usr/lib/tmpfiles.d/proftpd.conf"

  # /run is tmpfs
  rmdir "${pkgdir}"/run/{proftpd,}
  set +u
}
set +u
