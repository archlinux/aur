# Maintainer: MarcinWieczorek
# Co-Maintainer: dccafe

pkgname=ldap-account-manager
pkgver=9.4
pkgrel=1
pkgdesc="A webfrontend for managing entries stored in an LDAP directory"
arch=('any')
url="https://www.ldap-account-manager.org/"
license=('GPL')
depends=('php' 'php-ldap' 'openldap')
optdepends=('perl'
            'perl-quota: Quota module limits disk storage per user'
            'php-apache: Run LDAP Account Manager on Apache'
            'php-fpm: Run LDAP Account Manager on other webservers')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.bz2::https://sourceforge.net/projects/lam/files/LAM/${pkgver}/${pkgname}-${pkgver}.tar.bz2/download"
        "apache.example.conf"
        "nginx.example.conf")
sha256sums=('cfd2ffb6ca0d16ea8e196055265fc6780ddd6b6ef51a6ba11d5297eabe20e2f3'
            '229b281a85770f82f449e1e77ebd26b7583b5bc1266b234c653f2778067b1f34'
            'c1a95b12bf047afa2c6d268b66e54a6572c5c3eef46f4726920e09789b672b3e')

_webroot="usr/share/webapps/${pkgname}"
_confdir="etc/webapps/${pkgname}"
_docdir="usr/share/doc/${pkgname}"
_datadir="var/lib/${pkgname}"

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Remove tmp/internal from symlink list (it's a subdir of tmp, not a separate symlink)
    sed -i 's|LIST2 = sess tmp tmp/internal|LIST2 = sess tmp|' Makefile.in

    # Fix absolute symlinks to be relative (broken under DESTDIR/fakeroot)
    sed -i 's|$(LN_S) $(localstatedir)/$${i} $${i}|$(LN_S) ../../../../$(localstatedir)/$${i} $${i}|' Makefile.in
    sed -i 's|$(LN_S) $(sysconfdir) ${LIST3}|$(LN_S) ../../../../$(sysconfdir) ${LIST3}|' Makefile.in
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-httpd-user=http \
        --with-httpd-group=http \
        --with-web-root=/${_webroot} \
        --sysconfdir=/${_confdir} \
        --localstatedir=/${_datadir} \
        --docdir=/${_docdir}
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}/" install
    install -Dm644 "${srcdir}/apache.example.conf" "${pkgdir}/${_docdir}/apache.example.conf"

    cd "${pkgdir}"

    install -dm750 ${_datadir}/tmp/internal
    chown http:http ${_datadir} ${_datadir}/tmp/internal
    chmod 775 ${_confdir}

    sed -i 's|/bin/|/usr/bin/|' ${_confdir}/templates/profiles/default.user
    sed -i 's|/bin/|/usr/bin/|' ${_webroot}/lib/modules/posixAccount.inc
}
