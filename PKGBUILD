# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=kamailio
pkgver=6.0.4
pkgrel=1
pkgdesc="SIP Server for large VoIP and real-time communication platforms"
arch=('x86_64')
url="https://www.kamailio.org"
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'glibc'
  'python'
  'readline'
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
  'cmake'
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
backup=("etc/${pkgname}/kamailio.cfg"
        "etc/${pkgname}/kamctlrc")
source=("https://www.kamailio.org/pub/${pkgname}/latest/src/${pkgname}-${pkgver}_src.tar.gz"
        "${pkgname}.sysusers")
sha256sums=('df83ecde2d6d9d255cfc92c18d2457198f19452997846a8dcb7bfe7376aeb6e6'
            'e2ad5c2f3213f2ce7de9524da378d062525ce99e2b401590ec0394c521a3d0c8')

_kamodules() {
  local groups=("MOD_LIST_BASIC" "MOD_LIST_EXTRA" "MOD_LIST_DB")
  local modules=()
  for group in "${groups[@]}"; do
    modules+=($(cmake --build . --target list_modules -- -DCMAKE_BUILD_GROUP=${group}))
  done
  printf "%s " "${modules[@]}"
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local modules="$(_kamodules)"
  # Generate build config files with the necessary modules
  cmake -S . -B build -DINCLUDE_MODULES="$modules" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_BINDIR=/usr/bin \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/kamailio \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man

  # Update systemd service file paths
  sed -i \
    -e "s#ExecStart=/usr/sbin/${pkgname}#ExecStart=/usr/bin/${pkgname}#g" \
    -e "s#EnvironmentFile=-/etc/sysconfig/${pkgname}#EnvironmentFile=-/etc/default/${pkgname}#g" \
    pkg/${pkgname}/obs/${pkgname}.service
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make all
  make man
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" make install

  # Remove empty man directories
  find "${pkgdir}/usr/share/man" -type d -empty -delete

  # Install license, systemd service, sysusers, and tmpfiles
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/pkg/${pkgname}/obs/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/pkg/${pkgname}/obs/${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

# vim:set ts=2 sw=2 et:
