# Maintainer: Aleksandr Boiko <brdcom@ya.ru>

pkgname=ipt_netflow-git
_pkgname=ipt-netflow
pkgver=r310.fc4f5f3
pkgrel=1
url=https://github.com/aabc/ipt-netflow
pkgdesc="Netflow capture module for iptables (netfilter). GIT version."
arch=('i686' 'x86_64')
license=('GPL')
depends=('iptables')
makedepends=('git' 'wget')
conflicts=('ipt_netflow')
install=ipt_netflow.install
source=('ipt-netflow::git+https://github.com/aabc/ipt-netflow.git'
    'modprobe.conf'
	'modules.conf')
md5sums=('SKIP'
         'ce5b763e857a38dab5f22ad77e0c248e'
         '0e3c6d2164bd07a2603f0ad123ac68a8')

_kernver=`uname -r`

pkgver() {
    cd "${srcdir}/${_pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}"
	_iptver=`iptables --version | sed s,^[^0-9]*,,`
	wget -c "http://netfilter.org/projects/iptables/files/iptables-${_iptver}.tar.bz2"
	tar xf "iptables-${_iptver}.tar.bz2"
	cd "${srcdir}/iptables-${_iptver}"
	./configure
	make -j2

	cd "${srcdir}/${_pkgname%-git}"

	#
	# BUILD HERE
	#

	./configure --ipt-src=../iptables-${_iptver}
	make KVERSION=$kernver all
}

package() {
    cd "${srcdir}"
	install -D -o root -g root -m 0644 ${srcdir}/${_pkgname%-git}/ipt_NETFLOW.ko $pkgdir/usr/lib/modules/${_kernver}/extramodules/ipt_NETFLOW.ko
	install -D -o root -g root -m 0755 ${srcdir}/${_pkgname%-git}/libipt_NETFLOW.so $pkgdir/usr/lib/iptables/libipt_NETFLOW.so
	install -D -o root -g root -m 0644 modprobe.conf $pkgdir/usr/lib/modprobe.d/ipt_netflow.conf
	install -D -o root -g root -m 0644 modules.conf $pkgdir/usr/lib/modules-load.d/ipt_netflow.conf
	install -D -o root -g root -m 0644 ${srcdir}/${_pkgname%-git}/README $pkgdir/usr/share/doc/ipt_netflow/README
	install -D -o root -g root -m 0644 ${srcdir}/${_pkgname%-git}/README.promisc $pkgdir/usr/share/doc/ipt_netflow/README.promisc
}
