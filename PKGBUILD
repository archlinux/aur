# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=kamailio
pkgver=5.8.4
pkgrel=2
pkgdesc="SIP Server for large VoIP and real-time communication platforms"
arch=('x86_64')
url="https://www.kamailio.org"
license=('GPL-2.0-or-later')
depends=('bash' 'glibc' 'python')
backup=("etc/kamailio/kamailio.cfg"
        "etc/kamailio/kamctlrc")
makedepends=(
  'bison'
  'dos2unix'
  'erlang'
  'expat'
  'flex'
  'jansson'
  'json-c'
  'libev'
  'libical'
  'libiodbc'
  'libmaxminddb'
  'libxml2'
  'lksctp-tools'
  'lua'
  'mariadb'
  'net-snmp'
  'openldap'
  'openssl'
  'pcre2'
  'postgresql-libs'
  'radcli'
  'readline'
  'redis'
  'sqlite'
)
optdepends=('rtpengine: the sipwise media proxy for kamailio')
options=('!emptydirs')
source=("https://www.kamailio.org/pub/kamailio/${pkgver}/src/kamailio-${pkgver}_src.tar.gz"
        "kamailio.sysusers")
sha256sums=('666e8570f98491bcf4743248f1b2c13c5171dcdb8228796cfff40b9aeba9fe91'
            'e2ad5c2f3213f2ce7de9524da378d062525ce99e2b401590ec0394c521a3d0c8')

_kamodules() {
  # To customize modules, use: "#" to disable the module(s)
  # Default: Enable all modules
  local KAMODULES=(
    # - mysql: Adds MySQL database support
    db_mysql
    # - radius: Adds Remote Authentication Dial-In User Service support
    acc_radius auth_radius misc_radius
    # - jabber: Adds Extensible Messaging and Presence Protocol support
    xmpp
    # - pua_jabber: Adds Presence User Agent integration with jabber
    pua_xmpp
    # - postgres: Adds object-relational database management system (DBMS) support
    db_postgres
    # - odbc: Adds an API for accessing DBMS support
    db_unixodbc
    # - sqlite: Adds a self-contained, serverless, zero-configuration, transactional SQL database engine
    db_sqlite
    # - sctp: Adds Stream Control Transmission Protocol support
    sctp
    # - redis: Adds in-memory key-value store support
    db_redis ndb_redis topos_redis
    # - json: Adds JavaScript Object Notation support
    json acc_json jsonrpcc
    # - pua_json: Adds support to handle presence information in JSON format
    pua_json
    # - pua: Adds a Presence User Agent that handles presence information for users
    pua pua_bla pua_dialoginfo pua_reginfo pua_rpc pua_usrloc
    # - ims: Adds IP Multimedia Subsystem support
    ims_auth ims_charging ims_dialog ims_diameter_server ims_icscf ims_ipsec_pcscf ims_isc ims_ocs ims_qos ims_registrar_pcscf ims_registrar_scscf ims_usrloc_pcscf ims_usrloc_scscf cdp cdp_avp
    # - presence: Adds tracking and sharing the availability and status of users within a communication system
    presence presence_conference presence_dialoginfo presence_mwi presence_profile presence_reginfo presence_xml
    # - snmp: Adds Simple Network Management Protocol support
    snmpstats
    # - http: Adds support to the server to interact with HTTP-based protocols and services
    http_async_client http_client
    # - ldap: Adds Lightweight Directory Access Protocol support
    ldap
    # - geoip2: Adds geographic location-based services support
    geoip2
    # - erlang: Adds support to communicate with Erlang-based applications
    erlang
    # - evapi: Adds Erlang Virtual Application Programming Interface support
    evapi
    # - xml: Adds support to handle and manipulate XML data
    xmlops
    # - lua: Adds support for scripting with the Lua programming language
    app_lua
    # - jansson: Adds support to integrate Jansson C library
    jansson
    # - standard: Adds support for core Kamailio features
    dialplan lcr outbound utils regex uuid
  )
}

build() {
  cd ${pkgname}-${pkgver}
  _kamodules
  _build_type="release" # Options: release, debug

  make mode="${_build_type}" \
    include_modules='${KAMODULES[@]}' bin_dir=bin/ cfg_target=/etc/${pkgname}/ \
    LIBDIR=lib PREFIX=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  _kamodules
  _build_type="release" # Options: release, debug

  make mode="${_build_type}" \
    include_modules='${KAMODULES[@]}' bin_dir=bin/ cfg_target=/etc/${pkgname}/ cfg_prefix="${pkgdir}" \
    BASEDIR="${pkgdir}" LIBDIR=lib PREFIX=/usr run_prefix=/run run_dir=${pkgname} install

  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 pkg/kamailio/obs/kamailio.service ${pkgdir}/usr/lib/systemd/system/kamailio.service
  install -Dm644 ${srcdir}/kamailio.sysusers ${pkgdir}/usr/lib/sysusers.d/kamailio.conf
  install -Dm644 pkg/kamailio/obs/kamailio.tmpfiles $pkgdir/usr/lib/tmpfiles.d/kamailio.conf
}

# vim:set ts=2 sw=2 et:
