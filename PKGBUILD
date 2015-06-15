# Maintainer: Aleksandr Boiko <brdcom@ya.ru>

pkgname=ipt_netflow-git
pkgver=20140710
pkgrel=3
url=http://sourceforge.net/projects/ipt-netflow/
pkgdesc="Netflow capture module for iptables (netfilter). GIT version."
arch=('i686' 'x86_64')
license=('GPL')
depends=('iptables')
makedepends=('git' 'wget')
conflicts=('ipt_netflow-cvs')
install=ipt_netflow.install
source=(modprobe.conf
	modules.conf)
md5sums=('ce5b763e857a38dab5f22ad77e0c248e'
         '0e3c6d2164bd07a2603f0ad123ac68a8')

_gitroot=https://github.com/aabc/ipt-netflow.git
_gitname=ipt_netflow
_kernver=`uname -r`

build() {
	_iptver=`iptables --version | sed s,^[^0-9]*,,`
	wget -c "http://netfilter.org/projects/iptables/files/iptables-${_iptver}.tar.bz2"
	tar xf "iptables-${_iptver}.tar.bz2"
	cd "${srcdir}/iptables-${_iptver}"
	./configure
	make -j2

	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -fr "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	#
	# BUILD HERE
	#

	./configure --ipt-src=../iptables-${_iptver}
	make KVERSION=$kernver all
}

package() {
	install -D -o root -g root -m 0644 ${srcdir}/${_gitname}-build/ipt_NETFLOW.ko $pkgdir/usr/lib/modules/${_kernver}/extramodules/ipt_NETFLOW.ko
	install -D -o root -g root -m 0755 ${srcdir}/${_gitname}-build/libipt_NETFLOW.so $pkgdir/usr/lib/iptables/libipt_NETFLOW.so
	install -D -o root -g root -m 0644 modprobe.conf $pkgdir/usr/lib/modprobe.d/ipt_netflow.conf
	install -D -o root -g root -m 0644 modules.conf $pkgdir/usr/lib/modules-load.d/ipt_netflow.conf
	install -D -o root -g root -m 0644 ${srcdir}/${_gitname}-build/README $pkgdir/usr/share/doc/ipt_netflow/README
	install -D -o root -g root -m 0644 ${srcdir}/${_gitname}-build/README.promisc $pkgdir/usr/share/doc/ipt_netflow/README.promisc
}
