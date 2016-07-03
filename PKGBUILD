# Maintainer: MartiMcFly martimcfly@autorisation.de

_pkgname=('passwd')
pkgname=("zarafa-webapp-${_pkgname}")
groups=('zarafa')
pkgver=1.2
pkgrel=68
pkgdesc='Passwd plugin for Zarafa Webapp'
arch=('any')
url='https://github.com/silentsakky/zarafa-webapp-passwd'
source=("https://github.com/silentsakky/zarafa-webapp-passwd/raw/master/builds/passwd-1.2.zip"
	"compress-static")
backup=("etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php")
license=('AGPL3')
depends=('zarafa-webapp'
	 'php<7'
	 'php-fpm<7')
md5sums=('65153d48c97fd60df9e37f0cff2b52c1'
         'd737d82dfab24adc516c001238a4119f')

package() {
    cd ${srcdir}/${_pkgname}

    # plugin
    mkdir -p ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/
    cp -R * ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/
    rm -f ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## precompress for nginx
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/

    # config
    mkdir -p ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/
        
    ## config mains
    cp config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php
    ln -s /etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## perform settings
    ## => enable plugin for all users
    sed -i -e "s/\(PLUGIN_PASSWD_USER_DEFAULT_ENABLE', \)\(.*\)\();$\)/\1true\3/" ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php
        
    ## config examples      
    cp ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.example.php    
}
