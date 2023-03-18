# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Evgeny Cherkashin <eugeneai@irnok.net>

pkgname='frr'
pkgver='8.4.3'
pkgrel='1'
pkgdesc='FRRouting (quagga fork) supports BGP4, OSPFv2, OSPFv3, ISIS, RIP, RIPng, PIM, LDP, BFD, VRRP, NHRP and EIGRP'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://frrouting.org"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'pam' 'json-c' 'net-snmp'
	 'rtrlib' 'libyang' 'libunwind' 'c-ares')
makedepends=('patch' 'gcc' 'net-snmp' 'bison' 'perl-xml-libxml' 'python-sphinx')
checkdepends=('python-pytest')
optdepends=('rsyslog: syslog support')
conflicts=('quagga' 'babeld' 'quagga_cumulus')
provides=('quagga' 'quagga_cumulus')
backup=("etc/${pkgname}/${pkgname}.conf"
	"etc/${pkgname}/daemons.conf"
	"etc/${pkgname}/vtysh.conf")
source=("https://github.com/FRRouting/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}_8.4_Archlinux.patch"
	"${pkgname}-init-functions")
sha256sums=('7c3fccbfe3da6e2237d171d473fec4159d6029744fcf3ec16532067b31326e0d'
            '9371cc0522d13621c623b5da77719052bdebdceb7ffdbdc06fc32a2f07118e7e'
            '6f8dd86ef9c600763faead3052908531e8dc8ef67058e6f7f8da01bf0fe4eb89'
            '0aba0c37d16fd58a5aac99dbd6de157fcc88f99be53ecdab393628cd24f5be20'
            'e6e2592a8b0b18f7f173186fb4ebf23e642b3d912179f0bb36251962ca64cd7a')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  patch -p1 -i "../${pkgname}_8.4_Archlinux.patch"

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

  install -Dm0444 "../frr-init-functions" "${pkgdir}/usr/bin/"
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
  install -Dm0644 "${pkgname}/daemons" "${pkgdir}/etc/${pkgname}/daemons.conf"
  install -Dm0644 "iproute2/rt_protos.d/${pkgname}.conf" "${pkgdir}/etc/iproute2/rt_protos.d/${pkgname}.conf"
  install -Dm0644 "${pkgname}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -Dm0644 "${pkgname}/vtysh.conf" "${pkgdir}/etc/${pkgname}/vtysh.conf"
  install -Dm0644 "rsyslog.d/45-${pkgname}.conf" "${pkgdir}/etc/rsyslog.d/45-${pkgname}.conf"
  popd

  chown -R 177:177 "${pkgdir}/etc/frr"

  pushd "${pkgdir}/usr/bin"
    for file in "${pkgname}" frr-reload frrcommon.sh frrinit.sh watchfrr.sh
      do
        sed -ri 's|/lib/lsb/init-functions|/usr/bin/frr-init-functions|g' "${file}"
      done
  sed -ri 's|C_PATH/daemons\"|C_PATH/daemons.conf\"|g' "frrcommon.sh"
  sed -ri 's|load_old_config \"\$C_PATH/daemons.conf\"|load_old_config \"\$C_PATH/daemons\"|g' "frrcommon.sh"
  popd

  pushd "${pkgdir}/usr/lib/systemd/system"
    sed -ri 's|frrinit.sh|frr|g' "${pkgname}.service"
  popd
}
