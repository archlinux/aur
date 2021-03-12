# Maintainer: Aleksandr Boiko <contact at via dot aur>

_pkgbase=ipt-netflow
pkgname=ipt-netflow-dkms-git
pkgver=v2.5.1.r12.3cdadee
pkgrel=9
pkgdesc="High performance NetFlow v5, v9, IPFIX flow data export module for Linux kernel"
arch=('i686' 'x86_64')
url="https://github.com/aabc/ipt-netflow"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=("${_pkgbase}")
conflicts=("${pkgname%-git}")
replaces=("${_pkgbase}")
source=("${pkgname%-git}::git+${url}.git"
        'Makefile.in.patch'
        'dkms.conf'
        'modprobe.conf')
install=install

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    
    msg2 "Patching Makefile.in ..."
    patch -p0 < ../Makefile.in.patch
    
    msg2 "Set the name and version to dkms.conf ..."
    sed -e "s/@_PKGNAME@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i ../dkms.conf
    
    msg2 "Starting ./configure..."
    ./configure
}

build () {
    cd "$srcdir/${pkgname%-git}"

    msg2 "Starting make..."
    make libipt_NETFLOW.so
    make libip6t_NETFLOW.so
}

package() {
    cd "$srcdir/${pkgname%-git}"
    
    install -D -o root -g root -m 0644 ../dkms.conf "$pkgdir/usr/src/${_pkgbase}-$pkgver/dkms.conf"    
    
    install -D -o root -g root -m 0644 Makefile.in "$pkgdir/usr/src/${_pkgbase}-$pkgver/Makefile.in"    
    install -D -o root -g root -m 0644 compat.h "$pkgdir/usr/src/${_pkgbase}-$pkgver/compat.h"    
    install -D -o root -g root -m 0755 configure "$pkgdir/usr/src/${_pkgbase}-$pkgver/configure"    
    install -D -o root -g root -m 0755 gen_compat_def "$pkgdir/usr/src/${_pkgbase}-$pkgver/gen_compat_def"    
    install -D -o root -g root -m 0644 ipt_NETFLOW.c "$pkgdir/usr/src/${_pkgbase}-$pkgver/ipt_NETFLOW.c"    
    install -D -o root -g root -m 0644 ipt_NETFLOW.h "$pkgdir/usr/src/${_pkgbase}-$pkgver/ipt_NETFLOW.h"    
    install -D -o root -g root -m 0644 murmur3.h "$pkgdir/usr/src/${_pkgbase}-$pkgver/murmur3.h"    
    install -D -o root -g root -m 0755 version.sh "$pkgdir/usr/src/${_pkgbase}-$pkgver/version.sh"    
    
    install -D -o root -g root -m 0644 ../modprobe.conf "$pkgdir/usr/lib/modprobe.d/${_pkgbase}.conf"
	install -D -o root -g root -m 0644 CREDITS "$pkgdir/usr/share/licenses/${_pkgbase}/LICENSE"
	install -D -o root -g root -m 0644 IPT-NETFLOW-MIB.my "$pkgdir/usr/share/snmp/mibs/IPT-NETFLOW-MIB.txt"
	install -D -o root -g root -m 0644 README "$pkgdir/usr/share/doc/${_pkgbase}/README"
	install -D -o root -g root -m 0644 README.promisc "$pkgdir/usr/share/doc/${_pkgbase}/README.promisc"
	install -D -o root -g root -m 0644 NEWS "$pkgdir/usr/share/doc/${_pkgbase}/NEWS"
	
    install -D -o root -g root -m 0755 libipt_NETFLOW.so "$pkgdir/usr/lib/iptables/libipt_NETFLOW.so"
	install -D -o root -g root -m 0755 libip6t_NETFLOW.so "$pkgdir/usr/lib/iptables/libip6t_NETFLOW.so"
}

md5sums=('SKIP'
         '5f01a429030bda20f486a14624066e2d'
         'e3fb833f27ec565a40819fa4e5b15c48'
         'ce5b763e857a38dab5f22ad77e0c248e')

