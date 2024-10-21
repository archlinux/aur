# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='frr'
pkgver='10.1.1'
pkgrel='2'
pkgdesc='FRRouting (quagga fork) supports BGP, OSPF, ISIS, RIP, PIM, LDP, BFD, VRRP, NHRP and EIGRP'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://frrouting.org"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'pam' 'json-c' 'net-snmp'
	 'rtrlib' 'libyang>=2.1.128' 'libunwind' 'c-ares' 'protobuf-c' 'pcre2'
	 'lua53' 'sqlite')
makedepends=('gcc' 'bison' 'perl-xml-libxml' 'python-sphinx')
checkdepends=('python-pytest')
optdepends=('rsyslog: syslog support')
conflicts=('quagga' 'babeld' 'quagga_cumulus')
provides=('quagga' 'quagga_cumulus')
backup=("etc/${pkgname}/${pkgname}.conf"
	"etc/${pkgname}/daemons"
	"etc/${pkgname}/vtysh.conf")
source=("https://github.com/FRRouting/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "https://gitlab.com/redhat/centos-stream/rpms/${pkgname}/-/raw/c10s/${pkgname}-tmpfiles.conf"
        "https://gitlab.com/redhat/centos-stream/rpms/${pkgname}/-/raw/c10s/${pkgname}-sysusers.conf"
        "https://patch-diff.githubusercontent.com/raw/FRRouting/${pkgname}/pull/16907.patch"
        "https://patch-diff.githubusercontent.com/raw/FRRouting/${pkgname}/pull/17160.patch")
sha256sums=('76004c312de3348b6164f6ae15db4c0cf0f504945f8c69aed871c0b4dcedfa29'
            'edd7b01b11f2be66bb6b4531496d1eaf6536add9f4b549c659b27f5a32cdc512'
            'c6f5a54402aa5f11e21dac3bd0e6cdeadfbf7937e9b34775b5fd368a9ca96fa4'
            'dff006e53101e292254a6a6599a77489de6eedccaf79de778f5461b8d6cf1d45'
            '25e8013253d0cf581e825bdc7b19a9a109fcee850cae1dd49dc6b7477d4c50bb')

prepare() {
  # Systemd use /run, not the /var/run
  sed -i -e 's|/var/run/'"${pkgname}"'|/run/'"${pkgname}"'|g' "${pkgname}-sysusers.conf"

  cd "${pkgname}-${pkgname}-${pkgver}"
  # RPKI hacks from SPEC
  sed -i -e 's/^\(bgpd_options=\)\(.*\)\(".*\)/\1\2 -M rpki\3/' \
    "tools/etc/${pkgname}/daemons"
  # Systemd use /run, not the /var/run
  sed -i -e 's|/var/run/'"${pkgname}"'|/run/'"${pkgname}"'|g' \
    "redhat/${pkgname}.logrotate"
  # Hardcoded path
  sed -i -e 's|/usr/lib/'"${pkgname}"'|/usr/bin|g' \
    "tools/${pkgname}-reload"
  sed -i -e 's|/var/run/'"${pkgname}"'|/run/'"${pkgname}"'|g' \
    "tools/${pkgname}-reload.py"
  sed -i -e 's|frr_libstatedir="\\${localstatedir}/lib/frr"|frr_libstatedir="\\${localstatedir}/frr/lib"|g' \
    "configure.ac"

  # Allow lua imports ('io', 'strings', etc)
  patch -p1 -i "../16907.patch"
  # Write to config `zebra on-rib-process script` command
  patch -p1 -i "../17160.patch"

  autoreconf -fvi
  LUA_INCLUDE="-I /usr/include/lua5.3" ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --localstatedir="/run" \
    --runstatedir="/run" \
    --with-scriptdir="/etc/${pkgname}/scripts" \
    --with-libpam \
    --disable-static \
    --enable-snmp="agentx" \
    --enable-multipath=256 \
    --enable-user="${pkgname}" \
    --enable-group="${pkgname}" \
    --enable-vty-group="${pkgname}vty" \
    --enable-configfile-mask="0640" \
    --enable-logfile-mask="0640" \
    --enable-config-rollbacks \
    --enable-pcre2posix \
    --enable-scripting \
    --enable-rpki \
    --enable-fpm
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  make
}

check() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "../${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "../${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  rm -rf "${pkgdir}/usr/bin/"{${pkgname},ssd,fpm_listener}

  pushd "redhat"
  install -Dm0644 "${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
  install -Dm0644 "${pkgname}.pam" "${pkgdir}/etc/pam.d/${pkgname}"
  popd

  pushd "tools"
  install -Dm0644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  popd

  pushd "tools/etc"
  install -Dm0644 "${pkgname}/daemons" -t "${pkgdir}/etc/${pkgname}"
  install -Dm0644 "iproute2/rt_protos.d/${pkgname}.conf" -t "${pkgdir}/etc/iproute2/rt_protos.d"
  install -Dm0644 "${pkgname}/${pkgname}.conf" -t "${pkgdir}/etc/${pkgname}"
  install -Dm0644 "${pkgname}/vtysh.conf" -t "${pkgdir}/etc/${pkgname}"
  install -Dm0644 "rsyslog.d/45-${pkgname}.conf" -t "${pkgdir}/etc/rsyslog.d"
  popd
}
