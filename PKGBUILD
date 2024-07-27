# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=kamailio
pkgver=5.8.2
pkgrel=4
pkgdesc='SIP Server for large VoIP and real-time communication platforms'
arch=('x86_64')
url='https://www.kamailio.org'
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'openssl')
backup=(
  'etc/kamailio/kamailio.cfg'
  'etc/kamailio/kamctlrc'
)
makedepends=(
  'bison'
  'flex'
  'dos2unix'
  'erlang'
  'pcre2'
  'libical'
  'mariadb'
  'radcli'
  'postgresql-libs'
  'expat'
  'libiodbc'
  'lksctp-tools'
  'redis'
  'openldap'
  'sqlite'
  'net-snmp'
  'libxml2'
  'jansson'
  'json-c'
  'lua'
  'libmaxminddb'
  'libev'
)
optdepends=('rtpengine: the sipwise media proxy for kamailio')
options=('!emptydirs')
source=("https://www.kamailio.org/pub/kamailio/${pkgver}/src/kamailio-${pkgver}_src.tar.gz"
        'kamailio.sysusers')
sha256sums=('8ca813d9dd338e8e83ae9b1ad8f316b9908fb432af9da1ea55ed3a9744df3faa'
            'e2ad5c2f3213f2ce7de9524da378d062525ce99e2b401590ec0394c521a3d0c8')

package() {
  cd "${pkgname}-${pkgver}"

  # Enable all modules
  local KAMODULES=(
    # mysql
    db_mysql
    # radius
    acc_radius auth_radius misc_radius
    # jabber
    xmpp
    # pua_jabber
    pua_xmpp
    # postgres
    db_postgres
    # odbc
    db_unixodbc
    # sqlite
    db_sqlite
    # sctp
    sctp
    # redis
    db_redis ndb_redis topos_redis
    # json
    json acc_json jsonrpcc
    # pua_json
    pua_json
    # pua
    pua pua_bla pua_dialoginfo pua_reginfo pua_rpc pua_usrloc
    # ims
    ims_auth ims_charging ims_dialog ims_diameter_server ims_icscf ims_ipsec_pcscf ims_isc ims_ocs ims_qos ims_registrar_pcscf ims_registrar_scscf ims_usrloc_pcscf ims_usrloc_scscf cdp cdp_avp
    # presence
    presence presence_conference presence_dialoginfo presence_mwi presence_profile presence_reginfo presence_xml
    # snmp
    snmpstats
    # http
    http_async_client http_client
    # ldap
    ldap
    # geoip2
    geoip2
    # erlang
    erlang
    # evapi
    evapi
    # xml
    xmlops
    # lua
    app_lua
    # jansson
    jansson
    # standard
    dialplan lcr outbound utils regex uuid
  )

  make PREFIX=/usr bin_dir=bin/ LIBDIR=lib cfg_prefix="${pkgdir}" \
    BASEDIR="${pkgdir}" run_prefix=/run run_dir=${pkgname} cfg_target=/etc/${pkgname}/ \
    include_modules='${KAMODULES[@]}' install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 pkg/kamailio/obs/kamailio.service "$pkgdir/usr/lib/systemd/system/kamailio.service"
  install -Dm644 "${srcdir}/kamailio.sysusers" "${pkgdir}/usr/lib/sysusers.d/kamailio.conf"
  install -Dm644 pkg/kamailio/obs/kamailio.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/kamailio.conf"
}

# vim:set ts=2 sw=2 et:
