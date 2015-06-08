# Maintainer: MartiMcFly info@pietma.com
# Contributor: Archist archist@die-optimisten.net
# Contributor: C Anthony Risinger

pkgname=('zarafa-webapp'
	 'zarafa-webapp-plugins')
pkgver=2.0.2.48619
_pkgrel=2.0.2
pkgrel=3
pkgdesc=('WebApp for Zarafa')
arch=('any')
url=('http://www.zarafa.com/')
license=('AGPL3')
install=('install')
backup=("etc/webapps/zarafa-webapp/config.php")
depends=('php')
makedepends=('apache-ant'
	     'gettext')
	
source=("webapp-${pkgver}.tar.gz::http://download.zarafa.com/community/final/WebApp/${_pkgrel}/webapp-${pkgver}.tar.gz"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf"
	"zarafa-webapp.conf"
	"zarafa-webapp.ini")
	
md5sums=('0d384708bd97d52fc2f9eb651f6f6f1e'
         'eac81900679ed0fc111fcaa1171bbd32'
         '73451bc5c35072b22b0b2925c5920978'
         '7adcf5e023718421a5e8e07e5e9a2480'
         'cc8143c1fa12911a17578c1e775225fe'
         'daedd4114b213e9279806ee720eeb1ef')

package_zarafa-webapp() {
    # create translations, compress javascript-files
    cd ${srcdir}/webapp-${pkgver}
    ant deploy

    # according to https://wiki.archlinux.org/index.php/Web_application_package_guidelines
    cd ${srcdir}/webapp-${pkgver}/deploy
    
    # create folders
    mkdir -p ${pkgdir}/usr/share/webapps/${pkgname}/
    cp -r * ${pkgdir}/usr/share/webapps/${pkgname}/
    cp ${srcdir}/webapp-${pkgver}/.htaccess ${pkgdir}/usr/share/webapps/${pkgname}/
    rm ${pkgdir}/usr/share/webapps/${pkgname}/zarafa-webapp.conf
    rm ${pkgdir}/usr/share/webapps/${pkgname}/config.php.dist
    rm ${pkgdir}/usr/share/webapps/${pkgname}/debug.php.dist
    
    mkdir -p ${pkgdir}/etc/webapps/${pkgname}
    cp ${srcdir}/php-fpm.example.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp zarafa-webapp.conf ${pkgdir}/etc/webapps/${pkgname}/apache.example.conf
    cp config.php.dist ${pkgdir}/etc/webapps/${pkgname}/config.example.php
    cp debug.php.dist ${pkgdir}/etc/webapps/${pkgname}/debug.example.php
    ln -s /etc/webapps/${pkgname}/config.php ${pkgdir}/usr/share/webapps/${pkgname}/config.php

    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/${pkgname}.ini ${pkgdir}/etc/php/conf.d

    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp ${srcdir}/${pkgname}.conf ${pkgdir}/etc/php/fpm.d

    mkdir -p ${pkgdir}/var/lib/${pkgname}

    mkdir -p ${pkgdir}/var/log/${pkgname}
    touch ${pkgdir}/var/log/${pkgname}/debug.txt
    ln -s /var/log/${pkgname}/debug.txt ${pkgdir}/usr/share/webapps/${pkgname}/debug.txt
}

package_zarafa-webapp-plugins() {
    # create translations, compress javascript-files
    cd ${srcdir}/webapp-${pkgver}
    ant deploy-plugins
    
    cd ${srcdir}/webapp-${pkgver}/deploy/plugins

    # create folders
    mkdir -p ${pkgdir}/usr/share/webapps/${pkgname//-plugins/}/plugins/
    cp -R * ${pkgdir}/usr/share/webapps/${pkgname//-plugins/}/plugins/
    
    # delete for privacy reasons and making sense
    cd ${pkgdir}/usr/share/webapps/${pkgname//-plugins/}/plugins/
    rm -R dropboxattachment
    rm -R example
    rm -R facebook
    rm -R facebookwidget
    rm -R gmaps
    rm -R salesforce
    rm -R spreed
    rm -R zperformance
    rm -R zdeveloper
    rm -R sugarcrm
    rm -R twidget
    rm -R feedback
    rm -R browsercompatibility
    rm -R statslogging
}
