# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

_postfixadminver=2.93

pkgname='kopano-postfixadmin'
replaces=('zarafa-postfixadmin-worker'
          'zarafa-postfixadmin')
groups=('zarafa'
	'kopano')
pkgver=0.45.3
pkgrel=4
pkgdesc="A web based interface used to manage mailboxes, virtual domains and aliases created for Kopano-Server with DB-Plugin and Postfix"
arch=('any')
license=('GPL')
url="https://git.pietma.com/pietma/com-pietma-${pkgname}"
depends=(
	 'kopano-core'
	 'bash'
	 'php'
	 'php-imap'
	 'mysql'
	 'nginx'
	 
	 # fetchmail
	 'fetchmail'
	 'perl-dbi'
	 'perl-dbd-mysql'
	 'perl-lockfile-simple'
	 
	 # installation script
	 'lynx')
makedepends=('git')
install="install"

backup=(
	'etc/webapps/kopano-postfixadmin/config.local.php'
	'etc/mail/postfixadmin/fetchmail.conf'
	)

source=(						  
	"postfixadmin-${_postfixadminver}.tar.gz::https://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-2.93/postfixadmin-${_postfixadminver}.tar.gz"
	"kopano-postfixadmin-${pkgver}::git+https://git.pietma.com/pietma/com-pietma-zarafa-postfixadmin.git#branch=kopano" # #tag=v${pkgver}"
	)

md5sums=(
	'SKIP'
	'SKIP'
	)

package_kopano-postfixadmin() {
    # POSTFIXADMIN
    ###
    _destdir_webapp=${pkgdir}/usr/share/webapps/${pkgname}
    _destdir_etc=${pkgdir}/etc/webapps/${pkgname}
    _destdir_doc=${pkgdir}/usr/share/doc/${pkgname}
    _destdir_var=${pkgdir}/var/lib/${pkgname}
    _destdir_usr=${pkgdir}/usr/share/${pkgname}
    _destdir_systemd=${pkgdir}/usr/lib/systemd/system
    _destdir_php=${pkgdir}/etc/php
    
    install -dm755 ${_destdir_webapp}
    install -dm755 ${_destdir_etc}
    install -dm755 ${_destdir_doc}
    install -dm755 ${_destdir_var}
    install -dm755 ${_destdir_usr}
    install -dm755 ${_destdir_systemd}
    install -dm755 ${_destdir_php}

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
    # Fetchmail is integral part of ZPA now
    rm ${_destdir_doc}/ADDITIONS/fetchmail.pl
    rm -rf ${_destdir_webapp}/debian

    # etc
    cp ${_destdir_webapp}/config.inc.php ${_destdir_etc}/config.php.example


    # POSTFIXADMIN ENRICHMENT / KOPANO-POSTFIXADMIN
    ###
    cd ${srcdir}/kopano-postfixadmin-${pkgver}

    cp -r php/* ${_destdir_php}
    cp -rf webapp/* ${_destdir_webapp}
    cp -r etc/* ${_destdir_etc}
    cp -r doc/* ${_destdir_doc}

    cp systemd/* ${_destdir_systemd}
    cp usr/* ${_destdir_usr}
}
