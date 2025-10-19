# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)


### On 2024-10-14, based on AUR package 'rsyslog', version 8.2408.0-1, by:
# Contributor: fordprefect (https://aur.archlinux.org/account/fordprefect)

_pkgname=rsyslog
pkgname="${_pkgname}-nosystemd-git"
pkgver=8.2510.0+17.r19284.20251017.590a82d1a
pkgrel=1
pkgdesc="An enhanced multi-threaded syslogd with a focus on security and reliability. Without systemd dependencies and supprt, latest git checkout."
_giturl="https://github.com/rsyslog/rsyslog"
url="http://www.rsyslog.com/"
arch=(
  'x86_64'
  'i686'
  'aarch64'
  'armv6h'
  'armv7h'
  'armv8h'
)
license=(
  'GPL-3.0-or-later'
  'LGPL-3.0-only'
  'Apache-2.0'
)
depends=(
  'curl'
  'gcc-libs'
  'glibc'
  'libestr'
  'libcap-ng.so'
  'libfastjson'
  'liblognorm'
  'libnet'
  'libpcap'
  'librelp'
  'libuuid.so'
  'xxhash'
  'zlib'
  'zstd'
)
makedepends=(
  'autoconf'
  'bison'
  'flex'
  'git'
  'gnutls'
  'libestr'
  'libfastjson'
  'libmariadbclient'
  'librelp'
  'libtool'
  'net-snmp'
  'postgresql-libs>=8.4.1'
  'python-docutils'
)
checkdepends=()
optdepends=(
  'gnutls'
  'libmariadbclient: MySQL Database Support'
  'libgcrypt'
  'libgpg-error'
  'net-snmp'
  'openssl'
  'postgresql-libs: PostgreSQL Database Support'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "${_pkgname}-nosystemd=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
backup=(
  'etc/rsyslog.conf'
  'etc/logrotate.d/rsyslog'
)
options+=(
  'strip'
  'zipman'
)
if which ccache > /dev/null 2>&1; then
  # makedepends+=('ccache')
  options+=('ccache')
fi
source=(
  # "${_pkgname}-${pkgver}.tar.gz::https://github.com/rsyslog/rsyslog/archive/v${pkgver}.tar.gz"
  "${_pkgname}::git+${_giturl}.git"
  'rsyslog.logrotate'
  'rsyslog.conf'
)

sha256sums=(
  # '686b9c55342cac7094f41906ceb4dec3c5ed9258ad699649f3177c8e953ffd58'  # rsyslog-8.2408.0.tar.gz
  'SKIP'                                                              # main git repository
  '0f5bea3fd4dff2c9f097bf95768b2e1f6e9cfd9a08eab98bc3b3b4d2ed44119a'  # rsyslog.logrotate
  'bc7ea11a697c20cdaa6730cfa0b4465cef0fec0e3f6b39aeff8deae9756aafbb'  # rsyslog.conf
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' "    > Running 'NOCONFIGURE=1 ./autogen.sh' ..."
  NOCONFIGURE=1 ./autogen.sh

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|^after-big-style-change-||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' "    > Running './configure <options>' ..."
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --disable-Werror \
              --enable-regexp \
              --enable-fmhash \
              --enable-fmhash-xxhash \
              --enable-libcap-ng \
              --disable-ffaup \
              --enable-fmunflatten \
              --disable-gssapi-krb5 \
              --disable-root-tests \
              --enable-klog \
              --enable-kmsg \
              --disable-imjournal \
              --disable-libsystemd \
              --enable-inet \
              --disable-jemalloc \
              --disable-unlimited-select \
              --disable-valgrind \
              --disable-helgrind \
              --without-valgrind-testbench \
              --enable-diagtools \
              --enable-usertools \
              --enable-mysql \
              --enable-mysql-tests \
              --enable-pgsql \
              --enable-pgsql-tests \
              --disable-libdbi \
              --enable-snmp \
              --enable-snmp-tests \
              --enable-uuid \
              --disable-elasticsearch \
              --disable-elasticsearch-tests \
              --disable-clickhouse \
              --disable-clickhouse-tests \
              --disable-omhttp \
              --enable-openssl \
              --enable-opensslcrypto \
              --enable-gnutls \
              --enable-gnutls-tests \
              --enable-libgcrypt \
              --enable-libzstd \
              --enable-rsyslogrt \
              --enable-rsyslogd \
              --enable-testbench \
              --enable-default-tests \
              --disable-extended-tests \
              --enable-mail \
              --enable-fmhttp \
              --enable-imdiag \
              --disable-mmnormalize \
              --disable-mmjsonparse \
              --disable-mmgrok \
              --disable-mmaudit \
              --disable-mmanon \
              --disable-mmrm1stspace \
              --disable-mmutf8fix \
              --disable-mmcount \
              --disable-mmsequence \
              --disable-mmdblookup \
              --disable-mmdarwin \
              --disable-mmfields \
              --disable-mmpstrucdata \
              --disable-mmrfc5424addhmac \
              --disable-omfile-hardened \
              --enable-relp \
              --enable-omrelp-default-port=514 \
              --disable-ksi-ls12 \
              --disable-liblogging-stdlog \
              --disable-rfc3195 \
              --enable-libfaketime \
              --enable-imbatchreport \
              --enable-imfile \
              --enable-imfile-tests \
              --disable-imdocker \
              --disable-imdocker-tests \
              --disable-imtuxedoulog \
              --enable-improg \
              --disable-imhttp \
              --disable-imsolaris \
              --enable-imptcp \
              --enable-impstats \
              --enable-impcap \
              --enable-omprog \
              --enable-omudpspoof \
              --enable-omstdout \
              --disable-omjournal \
              --disable-journal-tests \
              --enable-pmlastmsg \
              --enable-pmcisconames \
              --enable-pmciscoios \
              --enable-pmnull \
              --enable-pmnormalize \
              --enable-pmaixforwardedfrom \
              --enable-pmsnare \
              --enable-omruleset \
              --enable-omuxsock \
              --enable-mmsnmptrapd \
              --disable-omhdfs \
              --disable-omkafka \
              --disable-imkafka \
              --disable-kafka-static \
              --disable-kafka-tests \
              --disable-omazureeventhubs \
              --disable-qpidproton_static \
              --disable-omazureeventhubs-tests \
              --disable-ommongodb \
              --enable-imdtls \
              --enable-omdtls \
              --disable-imczmq \
              --disable-omczmq \
              --disable-omrabbitmq \
              --disable-imhiredis \
              --disable-omhiredis \
              --disable-redis-tests \
              --disable-omhttpfs \
              --disable-omamqp1 \
              --disable-omtcl \
              --disable-mmkubernetes \
              --enable-mmtaghostname \
              --enable-generate-man-pages \
              --disable-distcheck-workaround \
              --enable-year2038 \
              --with-tcl=/usr/lib \
              --without-systemdsystemunitdir

  printf '\n'
  printf '%s\n' "    > Running 'make' ..."
  make
}

# check() {
#   ### 2024-10-14: Some checks fail, another check needs root password. So we disable `check()` for now.
#   cd "${srcdir}/${_pkgname}"
# 
#   make check
# }

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' "    > Running 'make install' ..."
  make install DESTDIR="${pkgdir}"
  printf '\n'

  install -dvm770 "${pkgdir}/var/spool/rsyslog"

  install -Dvm644 "${srcdir}/${_pkgname}.conf"       "${pkgdir}/etc/${_pkgname}.conf"
  install -Dvm644 "${srcdir}/${_pkgname}.logrotate"  "${pkgdir}/etc/logrotate.d/${_pkgname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log README.md ChangeLog INSTALL AUTHORS CONTRIBUTING.md KNOWN_ISSUES
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING*
}
