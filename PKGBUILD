# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='frr'
pkgver=2.0_rc1.5171.e2ff97b9
pkgrel=1
pkgdesc='FreeRangeRouting (quagga fork) supports BGP4/OSPF/RIP/PIM-SM/MSDP and LDP as well as very early support for IS-IS.'
arch=('any')
url="https://github.com/freerangerouting/${pkgname}"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'json-c' 'net-snmp')
makedepends=('git' 'patch' 'gcc' 'grep' 'net-snmp' 'json-c' 'python-pytest')
conflicts=("quagga" "quagga_cumulus")
provides=("quagga" "quagga_cumulus")
source=("${pkgname}::git+${url}"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}_systemd_arch.patch")
sha256sums=('SKIP'
            'd3eb1648c018d37e0327dad07ba42f08dfe610838d444d454ca4ab38ece1e8c4'
            '6f8dd86ef9c600763faead3052908531e8dc8ef67058e6f7f8da01bf0fe4eb89'
            '85f3396b49e3a3c84c344ee548bb2d185152356ca8a7bdcb5a850dc2e477665d')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git checkout stable/2.0 >/dev/null 2>&1
  package_version=`gawk 'match($0, /^(AC_INIT)\((frr)\,\s([a-z0-9\-.]+)(.*)$/, a) {print a[3]}' configure.ac`
  git_num=`git log --pretty=oneline | wc -l | tr -d '[[:space:]]'`
  git_tag=`git log -1 --format=%h`
  echo -e "${package_version}.${git_num}.${git_tag}" | sed -e 's:v::' -e 's|-|_|g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout stable/2.0
  patch -p1 -i "${srcdir}/${pkgname}_systemd_arch.patch"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/${pkgname}" \
    --localstatedir="/run/${pkgname}" \
    --enable-exampledir="/usr/share/doc/${pkgname}/examples" \
    --enable-ldpd \
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
    --enable-poll
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm0644 "zebra/GNOME-PRODUCT-ZEBRA-MIB" "${pkgdir}/usr/share/snmp/mibs/GNOME-PRODUCT-ZEBRA-MIB"

  cd "redhat"
  sed -ri 's|/var/run/frr|/run/frr|g' "${pkgname}.logrotate"
  install -Dm0644 "${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"

  for d in zebra ripd ripngd bgpd ospfd ospfd-instance@ ospf6d isisd pimd ldpd; do
    install -Dm0644 ${d}.service "${pkgdir}/usr/lib/systemd/system/${d}.service"
  done

  install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  rm -rfv "${pkgdir}/usr/bin/${pkgname}"
  rm -rfv "${pkgdir}/usr/bin/${pkgname}-reload.py"
}
