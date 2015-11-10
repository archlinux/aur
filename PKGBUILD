# Maintainer: Aleksandr Boiko <brdcom@ya.ru>

pkgname=ipt-netflow-module-git
_pkgname=ipt-netflow
pkgver=r301.1bbbcc2
pkgrel=1
url=https://github.com/aabc/ipt-netflow
pkgdesc="High performance NetFlow v5, v9, IPFIX flow data export module for Linux kernel. GIT version."
arch=('i686' 'x86_64')
license=('GPL')
depends=('iptables')
makedepends=('git' 'wget')
install=ipt-netflow.install
source=('ipt-netflow::git+https://github.com/aabc/ipt-netflow.git'
        'modprobe.conf'
	    'modules.conf')
md5sums=('SKIP'
         'ce5b763e857a38dab5f22ad77e0c248e'
         '0e3c6d2164bd07a2603f0ad123ac68a8')
_extramodules=extramodules-4.2-ARCH

pkgver() {
    cd "${srcdir}/${_pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
	_iptver=`iptables --version | sed s,^[^0-9]*,,`
	wget -c "http://netfilter.org/projects/iptables/files/iptables-${_iptver}.tar.bz2"
	tar xf "iptables-${_iptver}.tar.bz2"
	cd "${srcdir}/iptables-${_iptver}"
	./configure
    make 

	cd "$srcdir"

    if [ -d "$_pkgname-build" ]; then
	    rm -fr "$_pkgname-build"
	    git clone "$srcdir/$_pkgname" "$srcdir/$_pkgname-build"
    else
	    git clone "$srcdir/$_pkgname" "$srcdir/$_pkgname-build"
    fi
    cd "$srcdir/$_pkgname-build"

	#
	# BUILD HERE
	#
    _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
	./configure --ipt-src="../iptables-${_iptver}"
	make KVERSION="${_kernver}" all
}

package() {
	install -D -o root -g root -m 0644 "${srcdir}/${_pkgname}-build/ipt_NETFLOW.ko" "$pkgdir/usr/lib/modules/$_extramodules/ipt_NETFLOW.ko"
    find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	install -D -o root -g root -m 0755 "${srcdir}/${_pkgname}-build/libipt_NETFLOW.so" "$pkgdir/usr/lib/iptables/libipt_NETFLOW.so"
	install -D -o root -g root -m 0644 modprobe.conf "$pkgdir/usr/lib/modprobe.d/ipt_netflow.conf"
	install -D -o root -g root -m 0644 modules.conf "$pkgdir/usr/lib/modules-load.d/ipt_netflow.conf"
	install -D -o root -g root -m 0644 "${srcdir}/${_pkgname}-build/CREDITS" "$pkgdir/usr/share/licenses/ipt-netflow/CREDITS"
	install -D -o root -g root -m 0644 "${srcdir}/${_pkgname}-build/README" "$pkgdir/usr/share/doc/ipt-netflow/README"
	install -D -o root -g root -m 0644 "${srcdir}/${_pkgname}-build/README.promisc" "$pkgdir/usr/share/doc/ipt-netflow/README.promisc"
	install -D -o root -g root -m 0644 "${srcdir}/${_pkgname}-build/NEWS" "$pkgdir/usr/share/doc/ipt-netflow/NEWS"
}
