# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_ver='2.5.9'
_quagga='quagga'
_cumulus='CumulusNetworks'
pkgname="${_quagga}_cumulus"
pkgver='0.99.23.1'
pkgrel='7'
pkgdesc="Routing daemon suite with ${_cumulus} patches. Support Multi-Instance OSPF."
arch=('i686' 'x86_64')
url="https://github.com/${_cumulus}/${_quagga}"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'json-c')
makedepends=('patch' 'gcc' 'grep' 'json-c')
conflicts=("${_quagga}" "frr")
provides=("${_quagga}")
source=("https://download.savannah.gnu.org/releases/${_quagga}/${_quagga}-${pkgver}.tar.gz"
	"http://http.debian.net/debian/pool/main/q/${_quagga}/${_quagga}_0.99.22.4-1+wheezy2.debian.tar.gz"
	"http://oss.cumulusnetworks.com/CumulusLinux-${_ver}.tar.gz"
        "${_quagga}.sysusers"
        "${_quagga}.tmpfiles"
        "${_quagga}-${_cumulus}-2.5.6_json-c.patch"
        "${_quagga}-${_cumulus}-2.5.9_configure_shell.patch"
        "${_quagga}-${_cumulus}-2.5.9_systemd.patch")
sha256sums=('3abf2046bc27539ce2d17c238e06c8fd0d479a8e402580c6aa455808bd48e004'
            '091e57dfe070c70264079e436999dd629cbe18f03a4eaff29cd87718669e05de'
            'aadf4b9cf54397645b4ed4fdcf1cb2ed180aa83c714546faabf4bd62d122b984'
            'b531818654f9656c6a07127707785e55f7b3bd14568849e2f63c8f8e761223d0'
            '4debff53306539b79d8e3e08844081a388f1897cee20bf2bc84e0efaff40fd9b'
            '8a41060483d3b3b8645ffb18519efc3799c7819d1cfedc12c33eeb72483bd312'
            'f5804e4d0cc310fe5a8dce93574710a8183211a9c4d76befb91002e318aeaed2'
            '04cfa8f8cc075e9554449f9ba8fc08abd0ecba8c51c86204c22a70e2619385aa')

prepare() {
  # Cumulus patch set loads to Debian dpkg sources
  cp -ax "${srcdir}/debian" "${srcdir}/${_quagga}-${pkgver}"
  sed -i 1d "${srcdir}/patches/${_quagga}/series"

  cd "${srcdir}/${_quagga}-${pkgver}"
  for p in $(< "${srcdir}/patches/${_quagga}/series"); do
    echo -e "Applying ${_cumulus} patch: ${p}"
    patch -p1 -i "${srcdir}/patches/${_quagga}/${p}"
    echo -e "---------------------------------------------\\n"
  done

  echo -e "Arch Linux patches:\\n"
  # Make Arch Systemd services from RedHat services
  patch -p1 -i "${srcdir}/${_quagga}-${_cumulus}-2.5.9_systemd.patch"
  # json in Debian = json-c in Arch
  patch -p1 -i "${srcdir}/${_quagga}-${_cumulus}-2.5.6_json-c.patch"
  # https://github.com/CumulusNetworks/quagga/commit/5fd1f74742debed7f5bfe5d9416f363906917ec5#diff-67e997bcfdac55191033d57a16d1408a
  patch -p1 -i "${srcdir}/${_quagga}-${_cumulus}-2.5.9_configure_shell.patch"

  autoreconf -fvi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc/${_quagga}" \
    --localstatedir="/run/${_quagga}" \
    --enable-exampledir="/usr/share/doc/${_quagga}/examples" \
    --enable-zebra \
    --enable-vtysh \
    --enable-isisd \
    --enable-isis-topology \
    --enable-netlink \
    --enable-irdp \
    --enable-pcreposix \
    --enable-multipath=64 \
    --enable-user="${_quagga}" \
    --enable-group="${_quagga}" \
    --enable-vty-group="${_quagga}vty" \
    --enable-configfile-mask="0640" \
    --enable-logfile-mask="0640" \
    --enable-systemd \
    --enable-poll \
    --disable-watchquagga
}

build() {
  cd "${srcdir}/${_quagga}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_quagga}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "redhat"
  sed -ri 's|/var/run/quagga|/run/quagga|g' "${_quagga}.logrotate"
  install -Dm0644 "${_quagga}.logrotate" "${pkgdir}/etc/logrotate.d/${_quagga}"

  for d in zebra ripd ripngd bgpd ospfd ospfd-instance@ ospf6d isisd babeld pimd; do
    install -Dm0644 ${d}.service "${pkgdir}/usr/lib/systemd/system/${d}.service"
  done

  install -Dm0644 "${srcdir}/${_quagga}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_quagga}.conf"
  install -Dm0644 "${srcdir}/${_quagga}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_quagga}.conf"
}
