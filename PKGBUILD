# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_netflow='ipt-netflow'
pkgname='ipt_netflow'
pkgver='2.6'
pkgrel='1'
pkgdesc='Netflow as netfilter extension.'
arch=('any')
url="https://github.com/aabc/${_netflow}"
license=('GPL')
depends=('linux' 'iptables')
makedepends=('gcc' 'gzip' 'gawk' 'sed')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1ae270ddd0e60449159607c2f413604e31cb446beae516777dfeeee5f9b4931d')
# define '-lts' for linux-lts package
_linux_custom=""
_kdir="`pacman -Ql linux${_linux_custom} | awk '/(\/modules\/)([0-9.-])+-(.*)'${_linux_custom}'\/$/ {print $2}' | head -n1`"
_kver="`pacman -Ql linux${_linux_custom} | gawk 'match($0, /(\/usr\/lib\/modules\/)([0-9\.\-a-z]+)\/$/, a) {print a[2]}'`"

prepare() {
  cd "${srcdir}/${_netflow}-${pkgver}"

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
