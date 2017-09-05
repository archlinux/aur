# Maintainer: <alexandre.becoulet@free.fr>
# Contributor: <netbug@ftp.uk.linux.org>
# Contributor: Fluke <fluke.l at gmail.com>

pkgname=netkit-telnet-ssl
pkgver=0.17.24+0.1
pkgrel=3
pkgdesc="telnet client and server with ssl enabled"
arch=('i686' 'x86_64')
license=('BSD')
url=("http://www.hcs.harvard.edu/~dholland/computers/netkit.html")
source=(http://ftp.de.debian.org/debian/pool/main/n/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
	netkit-telnet-ssl-0.17.24+0.1_arch.diff
	telnet.xinetd)
depends=('glibc' 'openssl' 'ncurses')
md5sums=('43a402139ed6b86434fdb83256feaad8'
	'd51bf898269a79a2de77d1134516c209'
	'ca38af6f1346ae90b2cb1e160858b453')
install=netkit-telnet-ssl.install

build() {
        cd $srcdir/$pkgname-$pkgver.orig
        patch -p1 < ../netkit-telnet-ssl-0.17.24+0.1_arch.diff
        ./configure --prefix=/usr --installroot=$pkgdir
        make -j1 || return 1
}

package() { 
        cd $srcdir/$pkgname-$pkgver.orig
	mkdir -p $pkgdir/usr/{bin,sbin,man/man1,man/man5,man/man8} $pkgdir/etc/xinetd.d
        make install || return 1
	mv $pkgdir/usr/sbin/in.telnetd-ssl $pkgdir/usr/bin/in.telnetd-ssl
	rmdir $pkgdir/usr/sbin
        install -m644 $srcdir/telnet.xinetd $pkgdir/etc/xinetd.d/telnet-ssl
}

