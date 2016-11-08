# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

_pkgname=('desktopnotifications')
pkgname=("zarafa-webapp-${_pkgname}")
groups=('zarafa'
	'kopano'
        'zarafa-webapp-plugins')
pkgver=1.0.31.28
pkgrel=73
pkgdesc='Desktopnotifications plugin for Zarafa Webapp'
arch=('any')
source=("https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-desktopnotifications-1.0.31-28.1.noarch.rpm"
	"compress-static")
backup=("etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php")
license=('AGPL3')
depends=('zarafa-webapp')
md5sums=('5981f721d7bb16df6547793510f08c7c'
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
    sed -i -e "s/\(PLUGIN_DESKTOPNOTIFICATION_USER_DEFAULT_ENABLE', \)\(.*\)\();$\)/\1true\3/" ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## config examples      
    cp ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.example.php
}
