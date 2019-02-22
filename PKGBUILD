# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='frr'
pkgver='6.0.2'
pkgrel='3'
pkgdesc='FRRouting (quagga fork) supports BGP4, OSPFv2, OSPFv3, ISIS, RIP, RIPng, PIM, LDP, NHRP and EIGRP.'
arch=('any')
url="https://frrouting.org/"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'pam' 'json-c' 'net-snmp' 'rtrlib')
makedepends=('patch' 'gcc' 'net-snmp' 'bison' 'c-ares' 'perl-xml-libxml' 'python-sphinx' 'python-pytest')
conflicts=('quagga' 'babeld' 'quagga_cumulus')
provides=('quagga' 'quagga_cumulus')
source=("https://github.com/FRRouting/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('dde97d012b6068a1230c0c6a03b38015befae37f617b9ffbd17024c71a170d94'
            '9371cc0522d13621c623b5da77719052bdebdceb7ffdbdc06fc32a2f07118e7e'
            '6f8dd86ef9c600763faead3052908531e8dc8ef67058e6f7f8da01bf0fe4eb89')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

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
  install -Dm0644 "daemons" "${pkgdir}/etc/frr/daemons.conf"
  install -Dm0644 "${pkgname}.pam" "${pkgdir}/etc/pam.d/${pkgname}"
  install -Dm0644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  chown -R 177:177 "${pkgdir}/etc/frr"
}
