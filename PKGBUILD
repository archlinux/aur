# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='frr'
pkgver='3.0'
pkgrel='2'
pkgdesc='FRRouting (quagga fork) supports BGP4, OSPFv2, OSPFv3, ISIS, RIP, RIPng, PIM, LDP, NHRP and EIGRP.'
arch=('any')
url="https://frrouting.org/"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'json-c' 'net-snmp')
makedepends=('patch' 'gcc' 'net-snmp' 'json-c')
conflicts=('quagga' 'quagga_cumulus')
provides=('quagga' 'quagga_cumulus')
source=("https://github.com/FRRouting/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}_3.0_systemd_arch.patch")
sha256sums=('9335c83c2c0a21e64b4e64a130ee95c1f90d76103cff05e816f452a8ba0603d9'
            '9371cc0522d13621c623b5da77719052bdebdceb7ffdbdc06fc32a2f07118e7e'
            '6f8dd86ef9c600763faead3052908531e8dc8ef67058e6f7f8da01bf0fe4eb89'
            'caf47e9efa48678121437f41aaa0e8b1bf3f212539082b2b07e0de6b6b9c7ba3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/${pkgname}_3.0_systemd_arch.patch"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/${pkgname}" \
    --localstatedir="/run/${pkgname}" \
    --enable-exampledir="/etc/${pkgname}" \
    --enable-ldpd \
    --enable-nhrpd \
    --disable-bgp-vnc \
    --disable-watchfrr \
    --enable-snmp="agentx" \
    --enable-tcp-zebra \
    --enable-multipath=256 \
    --enable-user="${pkgname}" \
    --enable-group="${pkgname}" \
    --enable-vty-group="${pkgname}vty" \
    --enable-configfile-mask="0640" \
    --enable-logfile-mask="0640" \
    --enable-shell-access \
    --enable-pcreposix \
    --enable-systemd \
    --enable-poll="yes" \
    --enable-shared \
    --enable-irdp
}

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "zebra/GNOME-PRODUCT-ZEBRA-MIB" "${pkgdir}/usr/share/snmp/mibs/GNOME-PRODUCT-ZEBRA-MIB"

  cd "redhat"
  sed -ri 's|/var/run/frr|/run/frr|g' "${pkgname}.logrotate"
  install -Dm0644 "${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"

  for d in zebra ripd ripngd bgpd ospfd ospfd-instance@ ospf6d isisd pimd ldpd nhrpd; do
    install -Dm0644 ${d}.service "${pkgdir}/usr/lib/systemd/system/${d}.service"
  done

  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  rm -rfv "${pkgdir}/usr/bin/${pkgname}"
  rm -rfv "${pkgdir}/usr/bin/${pkgname}-reload.py"
  # frr:frrvty
  chown -R 177:178 "${pkgdir}/etc/frr" 
}
