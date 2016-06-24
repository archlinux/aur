# Maintainer: Aleksandr Boiko <brdcom@ya.ru>

_pkgbase=ipt-netflow
pkgname=ipt-netflow-dkms-git
pkgver=r310.fc4f5f3
pkgrel=1
url=https://github.com/aabc/ipt-netflow
pkgdesc="High performance NetFlow v5, v9, IPFIX flow data export module for Linux kernel"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('dkms')
conflicts=('ipt-netflow-dkms')
source=("${_pkgbase}::git+${url}.git"
        'Makefile.in.patch'
        'dkms.conf'
        'modprobe.conf')
md5sums=('SKIP'
         '16a7e2f47c0ce1fb202bec3dd69c9d95'
         '1791b26249eff8ad354855f209dd9b2c'
         'ce5b763e857a38dab5f22ad77e0c248e')

pkgver() {
    cd "${srcdir}/${_pkgbase%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

prepare() {
    cd "$srcdir/${_pkgbase%-git}"
    
    # Patch
    msg2 "Patching Makefile.in ..."
    patch -p0 < ../Makefile.in.patch
}

build () {
    cd "$srcdir/${_pkgbase%-git}"
    
    # Build
    msg2 "Starting ./configure..."
    ./configure

    msg2 "Starting make..."
    make libipt_NETFLOW.so
    make libip6t_NETFLOW.so
}

package() {
    cd "$srcdir/${_pkgbase%-git}"
    install -dm755 "$pkgdir/usr/src/${_pkgbase}-$pkgver"
    cp ./*.c "$pkgdir/usr/src/${_pkgbase}-$pkgver/"    
    cp ./*.h "$pkgdir/usr/src/${_pkgbase}-$pkgver/"    

    # Copy dkms.conf
    install -D -o root -g root -m 0644 ../dkms.conf "$pkgdir/usr/src/${_pkgbase}-$pkgver/dkms.conf"    
    # Set name and version
    sed -e "s/@_PKGNAME@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    
    install -D -o root -g root -m 0644 Makefile "$pkgdir/usr/src/${_pkgbase}-$pkgver/Makefile"    
    install -D -o root -g root -m 0644 Makefile.in "$pkgdir/usr/src/${_pkgbase}-$pkgver/Makefile.in"    
    install -D -o root -g root -m 0755 configure "$pkgdir/usr/src/${_pkgbase}-$pkgver/configure"    
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

