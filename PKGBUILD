# Maintainer: piernov <piernov@piernov.org>

pkgname=sympa
pkgver=6.2.16
pkgrel=1
pkgdesc='Electronic mailing list manager'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.sympa.org/'
depends=('ca-certificates' 'smtp-server' 'perl' 'openssl' 'mhonarc' 'perl-archive-zip' 'perl-cgi'
	'perl-class-singleton' 'perl-dbi' 'perl-datetime-format-mail' 'perl-datetime-timezone'
	'perl-file-copy-recursive' 'perl-file-nfslock' 'perl-html-formattext'
	'perl-html-stripscripts-parser' 'perl-html-tree' 'perl-io-stringy' 'perl-libintl-perl'
	'perl-libwww' 'perl-mailtools' 'perl-mime-charset' 'perl-mime-encwords' 'perl-mime-tools'
	'perl-net-cidr' 'perl-template-toolkit' 'perl-term-progressbar' 'perl-unicode-linebreak'
	'perl-uri' 'perl-xml-libxml' 'perl-mime-lite-html')
optdepends=('perl-cgi-fast'
	'perl-crypt-ciphersaber'
	'perl-dbd-mysql: mysql support'
	'perl-dbd-odbc'
	'perl-dbd-oracle'
	'perl-dbd-pg: postgresql support'
	'perl-dbd-sqlite'
	'perl-dbd-sybase'
	'perl-data-password'
	'perl-encode-locale'
	'perl-io-socket-ssl'
	'perl-ldap: LDAP support'
	'perl-mail-dkim'
	'perl-net-dns'
	'perl-soap-lite'
	'mod_fcgid: fast-CGI support')
backup=('etc/sympa/sympa.conf')
install=$pkgname.install
source=("http://www.sympa.org/distribution/${pkgname}-${pkgver}.tar.gz"
        'sympa.service'
        'sympa-bulk.service'
        'sympa-archived.service'
        'sympa-bounced.service'
        'sympa-task_manager.service'
        'sympa.tmpfiles'
        'apache.conf'
        'sympa.sysusers')
md5sums=('cc9dea56afc159ef3bacf6c9b09ae338'
         'a34e73c086e4d63da3166c7010ea9d8b'
         '356475e4f0cdc6b1a1db8e0e9a327038'
         '84bf724827201d02572938d1c2ad26eb'
         'c5722500c63b860e9a7d21f59860cd24'
         '491145d1b9a412ba443cf11d09cb8345'
         '4228fd9c142b0e97550f1640200acf30'
         '68a23e4fc0a842b2d97d430e05400bb1'
         '2fa16a3085a0587d4eaf1b524d913a7f')

_sympauid=219

prepare() {
	cd $pkgname-$pkgver

	# Fix CA certificate bundle path
	sed "s|Sympa::Constants::DEFAULTDIR . '/ca-bundle.crt'|'/etc/ssl/certs/ca-certificates.crt'|" -i src/lib/Conf.pm

	# Fix user/group constant
	sed "s|--USER--|sympa|" -i src/lib/Sympa/Constants.pm.in
	sed "s|--GROUP--|sympa|" -i src/lib/Sympa/Constants.pm.in
}

build() {
	cd $pkgname-$pkgver

	./configure \
		--prefix=/usr \
		--enable-fhs \
		--sysconfdir=/etc/sympa \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/sympa \
		--localedir=/usr/share/locale \
		--datadir=/usr/share \
		--mandir=/usr/share/man \
		--docdir=/usr/share/doc/sympa \
		--localstatedir=/var \
		--with-confdir=/etc/sympa \
		--with-cgidir=/usr/share/webapps/sympa/cgi-bin \
		--with-staticdir=/usr/share/webapps/sympa/static_content \
		--with-piddir=/run/sympa \
		--with-user=219 \
		--with-group=219 \
		--with-aliases_file=/etc/sympa/aliases \
		--without-initdir
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install

# don't install bundled certs
	rm -f "${pkgdir}/usr/share/sympa/default/ca-bundle.crt"

# systemd services
	install -D -m 644 "$srcdir/sympa.service" "$pkgdir/usr/lib/systemd/system/sympa.service"
	install -D -m 644 "$srcdir/sympa-bulk.service" "$pkgdir/usr/lib/systemd/system/sympa-bulk.service"
	install -D -m 644 "$srcdir/sympa-archived.service" "$pkgdir/usr/lib/systemd/system/sympa-archived.service"
	install -D -m 644 "$srcdir/sympa-bounced.service" "$pkgdir/usr/lib/systemd/system/sympa-bounced.service"
	install -D -m 644 "$srcdir/sympa-task_manager.service" "$pkgdir/usr/lib/systemd/system/sympa-task_manager.service"
# systemd-tmpfiles
	install -D -m 644 "$srcdir/sympa.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/sympa.conf"
# systemd-sysusers
	install -D -m 644 "$srcdir/sympa.sysusers" "$pkgdir/usr/lib/sysusers.d/sympa.conf"
# apache conf
	install -D -m 644 "$srcdir/apache.conf" "$pkgdir/etc/webapps/sympa/apache.conf"

# Fix perms
	chown -R ${_sympauid}:${_sympauid} "$pkgdir/etc/sympa"
	chmod 0640 "$pkgdir/etc/sympa/sympa.conf"

#	mkdir -p "$pkgdir/var/log"
#	touch "$pkgdir/var/log/sympa.log"
#	chown ${_sympauid}:${_sympauid} "$pkgdir/var/log/sympa.log"
#	chmod 0640 "$pkgdir/var/log/sympa.log"


# Fix permissions on CGI wrappers
	chown ${_sympauid}:${_sympauid} "$pkgdir/usr/share/webapps/sympa/cgi-bin/wwsympa-wrapper.fcgi" "$pkgdir/usr/share/webapps/sympa/cgi-bin/sympa_soap_server-wrapper.fcgi"
	chmod 6755 "$pkgdir/usr/share/webapps/sympa/cgi-bin/wwsympa-wrapper.fcgi" "$pkgdir/usr/share/webapps/sympa/cgi-bin/sympa_soap_server-wrapper.fcgi"

# Fix permissions on newaliases wrapper
	chown :${_sympauid} "$pkgdir/usr/lib/sympa/sympa_newaliases-wrapper"
	chmod u+s "$pkgdir/usr/lib/sympa/sympa_newaliases-wrapper"

}
