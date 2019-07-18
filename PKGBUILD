# Maintainer: Juergen Werner <juergen at opensourcerouting dot org>
# Contributor: Shalygin Konstantin <k0ste at k0ste dot ru>

pkgname='frr-git'
pkgver=7.2.dev.r16600
pkgrel=1
pkgdesc='FRRouting (quagga fork) supports BGP4, OSPFv2, OSPFv3, ISIS, RIP, RIPng, PIM, LDP, NHRP and EIGRP.'
arch=('x86_64')
url="https://frrouting.org/"
license=('GPL2')
depends=('pam' 'json-c' 'net-snmp' 'rtrlib' 'libyang>=0.16.105' 'libunwind'  'python' 'c-ares')
makedepends=('net-snmp' 'bison' 'c-ares' 'perl-xml-libxml' 'python-sphinx')
optdepends=('rsyslog: syslog support')
conflicts=('quagga' 'babeld' 'quagga_cumulus' 'frr')
provides=('quagga' 'quagga_cumulus' 'frr')
backup=("etc/frr/frr.conf"
        "etc/frr/daemons"
        "etc/frr/vtysh.conf")
source=("git+https://github.com/FRRouting/frr.git"
        "frr.sysusers"
        "frr.tmpfiles")
sha256sums=('SKIP'
            'e656acefc2c318a94c2d3011ecef2bed75d70852f1e642a3a1d331d860c8735b'
            'f033353216b51ff936dbc47d8a7725d290af6cc1b9549e653c1dd97046114f79')

pkgver() {
  cd frr
  source config.version
  echo "${DIST_PACKAGE_VERSION}.r$(git rev-list --count HEAD)" | sed 's/-/./g'
}

prepare() {
  cd "${srcdir}/frr"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/frr" \
    --localstatedir="/var/run/frr" \
    --enable-exampledir="/usr/share/doc/frr/examples" \
    --with-libpam \
    --enable-snmp="agentx" \
    --enable-multipath=256 \
    --enable-user="frr" \
    --enable-group="frr" \
    --enable-vty-group="frrvty" \
    --enable-configfile-mask="0640" \
    --enable-logfile-mask="0640" \
    --enable-shell-access \
    --enable-systemd \
    --enable-rpki \
    --enable-fpm
}

build() {
  cd "${srcdir}/frr"
  make
}

package() {
  cd "${srcdir}/frr"
  make DESTDIR="${pkgdir}" install

  pushd "redhat"
  install -Dm0644 "frr.logrotate" "${pkgdir}/etc/logrotate.d/frr"
  install -Dm0644 "frr.pam" "${pkgdir}/etc/pam.d/frr"
  popd

  install -Dm0644 "${srcdir}/frr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/frr.conf"
  install -Dm0644 "${srcdir}/frr.sysusers" "${pkgdir}/usr/lib/sysusers.d/frr.conf"

  pushd "tools"
  sed -ri 's|/usr/lib/frr/|/usr/bin/|g' "frr.service"
  install -Dm0644 "frr.service" "${pkgdir}/usr/lib/systemd/system/frr.service"
  popd

  pushd "tools/etc"
  install -Dm0640 "frr/daemons" "${pkgdir}/etc/frr/daemons"
  install -Dm0640 "frr/frr.conf" "${pkgdir}/etc/frr/frr.conf"
  install -Dm0640 "frr/vtysh.conf" "${pkgdir}/etc/frr/vtysh.conf"
  install -Dm0644 "iproute2/rt_protos.d/frr.conf" "${pkgdir}/etc/iproute2/rt_protos.d/frr.conf"
  install -Dm0644 "rsyslog.d/45-frr.conf" "${pkgdir}/etc/rsyslog.d/45-frr.conf"
  popd

  chown frr:frr ${pkgdir}/etc/frr
}
