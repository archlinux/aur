# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_netflow='ipt-netflow'
pkgname='ipt_netflow'
pkgver='2.3'
pkgrel='5'
pkgdesc='Netflow as netfilter extension.'
arch=('any')
url="https://github.com/aabc/${_netflow}"
license=('GPL')
depends=('linux' 'iptables')
makedepends=('gcc' 'gzip' 'gawk' 'sed')
source=("${pkgname}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
"${_netflow}-${pkgver}_upstream.patch")
sha256sums=('90d58ee6363177497c10c5a28c99c14be3b170c4be5492220a552ede9d79afef'
            '457188b37dca639a5019376e35b48e72ca59a0da87815a0949dcfddca7fa8a38')
# define 'lts' for linux-lts package
_linux_custom="ARCH"
# define '-lts' for linux-lts package
_linux_localversion=""
_kdir="`pacman -Qe linux${_linux_localversion} | awk '{print "/usr/lib/modules/"$2"-'${_linux_custom}'/"}' | sed 's|\.arch|\-arch|g'`"
_kver="`pacman -Qe linux${_linux_localversion} | awk '{print $2"-'${_linux_custom}'"}' | sed 's|\.arch|\-arch|g'`"

prepare() {
  cd "${srcdir}/${_netflow}-${pkgver}"

  patch -p1 -i "${srcdir}/${_netflow}-${pkgver}_upstream.patch"

  ./configure \
    --disable-snmp-agent \
    --disable-dkms \
    --disable-dkms-install \
    --kver=${_kver} \
    --kdir=${_kdir}\build
}

build() {
  cd "${srcdir}/${_netflow}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${_netflow}-${pkgver}"
  gzip --best -c "ipt_NETFLOW.ko" > "ipt_NETFLOW.ko.gz"
}

package() {
  cd "${srcdir}/${_netflow}-${pkgver}"
  install -Dm755 "libipt_NETFLOW.so" "${pkgdir}/usr/lib/xtables/libipt_NETFLOW.so"
  install -Dm755 "libip6t_NETFLOW.so" "${pkgdir}/usr/lib/xtables/libip6t_NETFLOW.so"
  install -Dm644 "ipt_NETFLOW.ko.gz" "${pkgdir}${_kdir}/extra/ipt_NETFLOW.ko.gz"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "README.promisc" "${pkgdir}/usr/share/doc/${pkgname}/README.promisc"
}
