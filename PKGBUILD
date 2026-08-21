# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=kamailio
pkgver=6.1.4
pkgrel=1
pkgdesc="SIP Server for large VoIP and real-time communication platforms"
arch=('x86_64')
url="https://www.kamailio.org"
license=('GPL-2.0-or-later')

depends=(
  'bash' 'glibc' 'readline' 'ncurses' 'expat' 'jansson' 'libev'
)

makedepends=(
  'cmake' 'gcc' 'make' 'pkg-config' 'flex' 'bison' 'clang'
  'openssl' 'libmariadbclient' 'postgresql-libs' 'sqlite'
  'python' 'lua' 'libxml2' 'curl' 'libunistring' 'util-linux'
  'lynx' 'libxslt' 'docbook2x' 'docbook-xsl' 'lksctp-tools'
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

install="${pkgname}.install"

source=("https://www.kamailio.org/pub/${pkgname}/latest/src/${pkgname}-${pkgver}_src.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('290624b6624edc230af0fc458fb7e481e64b893be7cb5084398e587942992e0a'
            'cbc0d7510a52791cb2016d91df9543433f3b8467efec196ed06d025ba5f8a0fa'
            'edcbe39e6c5c368109e791693302dfc41c1b63f654eb6311281a8bdfc4adfbf3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Patch helper scripts in source to look in /usr/bin
  find utils/kamctl/ -type f -exec sed -i 's|/usr/sbin|/usr/bin|g' {} +

  # Patch systemd service
  if [ -f "pkg/${pkgname}/obs/${pkgname}.service" ]; then
    sed -i \
      -e "s#ExecStart=/usr/sbin/${pkgname}#ExecStart=/usr/bin/${pkgname}#g" \
      -e "s#EnvironmentFile=-/etc/sysconfig/${pkgname}#EnvironmentFile=-/etc/default/${pkgname}#g" \
      "pkg/${pkgname}/obs/${pkgname}.service"
  fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local modules='acc;alias_db;async;auth;auth_db;avpops;benchmark;blst;cfg_rpc;cfgutils;corex;counters;ctl;debugger;dialog;dialplan;dispatcher;dmq;domain;domainpolicy;drouting;enum;exec;group;htable;ipops;jansson;jsonrpcs;kex;lcr;maxfwd;mqueue;nathelper;path;pdt;permissions;pike;pipelimit;prefix_route;pv;ratelimit;regex;registrar;rls;rr;rtimer;sanity;sca;sdpops;siputils;sl;speeddial;sqlops;statistics;textops;tm;tmx;topoh;uac;usrloc;xlog;db_mysql;db_postgres;db_sqlite;tls;websocket;sctp;app_python3;app_lua'

  local cmake_options=(
    -B build
    -S .
    -Wno-dev
    -DCMAKE_BUILD_TYPE=None
    -DINCLUDE_MODULES="${modules}"
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
    -DCMAKE_INSTALL_BINDIR=/usr/bin
    -DCMAKE_INSTALL_SBINDIR=/usr/bin
    -DCMAKE_INSTALL_SYSCONFDIR=/etc
    -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/kamailio
    -DCMAKE_INSTALL_MANDIR=/usr/share/man
    -DBUILD_DOC=ON
    -DLYNX_EXECUTABLE=/usr/bin/lynx
    -DXSLTPROC_EXECUTABLE=/usr/bin/xsltproc
    -DDOCBOOK2X_EXECUTABLE=/usr/bin/docbook2x-man
    -DUSE_TCP=ON
    -DUSE_TLS=ON
    -DUSE_SCTP=ON
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}"
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}"
  )

  # Configure and build
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  DESTDIR="${pkgdir}" cmake --install build

  # Enforce Arch Linux standard (Binaries in /usr/bin)
  if [ -d "${pkgdir}/usr/sbin" ]; then
    mv "${pkgdir}/usr/sbin/"* "${pkgdir}/usr/bin/"
    rmdir "${pkgdir}/usr/sbin"
  fi

  # Sanitize Config Paths (/usr/local -> /etc or /usr)
  find "${pkgdir}/etc/kamailio" -name "*.cfg" -type f -exec sed -i 's|/usr/local/etc|/etc|g' {} +
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

  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "pkg/${pkgname}/obs/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  install -Dm644 "${srcdir}/${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

# vim:set ts=2 sw=2 et:
