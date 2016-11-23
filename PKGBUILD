# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

_pkgname=('mdm')
pkgname=("zarafa-webapp-${_pkgname}")
groups=('zarafa'
	'kopano'
	'zarafa-webapp-plugins')
pkgver=1.1.0.49
pkgrel=82
pkgdesc='Mdm plugin for Zarafa Webapp'
arch=('any')
source=("https://download.zarafa.com/community/beta/WebApp/plugins/MDM/1.1/beta1/fedora-22/zarafa-webapp-plugins-mdm-1.1.0-49.1.noarch.rpm"
	"compress-static"
	"zarafa-webapp-mdm.ini")
backup=("etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php")
license=('AGPL3')
depends=('zarafa-webapp'
	 'z-push')
md5sums=('fb979c4b2ef7779d0175eb73f8f86764'
         'd737d82dfab24adc516c001238a4119f'
         'de837fc5ad2e8f2d70df5037f2a0a107')

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
    sed -i -e "s/\(PLUGIN_MDM_USER_DEFAULT_ENABLE_MDM', \)\(.*\)\();$\)/\1true\3/" ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php
    sed -i -e "s/\(PLUGIN_MDM_SERVER_SSL', \)\(.*\)\();$\)/\1true\3/" ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## config examples      
    cp ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.example.php

    # php
    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/${pkgname}.ini ${pkgdir}/etc/php/conf.d
}
