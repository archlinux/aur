# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>
# Contributor: C Anthony Risinger
# Contributer: Jörg Thalheim <joerg@higgsboson.tk>

pkgname=z-push
groups=('zarafa'
	'kopano')
pkgver=2.5.1
pkgrel=1
pkgdesc="open-source implementation of the ActiveSync protocol"
arch=('any')
url="https://z-push.org/"
license=('AGPL3')
makedepends=('git'
	     'php-composer')
depends=('nginx'
	 'php'
	# 'kopano-core' # php-mapi
	 'php-fpm')
install='install'
backup=('etc/webapps/z-push/nginx-location.conf'
	'etc/php/conf.d/z-push.ini'
	'etc/php/fpm.d/z-push.conf')
options=('!strip')
source=("${pkgname}-${pkgver}::git+https://stash.z-hub.io/scm/zp/z-push.git#tag=${pkgver}"
        "apache.example.conf"
        "htaccess"
	"z-push.ini"
	"z-push.conf"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf"
	"z-push-admin"
	"z-push-top")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
    # according to https://wiki.archlinux.org/index.php/Web_application_package_guidelines
    mkdir -p ${pkgdir}/usr/share/webapps/z-push
    cp -r ${srcdir}/${pkgname}-${pkgver}/src/* ${pkgdir}/usr/share/webapps/z-push/
    cp ${srcdir}/htaccess ${pkgdir}/usr/share/webapps/z-push/.htaccess
    rm ${pkgdir}/usr/share/webapps/z-push/config.php
	rm ${pkgdir}/usr/share/webapps/z-push/policies.ini
    sed -i -e "s|\('MAPI_SERVER', \).*$|\1'file:///var/run/kopano/server.sock'\);|" ${pkgdir}/usr/share/webapps/z-push/backend/kopano/config.php

    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/z-push-admin ${pkgdir}/usr/bin
    cp ${srcdir}/z-push-top ${pkgdir}/usr/bin
    
    mkdir -p ${pkgdir}/etc/webapps/z-push
    cp ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/php-fpm.example.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/z-push/
    cp ${srcdir}/${pkgname}-${pkgver}/src/config.php ${pkgdir}/etc/webapps/z-push/config.example.php
	cp ${srcdir}/${pkgname}-${pkgver}/src/policies.ini ${pkgdir}/etc/webapps/z-push/policies.ini
    sed -i -e "s|\('BACKEND_PROVIDER', \).*$|\1'BackendKopano'\);|" ${pkgdir}/etc/webapps/z-push/config.example.php

    ln -s /etc/webapps/z-push/config.php ${pkgdir}/usr/share/webapps/z-push/config.php
	ln -s /etc/webapps/z-push/policies.ini ${pkgdir}/usr/share/webapps/z-push/policies.ini
    
    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/z-push.ini ${pkgdir}/etc/php/conf.d

    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp ${srcdir}/z-push.conf ${pkgdir}/etc/php/fpm.d

    mkdir -p ${pkgdir}/var/log/z-push
}
