# Maintainer: MartiMcFly martimcfly@autorisation.de

_pkgname=('spellchecker')
pkgname=("zarafa-webapp-${_pkgname}")
groups=('zarafa')
pkgver=1.0
pkgrel=69
pkgdesc='Spellchecker plugin for Zarafa Webapp'
arch=('any')
source=("https://download.zarafa.com/community/final/WebApp/2.1.2/fedora-22/zarafa-webapp-plugins-spell-1.0-21.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.1.2/fedora-22/zarafa-webapp-plugins-spell-de-at-1.0-5.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.1.2/fedora-22/zarafa-webapp-plugins-spell-de-ch-1.0-4.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.1.2/fedora-22/zarafa-webapp-plugins-spell-de-de-1.0-4.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.1.2/fedora-22/zarafa-webapp-plugins-spell-en-1.0-3.2.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.1.2/fedora-22/zarafa-webapp-plugins-spell-es-1.0-3.1.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.1.2/fedora-22/zarafa-webapp-plugins-spell-fr-1.0-1.2.noarch.rpm"
	"https://download.zarafa.com/community/final/WebApp/2.1.2/fedora-22/zarafa-webapp-plugins-spell-nl-1.0-21.3.noarch.rpm"
	"compress-static"
	"zarafa-webapp-spellchecker.ini")
backup=("etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php")
license=('AGPL3')
depends=('zarafa-webapp'
	 'php<7'
	 'php-fpm<7'
	 'php-enchant<7')
md5sums=('c6da926fed446a8b80abe68e7cfcbcba'
         '0851cee43fb59dafe3795a0380cf37ff'
         'aa83cf83017d2cacd5725dc966f3a366'
         '1c224c7e234a211ad3e1d475bdd5954b'
         '12dd2207f6afc1c353cf4b5add2ffcf5'
         '7f471b216bca3ae09ea1ad71983f5d23'
         '68336fdd31147a2727d15b6cf93a6bb8'
         '3d9fb645869b7a8d2360fd8354c5abaf'
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
