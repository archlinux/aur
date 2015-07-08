# Maintainer chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Maintainer mazieres
# Contributor doze_worm <shuimao@gmail.com> the original port.

pkgname="sendmail"
pkgver=8.14.9
pkgrel=1
pkgdesc="The sendmail MTA"
arch=('i686' 'x86_64')
license=('Sendmail License')
provides=('sendmail=8.14')
conflicts=(
'msmtp-mta'
'postfix'
'exim'
'opensmtpd'
)
backup=(
'etc/conf.d/sendmail' 
'etc/mail/aliases' 
'etc/mail/sendmail.cf'
)
source=("ftp://ftp.sendmail.org/pub/sendmail/${pkgname}.${pkgver}.tar.gz"
"sendmail.service"
"sendmail.conf"
"sm-client.service"
)
url="http://www.sendmail.org"
depends=('db' 'cyrus-sasl')
md5sums=('6a3bdceffa592316f830be289a4bd783'
'a11b2aabaa97305431220c38c486081c'
'4b60270921f77772d1ba941d831b732d'
'3c95e29825ea97fc425e2e1ac42d1f22')
sha256sums=('f5a497151abd8f341cca0736c3f9bd703d574d93146b2989689dff6d7a445d75'
'380edeb289dfdfc5b0d4ea38df3a0fd35e6f83eeee76254ec7b3506eadfb674f'
'39730f2be66bb1f1e6bc7fff61911db632ecf4b891d348df525abe2020274580'
'ecbd0a27e868d73d87fcfec292c19ea9479d0a8e9783788596d9add5e012218f')

install="${pkgname}.install"

build(){
    cd "$srcdir/${pkgname}-${pkgver}" || return 1
	 # Add support for SASL2
	 chmod +w devtools/OS/Linux
	 echo -e "define(\`confSTDIO_TYPE', \`portable')\nAPPENDDEF(\`conf_sendmail_ENVDEF', \`-DSTARTTLS')\nAPPENDDEF(\`conf_sendmail_LIBS', \`-lssl -lcrypto')\n">>devtools/OS/Linux
	 echo "APPENDDEF(\`conf_sendmail_ENVDEF', \`-DNETINET6 -DSASL=2')" >>devtools/OS/Linux
	 echo "APPENDDEF(\`conf_sendmail_LIBS', \`-lresolv -lsasl2')" >>devtools/OS/Linux
	 echo "APPENDDEF(\`confLIBS', \`-ldb')" >>devtools/OS/Linux
	 echo "APPENDDEF(\`confMAPDEF', \`-DNEWDB')" >>devtools/OS/Linux

	 sed -i -e '58 s/^/dnl /' -e '59 s/^/dnl /' sendmail/Makefile.m4 # Sendmail expects user and group smmsp to exists before make install, this line prevent errors from that
    ./Build || return 1
	 sed -i -e '449 s/-o [^}]*}[^}]*}//' -e '449 s/-m .{GBINMODE}/-m 755/' obj.*/sendmail/Makefile # Sendmail expects user and group smmsp to exists before make install, this line prevent errors from that
    GROFF_NO_SGR=1 make -C doc/op op.txt op.ps
}

package(){
	mkdir -p $pkgdir/etc/conf.d/
	mkdir -p $pkgdir/usr/{bin,sbin,share/man,share/doc/sendmail,/lib/systemd/system} \
		$pkgdir/usr/man/man{1,5,8} $pkgdir/var/spool/mqueue \
	    || return 1
	cp sendmail.service sm-client.service $pkgdir/usr/lib/systemd/system
	cp sendmail.conf $pkgdir/etc/conf.d/sendmail
	cd "$srcdir/${pkgname}-${pkgver}" || return 1
	make install DESTDIR="$pkgdir" || return 1
	make -C mail.local force-install DESTDIR="$pkgdir" || return 1
	make -C rmail force-install DESTDIR="$pkgdir" || return 1
	mv $pkgdir/usr/man/* $pkgdir/usr/share/man/
	rmdir $pkgdir/usr/man
	cp -r cf $pkgdir/usr/share/sendmail-cf
	cp sendmail/aliases $pkgdir/etc/mail/aliases
	cp cf/cf/generic-linux.cf $pkgdir/etc/mail/sendmail.cf
	cp doc/op/op.{ps,txt} $pkgdir/usr/share/doc/sendmail/
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	find $pkgdir -user bin -print | xargs chown root
	find $pkgdir -group bin -print | xargs chgrp root
    mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
    rmdir $pkgdir/usr/sbin
}
