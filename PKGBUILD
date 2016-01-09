# Maintainer: MartiMcFly martimcfly@autorisation.de
# Contributor: Archist archist@die-optimisten.net

pkgname=('zarafa-webapp'
	 'zarafa-webapp-plugins')
groups=('zarafa')
pkgver=2.1.1
_pkgrel=2.1.1
pkgrel=2
pkgdesc=('WebApp for Zarafa')
arch=('any')
url=('http://www.zarafa.com/')
license=('AGPL3')
install=('install')
depends=('php<7'
	 'php-fpm<7')
makedepends=('apache-ant'
	     'gettext')
	
source=("webapp-${pkgver}.tar.gz::http://download.zarafa.com/community/final/WebApp/${_pkgrel}/sourcecode/webapp-${pkgver}.tar.gz"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf"
	"zarafa-webapp.conf"
	"zarafa-webapp.ini"
	"compress-static")
	
md5sums=('2689688c328c7bb01fd2081e3c959265'
         'b64d0a12ff31cac4357ba8bb4cbfb6f8'
         '1bdab5b1e4473c1b0f6ce2e5c8f1da61'
         '7adcf5e023718421a5e8e07e5e9a2480'
         'cc8143c1fa12911a17578c1e775225fe'
         'daedd4114b213e9279806ee720eeb1ef'
         'd737d82dfab24adc516c001238a4119f')

package_zarafa-webapp() {
    # create translations, compress javascript-files
    cd ${srcdir}/zarafa-webapp-${pkgver}
    ant deploy

    # according to https://wiki.archlinux.org/index.php/Web_application_package_guidelines
    cd ${srcdir}/zarafa-webapp-${pkgver}/deploy
    
    # create folders
    mkdir -p ${pkgdir}/usr/share/webapps/${pkgname}/
    cp -r * ${pkgdir}/usr/share/webapps/${pkgname}/
    cp ${srcdir}/zarafa-webapp-${pkgver}/.htaccess ${pkgdir}/usr/share/webapps/${pkgname}/
    rm ${pkgdir}/usr/share/webapps/${pkgname}/zarafa-webapp.conf
    rm ${pkgdir}/usr/share/webapps/${pkgname}/config.php.dist
    rm ${pkgdir}/usr/share/webapps/${pkgname}/debug.php.dist

    # compress for nginx
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/${pkgname}
        
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
    cd ${srcdir}/zarafa-webapp-${pkgver}
    ant deploy-plugins
    
    cd ${srcdir}/zarafa-webapp-${pkgver}/deploy/plugins

    # create folders
    mkdir -p ${pkgdir}/usr/share/webapps/${pkgname//-plugins/}/plugins/
    cp -R * ${pkgdir}/usr/share/webapps/${pkgname//-plugins/}/plugins/
    
    # compress for nginx
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/${pkgname//-plugins/}/plugins/
    
    # delete for privacy reasons and making sense
    cd ${pkgdir}/usr/share/webapps/${pkgname//-plugins/}/plugins/
    rm -R dropboxattachment
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
