# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

_pkgname=('spellchecker')
pkgname=("zarafa-webapp-${_pkgname}")
groups=('zarafa'
	'kopano'
	'zarafa-webapp-plugins')
pkgver=1.0.22.32
pkgrel=78
pkgdesc='Spellchecker plugin for Zarafa Webapp'
arch=('any')
source=("https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-spell-1.0.22-32.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-spell-de-at-1.0.6-8.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-spell-de-ch-1.0.6-7.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-spell-de-de-1.0.7-7.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-spell-en-1.0.8-6.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-spell-en-gb-1.0.4-10.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-spell-es-1.0.6-8.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-spell-fr-1.0.8-6.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.2.0/sle-12/zarafa-webapp-plugins-spell-nl-1.0.13-31.1.noarch.rpm"
	"compress-static"
	"zarafa-webapp-spellchecker.ini")
backup=("etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php")
license=('AGPL3')
depends=('zarafa-webapp'
	 'php-enchant<7')
md5sums=('da7eca3e1330fefd22c1882bd50de393'
         '24878f219d479c157fa02af040c625ab'
         '3a5bba08cf90b784530fa6f8c5331e3c'
         'fb788feda67a9655c55700af94b8f54f'
         '5d8c02122e3402aed5e613d60b2c9699'
         '1c31c9e76d6c3431fc94f61730b01d13'
         '29df0def35519bf181a6c9c3586a91a6'
         'add63e3baf4803cb80177defb7187fcb'
         'b47bff874d2642651204dae035a2a218'
         'd737d82dfab24adc516c001238a4119f'
         'f93ad13e69cf5bf9be0b53473cc0d196')

package() {
    # plugin
    cd ${srcdir}/usr/share/zarafa-webapp/plugins/
    mkdir -p ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/
    cp -R ${_pkgname}* ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/
    rm -f ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## precompress for nginx
    ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/

    # config
    cd ${srcdir}/etc/zarafa/webapp
    mkdir -p ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/

    ## config mains
    cp config-${_pkgname}.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php
    ln -s /etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/usr/share/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## perform settings
    # convert windows line break to unix: http://stackoverflow.com/questions/11680815/removing-windows-newlines-on-linux-sed-vs-awk
    sed -i -e $'s/\r//' ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## config examples      
    cp ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.example.php

    ## php 
    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/${pkgname}.ini ${pkgdir}/etc/php/conf.d
}
