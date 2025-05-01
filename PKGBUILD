# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_netflow='ipt-netflow'
pkgname='ipt_netflow'
pkgver='2.6'
pkgrel='8'
pkgdesc='Netflow as netfilter extension'
arch=('any')
url="https://github.com/aabc/${_netflow}"
license=('GPL')
depends=('linux' 'iptables')
makedepends=('gcc' 'gzip' 'gawk' 'sed')
source=("${url}/archive/v${pkgver}.tar.gz"
	"ipt_netflow.2.6_kernel_6.4.patch"
	"${url}/pull/239.patch")
sha256sums=('1ae270ddd0e60449159607c2f413604e31cb446beae516777dfeeee5f9b4931d'
            '750034a9383e499d4425939db893eacefd9df570e4ba5cc7244d257b95e90b08'
            'c4441ecba040ec5ff068db48d1a475888bc207aa83ad893d98ab6de6a52d9cfa')
# define '-lts' for linux-lts package
_linux_custom=""
_kdir="`pacman -Ql linux${_linux_custom} | awk '/(\/modules\/)([0-9.-])+-(.*)'${_linux_custom}'\/$/ {print $2}' | head -n1`"
_kver="`pacman -Ql linux${_linux_custom} | gawk 'match($0, /(\/usr\/lib\/modules\/)([0-9\.\-a-z]+)\/$/, a) {print a[2]}'`"

prepare() {
  cd "${_netflow}-${pkgver}"
  # Kernel 6.4+ compat
  patch -p1 -i "../ipt_netflow.2.6_kernel_6.4.patch"
  # Kernel 6.8+ compat
  patch -p1 -i "../239.patch"

  ./configure \
    --disable-snmp-agent \
    --disable-dkms \
    --disable-dkms-install \
    --kver=${_kver} \
    --kdir=${_kdir}\build
}

build() {
  cd "${_netflow}-${pkgver}"
  make
}

check() {
  cd "${_netflow}-${pkgver}"
  gzip --best -c "ipt_NETFLOW.ko" > "ipt_NETFLOW.ko.gz"
}

package() {
  cd "${_netflow}-${pkgver}"
  install -Dm0755 "libipt_NETFLOW.so" -t "${pkgdir}/usr/lib/xtables"
  install -Dm0755 "libip6t_NETFLOW.so" -t "${pkgdir}/usr/lib/xtables"
  install -Dm0644 "ipt_NETFLOW.ko.gz" -t "${pkgdir}${_kdir}/extra"
  install -Dm0644 "CREDITS" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 "README" "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm0644 "README.promisc" "${pkgdir}/usr/share/doc/${pkgname}"
}
