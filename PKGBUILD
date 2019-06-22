# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='frr'
pkgver='7.0.1'
pkgrel='3'
pkgdesc='FRRouting (quagga fork) supports BGP4, OSPFv2, OSPFv3, ISIS, RIP, RIPng, PIM, LDP, NHRP and EIGRP.'
arch=('any')
url="https://frrouting.org/"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'pam' 'json-c' 'net-snmp'
	 'rtrlib' 'libyang' 'libunwind')
makedepends=('patch' 'gcc' 'net-snmp' 'bison' 'c-ares' 'perl-xml-libxml' 'python-sphinx')
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
        "${pkgname}_6.0_systemd_arch.patch"
        "${pkgname}_7.0_Archlinux.patch"
	"000-rem-rec.patch"
	"frr-init-functions")
sha256sums=('5b74fc2c730e9973eab03546415f8dd7b36fa00fbf0bc856458266773dd5ae6d'
            '9371cc0522d13621c623b5da77719052bdebdceb7ffdbdc06fc32a2f07118e7e'
            '6f8dd86ef9c600763faead3052908531e8dc8ef67058e6f7f8da01bf0fe4eb89'
            '9d98a0b5d7016cb66fe3cbec234f70327f0a961de47f7eae39a5bd4477b072ce'
            '3ea1ac3f8fa1bd6f2946b065057464eb04b7ae6c17d181291bbeecf266735dbb'
            '1cd3780604fba90fcbce9c0fc69e261a4a22abe123faf155035ab359bc0d151f'
            'e6e2592a8b0b18f7f173186fb4ebf23e642b3d912179f0bb36251962ca64cd7a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

  # https://github.com/FRRouting/frr/issues/1422
  patch -p1 -i "${srcdir}/${pkgname}_6.0_systemd_arch.patch"

  # https://github.com/FRRouting/frr/issues/4167
  patch -p1 -i "${srcdir}/${pkgname}_7.0_Archlinux.patch"
  patch -p1 -i "${srcdir}/000-rem-rec.patch"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/${pkgname}" \
    --localstatedir="/run/${pkgname}" \
    --enable-exampledir="/usr/share/doc/${pkgname}/examples" \
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

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm0444 "${srcdir}/../frr-init-functions" "${pkgdir}/usr/bin/"

  pushd "redhat"
  sed -ri 's|/var/run/frr|/run/frr|g' "${pkgname}.logrotate"
  install -Dm0644 "${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
  for d in babeld bgpd bfdd eigrpd isisd ldpd nhrpd ospf6d ospfd ospfd-instance@ pbrd pimd ripd ripngd staticd zebra; do
    install -Dm0644 ${d}.service "${pkgdir}/usr/lib/systemd/system/${d}.service"
  done
  install -Dm0644 "${pkgname}.pam" "${pkgdir}/etc/pam.d/${pkgname}"
  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
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
    for file in frr frr-reload frrcommon.sh frrinit.sh watchfrr.sh;
    do
      sed -ri 's|/lib/lsb/init-functions|/usr/bin/frr-init-functions|g' "$file";
    done
    sed -ri 's|C_PATH/daemons\"|C_PATH/daemons.conf\"|g' frrcommon.sh
    sed -ri 's|load_old_config \"\$C_PATH/daemons.conf\"|load_old_config \"\$C_PATH/daemons\"|g' frrcommon.sh
  popd

  pushd "${pkgdir}/usr/lib/systemd/system"
    sed -ri 's|frrinit.sh|frr|g' frr.service
  popd
}
