# Maintainer: pappy <pa314159@users.noreply.github.com>

_pkgname=cyrus-imapd
_srcname=cyrus-imapd-cyrus-imapd
pkgname=cyrus-imapd2
pkgver=2.5.17
pkgrel=1
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
sha256sums=('acdf35e32498d83fd9fed5c21ca765c36a14351c52b50961d2042bafcbcabb86'
            '45ed31ae8205b86c320ce74bd007f7b05c8f0fb05cf917f1814056b24234e4a1'
            '6b55becbb58ceb66408de19fb6465e4364bf16528d0caa8b756c4316d88419dc'
            '1c6054397b84866831ccc1647d154365cb46158d6d6b162f08bc205edda7119a'
            'd5e3f64aff773fb75d5221d567064741a0846849ead6de64d37255e59533c027')

prepare()
{
    cd $srcdir/$_srcname-$pkgver

	for s in ${source[@]}; do
		case $s in
			*.patch)
				echo -n Applying patch $s...
				patch -s -p1 -i $srcdir/$s
				echo ' done'
			;;
		esac
	done

	autoreconf -i
}

build()
{
    cd $srcdir/$_srcname-$pkgver

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

package()
{
    cd $srcdir/$_srcname-$pkgver

    make DESTDIR="${pkgdir}" install

    # create required directories first    
    install -m0755 -d \
		$pkgdir/usr/lib/systemd/system \
		$pkgdir/usr/include/cyrus \
		$pkgdir/etc/cyrus \
		$pkgdir/etc/conf.d \
		$pkgdir/usr/bin

    install -m 755 tools/mkimap ${pkgdir}/usr/bin/

    # rename master.8 so it doesn't conflict with master.8 from Postfix
    mv $pkgdir/usr/share/man/man8/master.8 $pkgdir/usr/share/man/man8/cyrus-master.8

    # move cyradm to standard location
    mv $pkgdir/usr/bin/site_perl/cyradm $pkgdir/usr/bin/cyradm
    rm -rf $pkgdir/usr/bin/site_perl

    # install configs, rc scripts, etc
    install -m 600 master/conf/normal.conf \
        $pkgdir/etc/cyrus/cyrus.conf
    echo "# see imapd.conf(5) man page for correct setup of this file" >> \
        $pkgdir/etc/cyrus/imapd.conf
    chmod 600 $pkgdir/etc/cyrus/imapd.conf
    install -m 644 $srcdir/cyrus-master-conf.d $pkgdir/etc/conf.d/cyrus-master
    install -m 644 $srcdir/cyrus-master.service \
        $pkgdir/usr/lib/systemd/system/cyrus-master.service
    install -Dm 644 COPYING \
        $pkgdir/usr/share/licenses/$_pkgname/COPYING
    install -Dm 644 README \
        $pkgdir/usr/share/doc/$_pkgname/README
}

