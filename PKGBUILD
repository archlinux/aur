# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

_pkgname=('delayeddelivery')
pkgname=("zarafa-webapp-${_pkgname}")
groups=('zarafa'
	'kopano'
        'zarafa-webapp-plugins')
pkgver=1.0.22.70
pkgrel=85
pkgdesc='Delayeddelivery plugin for Zarafa Webapp'
arch=('any')
source=("https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-delayeddelivery-1.0.22-70.1.noarch.rpm"
	"compress-static")
backup=("etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php")
license=('AGPL3')
depends=('zarafa-webapp')
md5sums=('8a913281cefa74fb02352da21a86926e'
         'd737d82dfab24adc516c001238a4119f')

package() {
    # plugin
    cd ${srcdir}/usr/share/zarafa-webapp/plugins/${_pkgname}
    mkdir -p ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/
    cp -R * ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/
    rm -f ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## precompress for nginx
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/

    # config
    cd ${srcdir}/etc/zarafa/webapp
    mkdir -p ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/

    ## config mains
    cp config-${_pkgname}.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php
    ln -s /etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## perform settings
    # convert windows line break to unix: http://stackoverflow.com/questions/11680815/removing-windows-newlines-on-linux-sed-vs-awk
    sed -i -e $'s/\r//' ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php
    sed -i -e "s/\(PLUGIN_DELAYEDDELIVERY_USER_DEFAULT_ENABLE', \)\(.*\)\();$\)/\1true\3/" ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## config examples      
    cp ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.example.php
}
