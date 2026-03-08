# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=kamailio
pkgver=6.1.1
pkgrel=1
pkgdesc="SIP Server for large VoIP and real-time communication platforms"
arch=('x86_64')
url="https://www.kamailio.org"
license=('GPL-2.0-or-later')

depends=(
  'bash'
  'glibc'
  'readline'
  'ncurses'
  'expat'
  'jansson'
  'libev'
)

makedepends=(
  'cmake' 'gcc' 'make' 'pkg-config' 'flex' 'bison' 'clang'
  'openssl'
  'libmariadbclient'
  'postgresql-libs'
  'sqlite'
  'python'
  'lua'
  'libxml2'
  'curl'
  'libunistring'
  'util-linux'
  'lynx' 'libxslt'
  'docbook2x'
  'docbook-xsl'
  'lksctp-tools'
)

optdepends=(
  'mariadb-libs: MySQL/MariaDB database support'
  'postgresql-libs: PostgreSQL database support'
  'sqlite: SQLite database support'
  'python: Python 3 KEMI scripting support'
  'lua: Lua KEMI scripting support'
  'curl: HTTP client support'
  'libxml2: XML operations'
  'unixodbc: ODBC database support'
  'lksctp-tools: SCTP transport support'
)

backup=(
  'etc/kamailio/kamailio.cfg'
  'etc/kamailio/kamctlrc'
  'etc/kamailio/tls.cfg'
)

source=("https://www.kamailio.org/pub/${pkgname}/latest/src/${pkgname}-${pkgver}_src.tar.gz"
        "${pkgname}.sysusers")
sha256sums=('ea26f117449bb9bd806d033c1eb90b9f625bc15319140bb3ca3d40afeed81f9a'
            'e2ad5c2f3213f2ce7de9524da378d062525ce99e2b401590ec0394c521a3d0c8')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Patch helper scripts in source to look in /usr/bin
  find utils/kamctl/ -type f -exec sed -i 's|/usr/sbin|/usr/bin|g' {} +

  local modules="acc alias_db async auth auth_db auth_diameter auth_xkeys avp avpops \
benchmark blst cfg_rpc cfgutils corex counters ctl debugger dialog dialplan dispatcher \
diversion dmq domain domainpolicy drouting enum exec file_out group htable ipops \
jsonrpcs janssonrpcc kex lcr maxfwd mediaproxy mqueue nat_traversal nathelper path pdt \
permissions pike pipelimit prefix_route presence presence_mwi presence_xml pua pua_bla \
pua_dialoginfo pua_usrloc pua_xmpp pv qos ratelimit regex registrar rls rr rtimer \
rtjson sanity sca sdpops siputils sl speeddial sqlops statistics textops textopsx \
timer tm tmx topoh tsilo uac usrloc xlog xmlrpc db_mysql db_postgres db_sqlite \
db_text db_flatstore tls websocket sctp h350 app_python3 app_lua uuid evapi \
http_client http_async_client jansson utils"

  # Configure CMake
  cmake -S . -B build \
    -DINCLUDE_MODULES="${modules}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_BINDIR=/usr/bin \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/kamailio \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man \
    -DBUILD_DOC=ON \
    -DLYNX_EXECUTABLE=/usr/bin/lynx \
    -DXSLTPROC_EXECUTABLE=/usr/bin/xsltproc \
    -DDOCBOOK2X_EXECUTABLE=/usr/bin/docbook2x-man \
    -DUSE_TCP=ON \
    -DUSE_TLS=ON \
    -DUSE_SCTP=ON \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}"

  # Patch systemd service
  if [ -f pkg/kamailio/obs/${pkgname}.service ]; then
    sed -i \
      -e "s#ExecStart=/usr/sbin/${pkgname}#ExecStart=/usr/bin/${pkgname}#g" \
      -e "s#EnvironmentFile=-/etc/sysconfig/${pkgname}#EnvironmentFile=-/etc/default/${pkgname}#g" \
      pkg/${pkgname}/obs/${pkgname}.service
  fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" cmake --install .

  # Enforce Arch Linux standard (Binaries in /usr/bin)
  if [ -d "${pkgdir}/usr/sbin" ]; then
    mv "${pkgdir}/usr/sbin/"* "${pkgdir}/usr/bin/"
    rmdir "${pkgdir}/usr/sbin"
  fi

  # Sanitize Config Paths (/usr/local -> /etc or /usr)
  # Fix tls.cfg and others (changes /usr/local/etc -> /etc)
  find "${pkgdir}/etc/kamailio" -name "*.cfg" -type f -exec sed -i 's|/usr/local/etc|/etc|g' {} +

  # Fix library paths in configs (changes /usr/local/lib -> /usr/lib)
  find "${pkgdir}/etc/kamailio" -name "*.cfg" -type f -exec sed -i 's|/usr/local/lib|/usr/lib|g' {} +

  # Fix kamctlrc specifically
  if [ -f "${pkgdir}/etc/kamailio/kamctlrc" ]; then
    sed -i "s|${srcdir}/${pkgname}-${pkgver}||g" "${pkgdir}/etc/kamailio/kamctlrc"
    sed -i 's|/usr/sbin|/usr/bin|g' "${pkgdir}/etc/kamailio/kamctlrc"
    sed -i 's|/usr/local|/usr|g' "${pkgdir}/etc/kamailio/kamctlrc"
  fi

  # Clean executable scripts in /usr/bin
  for file in kamctl kamdbctl; do
    if [ -f "${pkgdir}/usr/bin/${file}" ]; then
      sed -i "s|${srcdir}/${pkgname}-${pkgver}||g" "${pkgdir}/usr/bin/${file}"
      sed -i "s|${srcdir}||g" "${pkgdir}/usr/bin/${file}"
      sed -i 's|/usr/sbin|/usr/bin|g' "${pkgdir}/usr/bin/${file}"
    fi
  done

  # Standard Cleanup & System Integration
  find "${pkgdir}/usr/share/man" -type d -empty -delete

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
