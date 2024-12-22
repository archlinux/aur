# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname="kamailio"
pkgver="5.8.4"
pkgrel="3"
pkgdesc="SIP Server for large VoIP and real-time communication platforms"
arch=('x86_64')
url="https://www.kamailio.org"
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'glibc'
  'pcre2'
  'python'
  'readline'
)
makedepends=(
  'bison'
  'dos2unix'
  'erlang'
  'expat'
  'flex'
  'gcc'
  'json-c'
  'libical'
  'libiodbc'
  'lua'
  'net-snmp'
  'radcli'
)
optdepends=(
  'jansson: JSON support'
  'libev: Event library support'
  'libmaxminddb: MaxMindDB support'
  'libxml2: XML support'
  'lksctp-tools: SCTP support'
  'mariadb-libs: MariaDB support'
  'openldap: LDAP support'
  'openssl: SSL/TLS support'
  'postgresql-libs: PostgreSQL support'
  'redis: Redis support'
  'rtpengine: The Sipwise media proxy for Kamailio'
  'sqlite: SQLite support'
)
backup=("etc/kamailio/kamailio.cfg"
        "etc/kamailio/kamctlrc")
options=('!emptydirs' '!makeflags')
source=("https://www.kamailio.org/pub/kamailio/${pkgver}/src/kamailio-${pkgver}_src.tar.gz"
        "kamailio.sysusers")
sha256sums=('666e8570f98491bcf4743248f1b2c13c5171dcdb8228796cfff40b9aeba9fe91'
            'e2ad5c2f3213f2ce7de9524da378d062525ce99e2b401590ec0394c521a3d0c8')

_kamodules() {
  # To customize modules, use "#" to disable the module(s)
  # Default: Enable all modules
  local KAMODULES=(
    "standard"     # Standard modules with no dependencies
    "standard-dep" # Standard modules with dependencies
    "stable"       # Stable modules for specific or niche applications
    "experimental" # Experimental modules that are incomplete or untested
  )
}

build() {
  cd "${pkgname}-${pkgver}"
  _kamodules
  local _build_type="release" # Options: release, debug

  make mode="${_build_type}" group_include="${KAMODULES[*]}" \
    bin_dir="bin" cfg_target="/etc/${pkgname}" LIBDIR="lib" PREFIX="/usr" all
}

package() {
  cd "${pkgname}-${pkgver}"
  _kamodules
  local _build_type="release" # Options: release, debug

  make mode="${_build_type}" group_include="${KAMODULES[*]}" \
    bin_dir="bin" cfg_target="/etc/${pkgname}" cfg_prefix="${pkgdir}" \
    BASEDIR="${pkgdir}" LIBDIR="lib" PREFIX="/usr" run_prefix="/run" run_dir="${pkgname}" install

  # Install license and service files
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 pkg/kamailio/obs/kamailio.service "${pkgdir}/usr/lib/systemd/system/kamailio.service"
  install -Dm644 "${srcdir}/kamailio.sysusers" "${pkgdir}/usr/lib/sysusers.d/kamailio.conf"
  install -Dm644 pkg/kamailio/obs/kamailio.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/kamailio.conf"
}

# vim:set ts=2 sw=2 et:
