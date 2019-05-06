# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='frr'
pkgver='7.0'
pkgrel='3'
pkgdesc='FRRouting (quagga fork) supports BGP4, OSPFv2, OSPFv3, ISIS, RIP, RIPng, PIM, LDP, NHRP and EIGRP.'
arch=('any')
url="https://frrouting.org/"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'pam' 'json-c' 'net-snmp' 'rtrlib'
	 'libyang' 'libunwind')
makedepends=('gcc' 'net-snmp' 'bison' 'c-ares' 'perl-xml-libxml' 'python-sphinx')
checkdepends=('python-pytest')
conflicts=('quagga' 'babeld' 'quagga_cumulus')
provides=('quagga' 'quagga_cumulus')
source=("https://github.com/FRRouting/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}_6.0_systemd_arch.patch"
        "${pkgname}_7.0_Archlinux.patch")
sha256sums=('15b62dc0c52531e4bcefa6b830e9b9b07d1d0f189c2110307dbc19d80b719354'
            '9371cc0522d13621c623b5da77719052bdebdceb7ffdbdc06fc32a2f07118e7e'
            '6f8dd86ef9c600763faead3052908531e8dc8ef67058e6f7f8da01bf0fe4eb89'
            '9d98a0b5d7016cb66fe3cbec234f70327f0a961de47f7eae39a5bd4477b072ce'
            '4bfa5c8014869741cae034c6dfb133acfe5c4dbe37838770e36a6796dc411b39')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  # https://github.com/FRRouting/frr/issues/1422
  patch -p1 -i "${srcdir}/${pkgname}_6.0_systemd_arch.patch"

  # https://github.com/FRRouting/frr/issues/4167
  patch -p1 -i "${srcdir}/${pkgname}_7.0_Archlinux.patch"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/${pkgname}" \
    --localstatedir="/run/${pkgname}" \
    --enable-exampledir="/etc/${pkgname}" \
    --with-libpam \
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

  cd "redhat"
  sed -ri 's|/var/run/frr|/run/frr|g' "${pkgname}.logrotate"
  sed -ri 's|/usr/lib/frr/|/usr/bin/|g' "${pkgname}.service"
  install -Dm0644 "${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
  for d in babeld bgpd bfdd eigrpd isisd ldpd nhrpd ospf6d ospfd ospfd-instance@ pbrd pimd ripd ripngd staticd zebra; do
    install -Dm0644 ${d}.service "${pkgdir}/usr/lib/systemd/system/${d}.service"
  done
  install -Dm0644 "daemons" "${pkgdir}/etc/frr/daemons.conf"
  install -Dm0644 "${pkgname}.pam" "${pkgdir}/etc/pam.d/${pkgname}"
  install -Dm0644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  chown -R 177:177 "${pkgdir}/etc/frr"
}
