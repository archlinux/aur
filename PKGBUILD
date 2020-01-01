# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>
# Previously: Carsten Feuls <archlinux@carstenfeuls.de> 
# Previously:John Lane <archlinux at jelmail dot com>
# Previously:Fisher Duan <steamedfish@njuopen.com> Ryan Corder <ryanc@greengrey.org>

_pkgname=cyrus-imapd
pkgname=cyrus-imapd2
pkgver=2.5.15
pkgrel=1
pkgdesc="Cyrus IMAP mail server - 2.5"
arch=('x86_64' 'armv6h' 'armv7h')
url="http://www.cyrusimap.org/"
license=('custom')
depends=('cyrus-sasl' 'db' 'libsasl' 'perl')
provides=('imap-server' 'pop3-server' 'cyrus-imapd')
conflicts=('imap-server' 'pop3-server' 'cyrus-imapd')
options=('!makeflags')
backup=(etc/cyrus/cyrus.conf etc/cyrus/imapd.conf)
install="$_pkgname.install"
source=(https://www.cyrusimap.org/releases/cyrus-imapd-$pkgver.tar.gz
        'cyrus-master-conf.d'
        'cyrus-imapd.install'
        'cyrus-master.service')
sha512sums=('9a61baa15f5a2c18843c4cf8e7cb7c58050c22de3c674ed17c2ea57fc8a3ac7f9a6aa954f61bbc77104e16a5464ac83d05c2b84ece953f86ab820461ffcd62b3'
            '881540a400670e86499db76af7cc41aa663a4492e3c512dbf0687f42b4a54dc5aca9df3ad315dd1c606d084feeec1a07670d50fae82fb9e71f30d5321d94327f'
            '80bfc8a2fca10cd2aa965449c426c987adf156017b111cebc37b889b3d41b7c5ba8a574e3b858166a72101a0e55f02c16411d06aa4dadc0b6410d40d68902386'
            '6cc4bbed0d5342a28a69e4acfa4a89f7a8909c6271e2e819e8da855dca2873fdaa5cea6519cb09c169b507df273d030eff5677bb07c4bf6591939958dd8e1bfe')

build() {
    cd $srcdir/$_pkgname-$pkgver

	./configure \
     --prefix=/usr \
     --includedir=/usr/include/cyrus --mandir=/usr/share/man \
     --docdir=/usr/share/doc/cyrus \
     --datadir=/usr/share/cyrus --sysconfdir=/etc/cyrus \
     --localstatedir=/var/lib/cyrus \
     --sharedstatedir=/usr/share/cyrus \
     --enable-murder --enable-nntp --enable-replication \
     --enable-idled \
     --with-cyrus-user=cyrus --with-cyrus-group=mail \
     --with-pidfile=/var/run/cyrmaster.pid \
     --with-syslogfacility=MAIL \
     --with-cyrus-prefix=/usr/lib/cyrus \
     --without-libwrap \
     --exec-prefix=/usr --libexecdir=/usr/sbin

    make
}

package() {
    cd $srcdir/$_pkgname-$pkgver

    make DESTDIR="${pkgdir}" install

    # create required directories first    
    mkdir -m 0755 -p $pkgdir/usr/lib/systemd/system
    mkdir -m 0755 -p $pkgdir/usr/include/cyrus
    mkdir -m 0755 -p $pkgdir/etc/cyrus
    mkdir -m 0755 -p $pkgdir/etc/conf.d
    mkdir -m 0755 -p $pkgdir/etc/rc.d
    mkdir -m 0755 -p $pkgdir/usr/bin
    
    install -m 755 ${srcdir}/$_pkgname-$pkgver/tools/mkimap ${pkgdir}/usr/bin/
    
    # rename master.8 so it doesn't conflict with master.8 from Postfix
    mv $pkgdir/usr/share/man/man8/master.8 $pkgdir/usr/share/man/man8/cyrus-master.8

    # move cyradm to standard location
    mv $pkgdir/usr/bin/site_perl/cyradm $pkgdir/usr/bin/cyradm
    rmdir $pkgdir/usr/bin/site_perl

    # install configs, rc scripts, etc
    install -m 600 $srcdir/$_pkgname-$pkgver/master/conf/normal.conf \
        $pkgdir/etc/cyrus/cyrus.conf
    echo "# see imapd.conf(5) man page for correct setup of this file" >> \
        $pkgdir/etc/cyrus/imapd.conf
    chmod 600 $pkgdir/etc/cyrus/imapd.conf
    install -m 644 $srcdir/cyrus-master-conf.d $pkgdir/etc/conf.d/cyrus-master
    install -m 644 $srcdir/cyrus-master.service \
        $pkgdir/usr/lib/systemd/system/cyrus-master.service
    install -Dm 644 $srcdir/$_pkgname-$pkgver/COPYING \
        $pkgdir/usr/share/licenses/$_pkgname/COPYING
    install -Dm 644 $srcdir/$_pkgname-$pkgver/README \
        $pkgdir/usr/share/doc/$_pkgname/README
}


