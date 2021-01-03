pkgname='frr-fixes'
_pkgname='frr'
pkgver='7.5'
pkgrel='3'
pkgdesc='FRRouting (quagga fork) supports BGP4, OSPFv2, OSPFv3, ISIS, RIP, RIPng, PIM, LDP, BFD, VRRP, NHRP and EIGRP.'
arch=('x86_64' 'aarch64')
url="https://frrouting.org/"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'pam' 'json-c' 'net-snmp'
	 'rtrlib' 'libyang' 'libunwind' 'c-ares')
makedepends=('patch' 'gcc' 'net-snmp' 'bison' 'perl-xml-libxml' 'python-sphinx')
checkdepends=('python-pytest')
optdepends=('rsyslog: syslog support')
conflicts=('quagga' 'babeld' 'quagga_cumulus')
provides=('quagga' 'quagga_cumulus')
backup=("etc/${_pkgname}/${_pkgname}.conf"
	"etc/${_pkgname}/daemons.conf"
	"etc/${_pkgname}/vtysh.conf")
source=("https://github.com/FRRouting/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        "${_pkgname}_7.4_Archlinux.patch"
	"frr-init-functions"
	"https://github.com/FRRouting/frr/pull/7621.patch"
    "https://github.com/FRRouting/frr/commit/91b1421e845844d894d7cc162cc5d3244efbd206.patch")
sha256sums=('54066e82a82751ec5876d9b67aa0cb24fe94e19e7371af290ac25099eda9f136'
            '9371cc0522d13621c623b5da77719052bdebdceb7ffdbdc06fc32a2f07118e7e'
            '6f8dd86ef9c600763faead3052908531e8dc8ef67058e6f7f8da01bf0fe4eb89'
            '4662bcd384d40be42cc55182310cada2461c18f126f432dd31c9db286641bef8'
            'e6e2592a8b0b18f7f173186fb4ebf23e642b3d912179f0bb36251962ca64cd7a'
            '035bb015dbbbe0013629845030230be99da2169dfe3fd8075cf2d7cfac48145c'
            '2e46a3f92e234d2fe7eb7edfe012c4e3bcf7fd538202b10b7b52ff47869d25a3')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/${_pkgname}_7.4_Archlinux.patch"
  patch -p1 -i "${srcdir}/7621.patch"
  patch -p1 -i "${srcdir}/91b1421e845844d894d7cc162cc5d3244efbd206.patch"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/${_pkgname}" \
    --localstatedir="/run/${_pkgname}" \
    --enable-exampledir="/usr/share/doc/${_pkgname}/examples" \
    --with-libpam \
    --enable-snmp="agentx" \
    --enable-multipath=256 \
    --enable-user="${_pkgname}" \
    --enable-group="${_pkgname}" \
    --enable-vty-group="${_pkgname}vty" \
    --enable-configfile-mask="0640" \
    --enable-logfile-mask="0640" \
    --enable-shell-access \
    --enable-systemd \
    --enable-rpki \
    --enable-fpm
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm0444 "${startdir}/frr-init-functions" "${pkgdir}/usr/bin/"

  pushd "redhat"
  sed -ri 's|/var/run/frr|/run/frr|g' "${_pkgname}.logrotate"
  install -Dm0644 "${_pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${_pkgname}"
  install -Dm0644 "${_pkgname}.pam" "${pkgdir}/etc/pam.d/${_pkgname}"
  install -Dm0644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm0644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  popd

  pushd "tools"
  sed -ri 's|/usr/lib/frr/|/usr/bin/|g' "${_pkgname}.service"
  install -Dm0644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  popd

  pushd "tools/etc"
  install -Dm0644 "${_pkgname}/daemons" "${pkgdir}/etc/${_pkgname}/daemons.conf"
  install -Dm0644 "iproute2/rt_protos.d/${_pkgname}.conf" "${pkgdir}/etc/iproute2/rt_protos.d/${_pkgname}.conf"
  install -Dm0644 "${_pkgname}/${_pkgname}.conf" "${pkgdir}/etc/${_pkgname}/${_pkgname}.conf"
  install -Dm0644 "${_pkgname}/vtysh.conf" "${pkgdir}/etc/${_pkgname}/vtysh.conf"
  install -Dm0644 "rsyslog.d/45-${_pkgname}.conf" "${pkgdir}/etc/rsyslog.d/45-${_pkgname}.conf"
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
