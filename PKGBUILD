# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=kamailio
pkgver=5.8.5
pkgrel=2
pkgdesc="SIP Server for large VoIP and real-time communication platforms"
arch=('x86_64')
url="https://www.kamailio.org"
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'glibc'
  'icu'
  'libunistring'
  'libxml2'
  'mariadb-libs'
  'openssl'
  'pcre2'
  'postgresql-libs'
  'python'
  'readline'
  'xz'
  'zlib'
)
makedepends=(
  'autoconf'
  'bison'
  'clang'
  'coreutils'
  'flex'
  'gcc'
  'make'
  'pkg-config'
  'sed'
)
optdepends=(
  'freeradius: for RADIUS support'
  'jansson: for JSON support'
  'libevent: for asynchronous event handling'
  'libmicrohttpd: for embedded HTTP server support'
  'mariadb: for MariaDB database support'
  'memcached: for in-memory caching'
  'mongodb: for MongoDB database support'
  'mysql: for MySQL database support'
  'radcli: for RADIUS client support'
  'redis: for in-memory data structure store'
  'rtpengine: for media proxy support'
  'libxmlrpc: for XML-RPC protocol support'
)
backup=(
  "etc/${pkgname}/kamailio.cfg"
  "etc/${pkgname}/kamctlrc"
  "etc/${pkgname}/tls.cfg"
)
source=("https://www.kamailio.org/pub/${pkgname}/latest/src/${pkgname}-${pkgver}_src.tar.gz"
        "${pkgname}.sysusers")
sha256sums=('5bad042e14ff9b4704f4cd3a8fc1866a8de1d20d35cf3ddf442727fa442614ed'
            'e2ad5c2f3213f2ce7de9524da378d062525ce99e2b401590ec0394c521a3d0c8')

_kamodules() {
  # Core Modules
  declare -a core_modules=("sl" "tm" "usrloc" "registrar")

  # Database Modules
  declare -a db_modules=("db_mysql" "db_postgres")

  # Authentication Modules
  declare -a auth_modules=("auth" "auth_db")

  # Transport Protocol Modules
  declare -a transport_modules=("tls" "websocket" "tcpops")

  # NAT Traversal Modules
  declare -a nat_modules=("nathelper" "rtpproxy")

  # Presence and IM Modules
  declare -a presence_modules=("presence" "pua")

  # Media Handling Modules
  declare -a media_modules=("rtpengine")

  # SIP Routing Modules
  declare -a routing_modules=("lcr" "drouting")

  # Security Modules
  declare -a security_modules=("permissions" "ipops")

  # Utility Modules
  declare -a utility_modules=("pv" "debugger")

  # Miscellaneous Modules
  declare -a misc_modules=("siptrace" "textops")
  # Combine all modules into a single array
  declare -a all_modules=(
    "${core_modules[@]}"
    "${db_modules[@]}"
    "${auth_modules[@]}"
    "${transport_modules[@]}"
    "${nat_modules[@]}"
    "${presence_modules[@]}"
    "${media_modules[@]}"
    "${routing_modules[@]}"
    "${security_modules[@]}"
    "${utility_modules[@]}"
    "${misc_modules[@]}"
  )

  # Print all modules as a single string
  printf "%s " "${all_modules[@]}"
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Generate build config files with the necessary modules
  local modules="$(_kamodules)"
  make include_modules="$modules" cfg

  # Update systemd service file paths
  sed -i \
    -e "s#ExecStart=/usr/sbin/${pkgname}#ExecStart=/usr/bin/${pkgname}#g" \
    -e "s#EnvironmentFile=-/etc/sysconfig/${pkgname}#EnvironmentFile=-/etc/default/${pkgname}#g" \
    pkg/${pkgname}/obs/${pkgname}.service

  # Replace paths in all files in srcdir
  find "${srcdir}" -type f -exec sed -i \
    -e 's#/usr/local#/usr#g' -e 's#lib64#lib#g' -e 's#/usr/etc#/etc#g' {} +
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Define common make options
  local makeopts=(
    BASEDIR="${pkgdir}"
    PREFIX="/usr"
    LIBDIR="lib"
    bin_dir="bin"
    cfg_target="/etc/${pkgname}"
    cfg_prefix="${pkgdir}"
    run_prefix="/run"
    run_dir="${pkgname}"
  )

  # Install files and man pages
  make "${makeopts[@]}" install
  make "${makeopts[@]}" install-man

  # Remove empty man directories
  find "${pkgdir}/usr/share/man" -type d -empty -delete

  # Install license, systemd service, sysusers, and tmpfiles configuration
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 pkg/${pkgname}/obs/${pkgname}.service "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 pkg/${pkgname}/obs/${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

# vim:set ts=2 sw=2 et:
