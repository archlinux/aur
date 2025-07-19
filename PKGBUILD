# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

#_opt_OpenSSL='-1.1'
_opt_OpenSSL=''

set -u
pkgname='proftpd'
#pkgname+='-git'
pkgver=1.3.9
pkgrel=1
epoch='2'
pkgdesc='High-performance, scalable FTP SSL TLS and SFTP server'
arch=('x86_64' 'i686')
url='http://www.proftpd.org/'
license=('GPL')
if [[ "${pkgver}" =~ ^([.0-9]+)([a-z])$ ]]; then
  _pkgvercmp="${BASH_REMATCH[1]}.${BASH_REMATCH[2]}" # we promote 1.3.8c -> 1.3.8.c to vercmp greater than 1.3.8
else
  _pkgvercmp="${pkgver}" # We don't modify 1.3.8rc1 to vercmp less than 1.3.8
fi
if [ "$(vercmp "${_pkgvercmp}" "1.3.8")" -lt 0 ]; then
  _opt_OpenSSL='-1.1'
fi
depends=('mariadb-libs' 'postgresql-libs' 'libcap' 'pam' 'hiredis')
depends+=('libsodium' 'acl' 'perl' 'zlib' 'libxcrypt' 'libldap' 'ncurses' 'glibc' "openssl${_opt_OpenSSL}")
backup=(
  'etc/proftpd.conf'
  'etc/dhparams.pem' # moduli
  'etc/blacklist.dat'
)
options=('!emptydirs')
_srcdir="${pkgname}-${pkgver}"
source=(
  "${_srcdir}.tar.gz::https://github.com/proftpd/proftpd/archive/refs/tags/v${pkgver}.tar.gz"
  #"ftp://ftp.proftpd.org/distrib/source/${_srcdir}.tar.gz"
  'proftpd.logrotate'
  'proftpd.service'
  'proftpd.tmpfiles'
)
md5sums=('760b2bf912e4ac26b5f1aa9d25b440c6'
         '4d7a3eedc1852d4fa9faafc072fb8320'
         'f7e0c3a402a845ba8d546b2801f77ed2'
         '907b149a120b046f05647c73502e23c9')
sha256sums=('4a5f13b666226813b4da0ade34535d325e204ab16cf8008c7353b1b5a972f74b'
            'eaacf8df09c3d267cb08e962910af9cab50d1d5b007b232eb79b5240d8c5a721'
            '3a4558773ed747ab66b51551b6fc1732148e30908edc010f00a5e8675c817e64'
            '359cb8f5b30e66627929f7c50cbdd7dcc6919f7261f36eb617045210caf90abb')

_cherries=(
#CHERRIES
)

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

# @eomanis: 0.0.0 to 0.0.0a is seen as a downgrade, not an upgrade by vercmp because 0.0.0 is an upgrade to 0.0.0alpha or 0.0.0rc1.
# The version is not equal so increasing pkgrel has no effect.
#true && pkgver="${_pkgvercmp}" # This promotes 1.3.8a to 1.3.8.a to fix vercmp. This would make all lettered versions differ from other distros and would likely make Repology paint our dotted version in black as bogus.
if [[ "${pkgver}" =~ ^[.0-9]+$ ]]; then
  pkgver+='A' # promote 1.3.8 -> 1.3.8A to make vercmp more than 1.3.7f and less than 1.3.8a. This makes all release versions match other distros except for the first non lettered release. This minimizes how often our version is bogus as the first point release may be broken enough to rerelease within a few days like 1.3.7 -> 1.3.7a.
fi

prepare() {
  set -u
  cd "${_srcdir}"
  local _f
  shopt -s nullglob
  for _f in "${startdir}"/*.localpatch; do
    set +u; msg2 "Patch ${_f}"; set -u
    patch -Nup1 -i "${_f}"
  done
  shopt -u nullglob
  sed -E -e '/^#define SFTP_DH_PREF_MIN_LEN/ s:2048:3072:g' -i 'contrib/mod_sftp/kex.c' # update group-exchange to modern standards
  local _allcrypto=(
    -e '/ciphers\[\] =/,/^}/ s:,\s*FALSE\s*,:,/* patched */TRUE,:'
    -e '/digests\[\] =/,/^}/ s:,\s*FALSE\s*,:,/* patched */TRUE,:'
  )
  #sed -E "${_allcrypto[@]}" -i 'contrib/mod_sftp/crypto.c'
  if [ "${pkgname%-git}" != "${pkgname}" ]; then
    local _cherry
    for _cherry in "${_cherries[@]}"; do
      set +u; msg2 "Cherry-pick ${_cherry}"; set -u
      git cherry-pick -n "${_cherry}"
    done
  fi
  if ! :; then
    local _bool
    readarray -t _bool < <(grep --include="*.c" -lre '\bbool\b' .)
    if [ "${#_bool[@]}" -gt 0 ]; then
      sed -e '/\btrue\b/! s:\bbool\b:z&:g' -i "${_bool[@]}" # gcc-15 -std=gnu23 https://github.com/proftpd/proftpd/commit/61be7eb14f200b97804a3cfa85fed51661067c62
    fi
  fi
  set +u
}

_configure() {
  set -u
  cd "${_srcdir}"
  #CFLAGS="${CFLAGS/-march=x86-64/-march=native}"
  #CXXFLAGS="${CXXFLAGS/-march=x86-64/-march=native}"
  if [ "$(vercmp "${_pkgvercmp}" '1.3.7')" -lt 0 ]; then
    CFLAGS+=' -fcommon'
  fi
  #CFLAGS+=' -fno-strict-aliasing'
  CFLAGS+=' -DOPENSSL_NO_DSA'
  #CFLAGS+=' -std=gnu17'
  local _modules=(
    'mod_digest'
    'mod_dynmasq'
    'mod_facl'
    'mod_quotatab'
    'mod_quotatab_file'
    'mod_sftp'
    'mod_tls'
    'mod_tls_shmcache'
  )
  if [ -z "${_opt_OpenSSL}" ]; then
    _modules+=( # these link to latest OpenSSL so cannot be used if using an old version
      'mod_quotatab_sql'
      'mod_sql'
      'mod_sql_passwd'
      'mod_ldap'
      'mod_sql_mysql'
      'mod_sql_postgres'
      )
  fi
  _modules+=('mod_ifsession') # must be last
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
  if [ ! -z "${_opt_OpenSSL}" ]; then
    _conf+=(--with-openssl-cmdline="/usr/bin/openssl${_opt_OpenSSL}")
    #LIBS+=" -lopenssl${_opt_OpenSSL}"
    LDFLAGS+=" -L/usr/lib/openssl${_opt_OpenSSL}"
    CPPFLAGS+=" -I/usr/include/openssl${_opt_OpenSSL}"
  fi
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
