# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>
# Previously: Carsten Feuls <archlinux@carstenfeuls.de> 
# Previously:John Lane <archlinux at jelmail dot com>
# Previously:Fisher Duan <steamedfish@njuopen.com> Ryan Corder <ryanc@greengrey.org>

_pkgname=cyrus-imapd
pkgname=cyrus-imapd2
pkgver=2.5.15
pkgrel=2
pkgdesc="Cyrus IMAP mail server - 2.5"
arch=('x86_64' 'armv6h' 'armv7h')
url="http://www.cyrusimap.org/"
license=('custom')
depends=('cyrus-sasl' 'db' 'libsasl' 'perl')
provides=('imap-server' 'pop3-server' 'cyrus-imapd')
conflicts=('imap-server' 'pop3-server' 'cyrus-imapd')
replaces=('cyrus-imapd')
backup=(etc/cyrus/cyrus.conf etc/cyrus/imapd.conf)
install="$_pkgname.install"
source=(https://github.com/cyrusimap/cyrus-imapd/archive/cyrus-imapd-$pkgver.tar.gz
		'gettid.patch'
        'cyrus-master-conf.d'
        'cyrus-imapd.install'
        'cyrus-master.service')
sha256sums=('ff2c61fe4c8665424425cd491ea816de3fa5f43765ebade27c686ffacfc9431c'
            '45ed31ae8205b86c320ce74bd007f7b05c8f0fb05cf917f1814056b24234e4a1'
            '6b55becbb58ceb66408de19fb6465e4364bf16528d0caa8b756c4316d88419dc'
            '1c6054397b84866831ccc1647d154365cb46158d6d6b162f08bc205edda7119a'
            'd5e3f64aff773fb75d5221d567064741a0846849ead6de64d37255e59533c027')

build() {
    cd $srcdir/$_pkgname-$pkgver

	patch -p1 -i $srcdir/gettid.patch

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

