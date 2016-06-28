# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_ver='2.5.8'
_quagga='quagga'
_cumulus='CumulusNetworks'
pkgname="${_quagga}_cumulus"
pkgver='0.99.23.1'
pkgrel='2'
pkgdesc="Routing daemon suite with ${_cumulus} patches. Support Multi-Instance OSPF."
arch=('i686' 'x86_64')
url="https://github.com/${_cumulus}/${_quagga}"
license=('GPL2')
depends=('libcap' 'libnl' 'readline' 'ncurses' 'perl' 'json-c')
makedepends=('patch' 'gcc' 'grep')
conflicts=("${_quagga}")
provides=("${_quagga}")
install="${_quagga}.install"
source=("http://download.savannah.gnu.org/releases/${_quagga}/${_quagga}-${pkgver}.tar.gz"
	"http://http.debian.net/debian/pool/main/q/${_quagga}/${_quagga}_0.99.22.4-1+wheezy2.debian.tar.gz"
	"http://oss.cumulusnetworks.com/CumulusLinux-${_ver}.tar.gz"
        "${_quagga}.sysusers"
        "${_quagga}.tmpfiles"
        "babeld.service"
        "bgpd.service"
        "isisd.service"
        "ospf6d.service"
        "ospfd-instance@.service"
        "ospfd.service"
        "pimd.service"
        "ripd.service"
        "ripngd.service"
        "zebra.service"
        "${_quagga}-${_cumulus}-2.5.6_json-c.patch")
sha256sums=('3abf2046bc27539ce2d17c238e06c8fd0d479a8e402580c6aa455808bd48e004'
            '091e57dfe070c70264079e436999dd629cbe18f03a4eaff29cd87718669e05de'
            'd378608d28b32e9200dd3e9377e2a81fd9be81bcc2bdacfcfe0c7c4264e02399'
            'b531818654f9656c6a07127707785e55f7b3bd14568849e2f63c8f8e761223d0'
            '4debff53306539b79d8e3e08844081a388f1897cee20bf2bc84e0efaff40fd9b'
            '105b8eac3c7d7dc2f1fffa382a2d9d6bf86182c9462708465a5d7216e2be41bd'
            'bbb2dd1568f9711686e06aaff900eeda213e25cfb0e8fef7a8490cfdb3e88ee9'
            '94fb9b041cf38c3a48d208cf07d72a35f2fc0816fb6ca1c07df917d79f94445b'
            'c860839456435531b552c4f34265a74cbadd0a4ce38002f2ef95eb30bd42e498'
            '75a8575fea45a275b9193d5dc4c2d6542e456591ae261d96b687740ff5990c3f'
            '5beb572614bdbf7df727f145c24b93e378d20ca85a7849e6e40a291849cec44f'
            '000e1d76067bebe0743bda670d2cbcd5b561e29985c8829366c77e0a5fe86d54'
            '802df30eb809cda5f491e90442d06e7f939c54131f22969011b93937feb4b523'
            '4ffca2fbde6a6beacd3860adc582bc0d63da6761eb8906ec4f7c15ce5096a78e'
            '95cee83175150f4c5e96a3561478428bae55ad4adc599352993de219e2084066'
            '8a41060483d3b3b8645ffb18519efc3799c7819d1cfedc12c33eeb72483bd312')

prepare() {
  # Cumulus patch set loads to Debian dpkg sources
  cp -ax "${srcdir}/debian" "${srcdir}/${_quagga}-${pkgver}"
  sed -i 1d "${srcdir}/patches/${_quagga}/series"

  cd "${srcdir}/${_quagga}-${pkgver}"
  for p in $(< "${srcdir}/patches/${_quagga}/series"); do
    echo -e "Applying ${_cumulus} patch: ${p}"
    patch -p1 -i "${srcdir}/patches/${_quagga}/${p}"
  done

  # json in Debian = json-c in Arch
  patch -p1 -i "${srcdir}/${_quagga}-${_cumulus}-2.5.6_json-c.patch"
}

build() {
  cd "${srcdir}/${_quagga}-${pkgver}"
  autoreconf -i
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/quagga \
    --localstatedir=/run/quagga \
    --enable-exampledir=/usr/share/doc/quagga/examples \
    --enable-ipv6 \
    --enable-doc \
    --enable-zebra \
    --enable-bgpd \
    --enable-ripd \
    --enable-ripngd \
    --enable-ospfd \
    --enable-ospf-te \
    --enable-opaque-lsa \
    --enable-ospf6d \
    --enable-babeld \
    --enable-vtysh \
    --enable-isisd \
    --enable-isis-topology \
    --enable-netlink \
    --enable-tcp-zebra \
    --enable-irdp \
    --enable-pcreposix \
    --enable-multipath=64 \
    --enable-user=quagga \
    --enable-group=quagga \
    --enable-configfile-mask=0640 \
    --enable-logfile-mask=0640 \
    --enable-systemd=yes \
    --enable-poll=yes \
    --enable-tcp-zebra
  make
}

package() {
  pushd "${srcdir}/${_quagga}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "redhat/${_quagga}.logrotate" "$pkgdir/etc/logrotate.d/${_quagga}"
  sed -ri 's|/var/run/quagga|/run/quagga|g' "$pkgdir/etc/logrotate.d/${_quagga}"

  pushd "${srcdir}"
  install -d -m 755 "${pkgdir}"/usr/lib/{systemd/system,tmpfiles.d,sysusers.d}
  for d in zebra ripd ripngd bgpd ospfd ospfd-instance@ ospf6d isisd babeld pimd; do
    install -D -m 644 ${d}.service "${pkgdir}/usr/lib/systemd/system/${d}.service"
  done
  install -D -m 644 "${_quagga}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_quagga}.conf"
  install -D -m 644 "${_quagga}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_quagga}.conf"
  popd
}
