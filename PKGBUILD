# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Evgeny Cherkashin <eugeneai@irnok.net>

pkgname='frr'
pkgver='9.1'
pkgrel='1'
pkgdesc='FRRouting (quagga fork) supports BGP4, OSPFv2, OSPFv3, ISIS, RIP, RIPng, PIM, LDP, BFD, VRRP, NHRP and EIGRP'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://frrouting.org"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'pam' 'json-c' 'net-snmp'
	 'rtrlib' 'libyang>=2.1.128' 'libunwind' 'c-ares' 'protobuf-c')
makedepends=('patch' 'gcc' 'net-snmp' 'bison' 'perl-xml-libxml' 'python-sphinx')
checkdepends=('python-pytest')
optdepends=('rsyslog: syslog support')
conflicts=('quagga' 'babeld' 'quagga_cumulus')
provides=('quagga' 'quagga_cumulus')
backup=("etc/${pkgname}/${pkgname}.conf"
	"etc/${pkgname}/daemons"
	"etc/${pkgname}/vtysh.conf")
source=("https://github.com/FRRouting/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}_9.0_Archlinux.patch")
sha256sums=('c4516fa3ef4286c665af809cfbe3a6e7e24a254a7bfb7247e1f7744dcd3bd5da'
            '9371cc0522d13621c623b5da77719052bdebdceb7ffdbdc06fc32a2f07118e7e'
            '6f8dd86ef9c600763faead3052908531e8dc8ef67058e6f7f8da01bf0fe4eb89'
            'f4964d2138496ec883e149cf888d7b6456b0e3eea01e494a1e834475568749f7')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  patch -p1 -i "../${pkgname}_9.0_Archlinux.patch"

  # RPKI hacks from SPEC
  sed -i -e 's/^\(bgpd_options=\)\(.*\)\(".*\)/\1\2 -M rpki\3/' "tools/etc/${pkgname}/daemons"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/${pkgname}" \
    --localstatedir="/run/${pkgname}" \
    --with-libpam \
    --enable-snmp="agentx" \
    --enable-multipath=256 \
    --enable-user="${pkgname}" \
    --enable-group="${pkgname}" \
    --enable-vty-group="${pkgname}vty" \
    --enable-configfile-mask="0640" \
    --enable-logfile-mask="0640" \
    --enable-shell-access \
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

  install -Dm0644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "../${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  pushd "redhat"
  sed -ri 's|/var/run/frr|/run/frr|g' "${pkgname}.logrotate"
  install -Dm0644 "${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
  install -Dm0644 "${pkgname}.pam" "${pkgdir}/etc/pam.d/${pkgname}"
  popd

  pushd "tools"
  sed -ri 's|/usr/lib/frr/|/usr/bin/|g' "${pkgname}.service"
  install -Dm0644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  popd

  pushd "tools/etc"
  install -Dm0644 "${pkgname}/daemons" "${pkgdir}/etc/${pkgname}/daemons"
  install -Dm0644 "iproute2/rt_protos.d/${pkgname}.conf" "${pkgdir}/etc/iproute2/rt_protos.d/${pkgname}.conf"
  install -Dm0644 "${pkgname}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -Dm0644 "${pkgname}/vtysh.conf" "${pkgdir}/etc/${pkgname}/vtysh.conf"
  install -Dm0644 "rsyslog.d/45-${pkgname}.conf" "${pkgdir}/etc/rsyslog.d/45-${pkgname}.conf"
  popd

  chown -R 177:177 "${pkgdir}/etc/frr"
}
