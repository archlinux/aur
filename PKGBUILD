# Maintainer: MartiMcFly martimcfly@autorisation.de
# Contributor: Archist archist@die-optimisten.net

# according to https://wiki.archlinux.org/index.php/Web_application_package_guidelines
pkgname=('zarafa-webapp'
	 'zarafa-webapp-browsercompatibility'
	 'zarafa-webapp-clockwidget'
	 'zarafa-webapp-contactfax'
	 'zarafa-webapp-dropboxattachment'
	 'zarafa-webapp-extbox'
	 'zarafa-webapp-facebook'
	 'zarafa-webapp-facebookwidget'
	 'zarafa-webapp-feedback'
	 'zarafa-webapp-files'
	 'zarafa-webapp-folderwidgets'
	 'zarafa-webapp-gmaps'
	 'zarafa-webapp-oauthlib'
	 'zarafa-webapp-pdfbox'
	 'zarafa-webapp-pimfolder'
	 'zarafa-webapp-quickitems'
	 'zarafa-webapp-salesforce'
	 'zarafa-webapp-shellgame'
	 'zarafa-webapp-spreed'
	 'zarafa-webapp-statslogging'
	 'zarafa-webapp-sugarcrm'
	 'zarafa-webapp-titlecounter'
	 'zarafa-webapp-twidget'
	 'zarafa-webapp-webappmanual'
	 'zarafa-webapp-webodf'
	 'zarafa-webapp-xmpp'
         'zarafa-webapp-zdeveloper'
	 'zarafa-webapp-zperformance')
groups=('zarafa')
pkgver=2.1.1
_pkgrel=2.1.1
pkgrel=6
pkgdesc='WebApp for Zarafa'
arch=('any')
url='http://www.zarafa.com/'
license=('AGPL3')
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
	"zarafa-webapp.install"
	"compress-static")
md5sums=('2689688c328c7bb01fd2081e3c959265'
         'b64d0a12ff31cac4357ba8bb4cbfb6f8'
         '1bdab5b1e4473c1b0f6ce2e5c8f1da61'
         '7adcf5e023718421a5e8e07e5e9a2480'
         'cc8143c1fa12911a17578c1e775225fe'
         'daedd4114b213e9279806ee720eeb1ef'
         'bf62e8e0d7d5be45762f93b8340bf673'
         'd737d82dfab24adc516c001238a4119f')

build() {
    # create translations, compress javascript-files
    cd ${srcdir}/zarafa-webapp-${pkgver}
    ant deploy
    ant deploy-plugins
}

package_zarafa-webapp() {
    cd ${srcdir}/zarafa-webapp-${pkgver}/deploy
    
    # application
    install="${pkgname}.install"
    replaces=('zarafa-webapp-plugins')
    
    mkdir -p ${pkgdir}/usr/share/webapps/${pkgname}/
    cp -r * ${pkgdir}/usr/share/webapps/${pkgname}/
    cp ${srcdir}/zarafa-webapp-${pkgver}/.htaccess ${pkgdir}/usr/share/webapps/${pkgname}/

    rm -R ${pkgdir}/usr/share/webapps/${pkgname}/plugins/*
    rm ${pkgdir}/usr/share/webapps/${pkgname}/zarafa-webapp.conf
    rm ${pkgdir}/usr/share/webapps/${pkgname}/config.php.dist
    rm ${pkgdir}/usr/share/webapps/${pkgname}/debug.php.dist

    ## precompress for nginx
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/${pkgname}


    # config
    backup=("etc/webapps/${pkgname}/debug.php"
	    "etc/webapps/${pkgname}/config.php"
	    "etc/webapps/${pkgname}/nginx-location.conf"
	    "etc/php/conf.d/${pkgname}.ini"
    	    "etc/php/fpm.d/${pkgname}.conf")    

    mkdir -p ${pkgdir}/etc/webapps/${pkgname}
    
    ## config mains
    cp config.php.dist ${pkgdir}/etc/webapps/${pkgname}/config.php
    cp debug.php.dist ${pkgdir}/etc/webapps/${pkgname}/debug.php
    ln -s /etc/webapps/${pkgname}/config.php ${pkgdir}/usr/share/webapps/${pkgname}/config.php    

    ## config examples
    cp ${srcdir}/php-fpm.example.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp zarafa-webapp.conf ${pkgdir}/etc/webapps/${pkgname}/apache.example.conf
    cp ${pkgdir}/etc/webapps/${pkgname}/config.php ${pkgdir}/etc/webapps/${pkgname}/config.example.php
    cp ${pkgdir}/etc/webapps/${pkgname}/debug.php ${pkgdir}/etc/webapps/${pkgname}/debug.example.php

    ## php 
    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/${pkgname}.ini ${pkgdir}/etc/php/conf.d

    ## php-fpm
    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp ${srcdir}/${pkgname}.conf ${pkgdir}/etc/php/fpm.d


    # logs
    mkdir -p ${pkgdir}/var/log/${pkgname}
    touch ${pkgdir}/var/log/${pkgname}/debug.txt
    ln -s /var/log/${pkgname}/debug.txt ${pkgdir}/usr/share/webapps/${pkgname}/debug.txt
}

package_plugin() {
    pluginname=$1
    cd ${srcdir}/zarafa-webapp-${pkgver}/deploy/plugins/${pluginname}/

    # plugin
    depends=('zarafa-webapp')
    
    mkdir -p ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${pluginname}/
    cp -R * ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${pluginname}/
    
    rm -f ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${pluginname}/config.php
    
    ## precompress for nginx
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${pluginname}/


    # config ?
    if [[ -e config.php ]];
    then
	backup=("etc/webapps/zarafa-webapp/plugins/${pluginname}/config.php")

	mkdir -p ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${pluginname}/
	
	## config mains
	cp config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${pluginname}/config.php
	ln -s /etc/webapps/zarafa-webapp/plugins/${pluginname}/config.php ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${pluginname}/config.php
	
	## config examples
	cp ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${pluginname}/config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${pluginname}/config.example.php
    fi
}

package_zarafa-webapp-browsercompatibility() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-clockwidget() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-dropboxattachment() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-contactfax() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-extbox() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-facebook() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-facebookwidget() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-feedback() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-files() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-folderwidgets() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-gmaps() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-oauthlib() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-pdfbox() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-pimfolder() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-quickitems() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-salesforce() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-shellgame() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-spreed() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-statslogging() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-sugarcrm() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-titlecounter() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-twidget() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-webappmanual() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-webodf() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-xmpp() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-zdeveloper() {
    package_plugin ${pkgname//zarafa-webapp-/}
}

package_zarafa-webapp-zperformance() {
    package_plugin ${pkgname//zarafa-webapp-/}
}
