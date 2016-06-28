# Maintainer: MartiMcFly martimcfly@autorisation.de

_pkgname=('smime')
pkgname=("zarafa-webapp-${_pkgname}")
groups=('zarafa')
pkgver=1.0
pkgrel=64
pkgdesc='Smime plugin for Zarafa Webapp'
arch=('any')
source=("https://download.zarafa.com/community/final/WebApp/plugins/SMIME%201.0/fedora-21/x86_64/zarafa-webapp-plugins-smime-1.0-31.1.noarch.rpm"
	"compress-static")
backup=("etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php")
license=('AGPL3')
depends=('zarafa-webapp'
	 'php<7'
	 'php-fpm<7')
md5sums=('93b58ed53c43564914a16788c37529e5'
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
    sed -i -e "s/\(PLUGIN_SMIME_CIPHER', \)\(.*\)\();$\)/\1OPENSSL_CIPHER_AES_256_CBC\3/" ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php
#    sed -i -e "s/\(PLUGIN_SMIME_CACERTS', \)\(.*\)\();$\)/\1\\'/etc/ssl/certs\\'\3/" ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php

    ## config examples      
    cp ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.php ${pkgdir}/etc/webapps/zarafa-webapp/plugins/${_pkgname}/config.example.php
}
