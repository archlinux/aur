# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

_postfixadminver=2.93

pkgname='zarafa-postfixadmin'
replaces=('zarafa-postfixadmin-worker')
groups=('zarafa'
	'kopano')
pkgver=0.21
pkgrel=83
pkgdesc="A web based interface used to manage mailboxes, virtual domains and aliases created for Zarafa-Server with DB-Plugin and Postfix"
arch=('any')
license=('GPL')
url="https://git.pietma.com/pietma/com-pietma-${pkgname}"
depends=('bash'
	 'php<7'
	 'php-imap<7'
	 'mysql'
	 'zarafa-server'
	 
	 # fetchmail
	 'fetchmail'
	 'perl-dbi'
	 'perl-dbd-mysql'
	 'perl-lockfile-simple'
	 )
makedepends=('git')
install="install"
source=("postfixadmin-${_postfixadminver}.tar.gz::http://downloads.sourceforge.net/postfixadmin/postfixadmin-${_postfixadminver}.tar.gz"
	"zarafa-postfixadmin-${pkgver}::git+https://git.pietma.com/pietma/com-pietma-${pkgname}.git#tag=v${pkgver}")
md5sums=('d9a0e19bdb3241411cac8446d511fdb4'
         'SKIP')

package_zarafa-postfixadmin() {
    # POSTFIXADMIN
    ###
    _destdir_webapp=${pkgdir}/usr/share/webapps/${pkgname}
    _destdir_etc=${pkgdir}/etc/webapps/${pkgname}
    _destdir_fetchmail=${pkgdir}/etc/fetchmail-all
    _destdir_fetchmailpostfixadmin=${pkgdir}/etc/mail/postfixadmin
    _destdir_doc=${pkgdir}/usr/share/doc/${pkgname}
    _destdir_var=${pkgdir}/var/lib/${pkgname}
    _destdir_usr=${pkgdir}/usr/share/${pkgname}
    _destdir_systemd=${pkgdir}/usr/lib/systemd/system
    
    install -dm755 ${_destdir_fetchmail}
    install -dm755 ${_destdir_fetchmailpostfixadmin}
    install -dm755 ${_destdir_webapp}
    install -dm755 ${_destdir_etc}
    install -dm755 ${_destdir_doc}
    install -dm755 ${_destdir_var}

    # usr
    cd ${srcdir}/postfixadmin-${_postfixadminver}
    cp -r * ${_destdir_webapp}
    rm -R ${_destdir_webapp}/templates_c

    # var
    # template cache needs to be writeable
    mkdir ${_destdir_var}/templates_c
    ln -s /var/lib/${pkgname}/templates_c ${_destdir_webapp}/templates_c

    # docs
    mv ${_destdir_webapp}/{*.TXT,tests,ADDITIONS,DOCUMENTS,VIRTUAL_VACATION} ${_destdir_doc}
    rm -rf ${_destdir_webapp}/debian

    # etc
    cp ${_destdir_webapp}/config.inc.php ${_destdir_etc}/config.example.php

    # ZARAFA-POSTFIXADMIN
    ###
    cd ${srcdir}/zarafa-postfixadmin-${pkgver}
    cp etc/config.local.php ${_destdir_webapp}
    
    # etc
    cp etc/nginx-location.conf ${_destdir_etc}
    cp etc/config.default.php ${_destdir_etc}/config.local.php
    cp etc/config ${_destdir_fetchmail}
    cp etc/fetchmail.conf ${_destdir_fetchmailpostfixadmin}
    
    # docs
    cp -r doc/* ${_destdir_doc}

    ## php
    mkdir -p ${pkgdir}/etc/php/conf.d
    cp etc/php.ini ${pkgdir}/etc/php/conf.d/${pkgname}.ini

    ## php-fpm
    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp etc/php-fpm.conf ${pkgdir}/etc/php/fpm.d/${pkgname}.conf


    # ZARAFA-POSTFIXADMIN-WORKER
    ###
    install -dm755 ${_destdir_usr}
    install -dm755 ${_destdir_systemd}

    # usr
    mv usr/zarafa-postfixadmin.service ${_destdir_systemd}
    mv usr/fetchmail-postfixadmin.service ${_destdir_systemd}
    mv usr/fetchmail-postfixadmin.timer ${_destdir_systemd}
    mv usr/* ${_destdir_usr}
}
