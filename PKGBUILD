# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='frr'
pkgver='6.0'
pkgrel='2'
pkgdesc='FRRouting (quagga fork) supports BGP4, OSPFv2, OSPFv3, ISIS, RIP, RIPng, PIM, LDP, NHRP and EIGRP.'
arch=('any')
url="https://frrouting.org/"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'json-c' 'net-snmp' 'rtrlib')
makedepends=('patch' 'gcc' 'net-snmp' 'bison' 'c-ares' 'perl-xml-libxml' 'python-sphinx' 'python-pytest')
conflicts=('quagga' 'babeld' 'quagga_cumulus')
provides=('quagga' 'quagga_cumulus')
source=("https://github.com/FRRouting/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}_6.0_systemd_arch.patch")
sha256sums=('3835d87e2329c1c08d1b2657312c0ba0155d8f442c338d60f0ddb51090f2f182'
            '9371cc0522d13621c623b5da77719052bdebdceb7ffdbdc06fc32a2f07118e7e'
            '6f8dd86ef9c600763faead3052908531e8dc8ef67058e6f7f8da01bf0fe4eb89'
            '9d98a0b5d7016cb66fe3cbec234f70327f0a961de47f7eae39a5bd4477b072ce')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  # https://github.com/FRRouting/frr/issues/1422
  patch -p1 -i "${srcdir}/${pkgname}_6.0_systemd_arch.patch"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/${pkgname}" \
    --localstatedir="/run/${pkgname}" \
    --enable-exampledir="/etc/${pkgname}" \
    --disable-watchfrr \
    --enable-snmp="agentx" \
    --enable-multipath=256 \
    --enable-user="${pkgname}" \
    --enable-group="${pkgname}" \
    --enable-vty-group="${pkgname}vty" \
    --enable-configfile-mask="0640" \
    --enable-logfile-mask="0640" \
    --enable-shell-access \
    --enable-systemd \
    --enable-rpki \
    --enable-fpm
}

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "bgpd/BGP4-MIB.txt" "${pkgdir}/usr/share/snmp/mibs/BGP4-MIB.txt"
  install -Dm0644 "eigrpd/EIGRP-MIB.txt" "${pkgdir}/usr/share/snmp/mibs/EIGRP-MIB.txt"
  install -Dm0644 "ospf6d/OSPFv3-MIB.txt" "${pkgdir}/usr/share/snmp/mibs/OSPFv3-MIB.txt"
  install -Dm0644 "ospfd/OSPF-MIB.txt" "${pkgdir}/usr/share/snmp/mibs/OSPF-MIB.txt"
  install -Dm0644 "ospfd/OSPF-TRAP-MIB.txt" "${pkgdir}/usr/share/snmp/mibs/OSPF-TRAP-MIB.txt"
  install -Dm0644 "ripd/RIPv2-MIB.txt" "${pkgdir}/usr/share/snmp/mibs/RIPv2-MIB.txt"

  cd "redhat"
  sed -ri 's|/var/run/frr|/run/frr|g' "${pkgname}.logrotate"
  install -Dm0644 "${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"

  for d in babeld bgpd bfdd eigrpd isisd ldpd nhrpd ospf6d ospfd ospfd-instance@ pbrd pimd ripd ripngd staticd zebra; do
    install -Dm0644 ${d}.service "${pkgdir}/usr/lib/systemd/system/${d}.service"
  done

  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  rm -rfv "${pkgdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}-reload.py"
  chown -R 177:177 "${pkgdir}/etc/frr"
}
