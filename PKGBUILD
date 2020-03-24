# Maintainer: MarcinWieczorek
# Co-Maintainer: dccafe

pkgname=ldap-account-manager
pkgver=7.1
pkgrel=1
pkgdesc="A webfrontend for managing entries stored in an LDAP directory"
arch=('any')
url="https://www.ldap-account-manager.org/"
license=('GPL')
depends=('php>=5.2.4' 'php-ldap' 'openldap>2.0')
optdepends=('php-mcrypt: Store LDAP password encrypted in the session file'
            'perl'
            'perl-quota: Quota module limits disk storage per user'
            'php-apache: Run LDAP Account Manager on Apache'
            'php-fpm: Run LDAP Account Manager on other webservers')
options=('!strip')
source=("https://sourceforge.net/projects/lam/files/LAM/${pkgver}/ldap-account-manager-${pkgver}.tar.bz2/download"
#        "dont-look-for-alternate-perl.patch"
#        "fix-htmldir-and-docdir.patch"
        "apache.example.conf"
        "nginx.example.conf")
sha256sums=('74a24029b7ef05c8cba393caf21bce9328599f74d3bdbc816d7184099bc062c8'
#           '013dd520a357ce39e9eda5169d26c73b48d05c7e73c7ce4377f31ace8f4c88a1'
#           'dc4afc691a53f5ff46eec4ef25cc3d593d7a5a2dcbcde070d54f6554027822b3'
            '229b281a85770f82f449e1e77ebd26b7583b5bc1266b234c653f2778067b1f34'
            'c1a95b12bf047afa2c6d268b66e54a6572c5c3eef46f4726920e09789b672b3e')

_webroot="usr/share/webapps/${pkgname}"
_confdir="etc/webapps/${pkgname}"
_docdir="usr/share/doc/${pkgname}"
_datadir="var/lib/${pkgname}"

prepare() {
    cd "${srcdir}"
    # patch "${pkgname}-${pkgver}/configure.ac" dont-look-for-alternate-perl.patch
    # patch "${pkgname}-${pkgver}/Makefile.in" fix-htmldir-and-docdir.patch
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

    chown http:http ${_datadir}
    chmod 775 ${_confdir}

    sed -i 's|/bin/|/usr/bin/|' ${_confdir}/templates/profiles/default.user
    sed -i 's|/bin/|/usr/bin/|' ${_webroot}/lib/modules/posixAccount.inc
}
