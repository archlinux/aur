# Maintainer: Dominik Peteler <archlinux@with-h.at>

pkgname=ldap-account-manager
pkgver=4.4
pkgrel=1
pkgdesc="A webfrontend for managing entries stored in an LDAP directory"
arch=('any')
url="https://www.ldap-account-manager.org/"
license=('GPL')
depends=('php>=5.2.4' 'php-ldap' 'openldap>2.0')
optdepends=('php-mcrypt: Store LDAP password encrypted in the session file'
            'perl'
            'php-apache: Run LDAP Account Manager on Apache'
            'php-fpm: Run LDAP Account Manager on other webservers')
options=('!strip')
source=(http://downloads.sourceforge.net/lam/${pkgname}-${pkgver}.tar.bz2
       dont-look-for-alternate-perl.patch
       fix-htmldir-and-docdir.patch
       apache.example.conf)
md5sums=('7ed89d9fd935ae44fa7236b06a255550'
         'a9674e38ec4a6e2e8c4c939212c60250'
         'd32a8d1d4863fe89fda04722404a621f'
         '288c8e57cc9f701050d35b79d70d66e8')

_webroot="usr/share/webapps/${pkgname}"
_confdir="etc/webapps/${pkgname}"
_docdir="usr/share/doc/${pkgname}"
_datadir="var/lib/${pkgname}"

prepare() {
	cd "$srcdir"
	patch "$pkgname-$pkgver/configure.ac" dont-look-for-alternate-perl.patch
	patch "$pkgname-$pkgver/Makefile.in" fix-htmldir-and-docdir.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr \
                    --with-httpd-user=http \
                    --with-httpd-group=http \
		    --with-web-root=/${_webroot} \
                    --sysconfdir=/${_confdir} \
                    --localstatedir=/${_datadir} \
                    --docdir=/${_docdir}
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
        install -Dm644 $srcdir/apache.example.conf $pkgdir/${_docdir}/apache.example.conf

        cd "$pkgdir"

        chown http:http ${_datadir}
        chmod 775 ${_confdir}

        sed -i \
            -e 's#/bin/#/usr/bin/#' \
            ${_confdir}/templates/profiles/default.user
        sed -i \
            -e 's#/bin/#/usr/bin/#' \
            ${_webroot}/lib/modules/posixAccount.inc
}
