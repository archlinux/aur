# Maintainer: MartiMcFly <martimcfly@autorisation.de>

_postfixadminver=2.93

pkgname=('zarafa-postfixadmin'
	 'zarafa-postfixadmin-worker')
groups=('zarafa')
pkgver=0.18
pkgrel=70
pkgdesc="A web based interface used to manage mailboxes, virtual domains and aliases created for Zarafa-Server with DB-Plugin and Postfix"
arch=('any')
license=('GPL')
url="https://git.pietma.com/pietma/com-pietma-${pkgname}"
depends=('php'
	 'php-imap'
	 'mysql'
	 'zarafa-server')
source=("postfixadmin-${_postfixadminver}.tar.gz::http://downloads.sourceforge.net/postfixadmin/postfixadmin-${_postfixadminver}.tar.gz"
	"zarafa-postfixadmin-${pkgver}::git+https://git.pietma.com/pietma/com-pietma-${pkgname}.git#tag=v${pkgver}")
md5sums=('d9a0e19bdb3241411cac8446d511fdb4'
         'SKIP')

package_zarafa-postfixadmin() {
    install="${pkgname}.install"
    backup=("etc/webapps/${pkgname}/config.local.php")

    # POSTFIXADMIN
    ###
    _destdir=${pkgdir}/usr/share/webapps/${pkgname}
    _destdir_etc=${pkgdir}/etc/webapps/${pkgname}
    _destdir_doc=${pkgdir}/usr/share/doc/${pkgname}
    _destdir_lib=${pkgdir}/var/lib/${pkgname}

    install -dm755 ${_destdir}
    install -dm755 ${_destdir_etc}
    install -dm755 ${_destdir_doc}
    install -dm755 ${_destdir_lib}

    # usr
    cd ${srcdir}/postfixadmin-${_postfixadminver}
    cp -r * ${_destdir}
    rm -R ${_destdir}/templates_c

    # var
    # template cache needs to be writeable
    mkdir ${_destdir_lib}/templates_c
    ln -s /var/lib/${pkgname}/templates_c ${_destdir}/templates_c

    # docs
    mv ${_destdir}/{*.TXT,tests,ADDITIONS,DOCUMENTS,VIRTUAL_VACATION} ${_destdir_doc}
    rm -rf ${_destdir}/debian

    # etc
    cp ${_destdir}/config.inc.php ${_destdir_etc}/config.example.php

    # ZARAFA-POSTFIXADMIN
    ###
    cd ${srcdir}/zarafa-postfixadmin-${pkgver}/postfixadmin
    cp etc/config.local.php ${_destdir}
    
    # etc
    cp etc/nginx-location.conf ${_destdir_etc}
    cp etc/config.default.php ${_destdir_etc}/config.local.php
    
    # docs
    cp doc/* ${_destdir_doc}

    ## php
    mkdir -p ${pkgdir}/etc/php/conf.d
    cp etc/php.ini ${pkgdir}/etc/php/conf.d/${pkgname}.ini

    ## php-fpm
    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp etc/php-fpm.conf ${pkgdir}/etc/php/fpm.d/${pkgname}.conf
}

package_zarafa-postfixadmin-worker() {
    # ZARAFA-POSTFIXADMIN-WORKER
    ###
    _destdir=${pkgdir}/usr/share/${pkgname}
    _destdir_systemd=${pkgdir}/usr/lib/systemd/system
    _destdir_lib=${pkgdir}/var/lib/${pkgname}

    install -dm755 ${_destdir}
    install -dm755 ${_destdir_systemd}
    install -dm755 ${_destdir_lib}

    # usr
    cd ${srcdir}/zarafa-postfixadmin-${pkgver}/worker
    cp -r * ${_destdir}
    rm -rf ${_destdir}/systemd
    
    cp systemd/* ${_destdir_systemd}
}
