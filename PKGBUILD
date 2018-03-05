# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_netflow='ipt-netflow'
pkgname='ipt_netflow'
pkgver='2.2'
pkgrel='5'
pkgdesc='Netflow as netfilter extension.'
arch=('any')
url="https://github.com/aabc/${_netflow}"
license=('GPL')
depends=('linux' 'iptables')
makedepends=('gcc' 'gzip' 'gawk' 'sed')
source=("${pkgname}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"${pkgname}_${pkgver}_upstream.patch")

sha256sums=('cd34a98d495961a065a26a7855d3e5b70b12e07c47537f3736f935bdbaa973bf'
            '04f193e73022b9ad2fb0a891a089ff8d2094c71de153a857adeaef0bbf771b6c')
install="${pkgname}.install"
_linux_custom="ARCH"
_kdir="`pacman -Ql linux | awk '/(\/modules\/)([0-9.-])+-'${_linux_custom}'\/$/ {print $2}'`"
_kver="`pacman -Qe linux | awk '{print $2"-'${_linux_custom}'"}'`"

prepare() {
  cd "${srcdir}/${_netflow}-${pkgver}"

  # upstream patches
  patch -p1 -i "${srcdir}/${pkgname}_${pkgver}_upstream.patch"

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
  install -Dm755 "libipt_NETFLOW.so" "${pkgdir}/usr/lib/iptables/libipt_NETFLOW.so"
  install -Dm755 "libip6t_NETFLOW.so" "${pkgdir}/usr/lib/iptables/libip6t_NETFLOW.so"
  install -Dm644 "ipt_NETFLOW.ko.gz" "${pkgdir}${_kdir}/extra/ipt_NETFLOW.ko.gz"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "README.promisc" "${pkgdir}/usr/share/doc/${pkgname}/README.promisc"
}
