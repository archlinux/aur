# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname=kopano-sabre
groups=('zarafa'
	'kopano')
pkgver=0.23
pkgrel=201
pkgdesc="provide a full CardDav backend for SabreDAV to connect with Kopano groupware"
arch=('any')
url="https://github.com/1afa/sabre-zarafa"
license=('AGPL3')
depends=('php'
	 'php-fpm')
makedepends=('php-composer'
	     'git')
depends=('kopano-core')
install='install'
backup=('etc/webapps/kopano-sabre/nginx-location.conf'
	'etc/php/conf.d/kopano-sabre.ini'
	'etc/php/fpm.d/kopano-sabre.conf')
options=('!strip')

# Compatibility with Kopano
#"${pkgname}-${pkgver}.tar.gz::https://github.com/1afa/sabre-zarafa/archive/v${pkgver}.tar.gz"
source=("${pkgname}-${pkgver}::git+https://github.com/mpietruschka/sabre-zarafa.git"
	"kopano-sabre.ini"
	"kopano-sabre.conf"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf"
	"composer.json")

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
    # according to https://wiki.archlinux.org/index.php/Web_application_package_guidelines
    mkdir -p ${pkgdir}/usr/share/webapps/${pkgname}
    cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/webapps/${pkgname}/
    rm ${pkgdir}/usr/share/webapps/${pkgname}/config.inc.php
    rm ${pkgdir}/usr/share/webapps/${pkgname}/debug.txt
    rm -R ${pkgdir}/usr/share/webapps/${pkgname}/data

    mkdir -p ${pkgdir}/etc/webapps/${pkgname}
    cp ${srcdir}/php-fpm.example.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/${pkgname}/
    cp ${srcdir}/${pkgname}-${pkgver}/config.inc.php ${pkgdir}/etc/webapps/${pkgname}/config.example.inc.php
    ln -s /etc/webapps/${pkgname}/config.inc.php ${pkgdir}/usr/share/webapps/${pkgname}/config.inc.php

    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/${pkgname}.ini ${pkgdir}/etc/php/conf.d

    mkdir -p ${pkgdir}/etc/php/fpm.d
    cp ${srcdir}/${pkgname}.conf ${pkgdir}/etc/php/fpm.d

    mkdir -p ${pkgdir}/var/lib/${pkgname}
    ln -s /var/lib/${pkgname} ${pkgdir}/usr/share/webapps/${pkgname}/data
    
    mkdir -p ${pkgdir}/var/log/${pkgname}
    touch ${pkgdir}/var/log/${pkgname}/debug.txt
    ln -s /var/log/${pkgname}/debug.txt ${pkgdir}/usr/share/webapps/${pkgname}/debug.txt
    
    # workaround for buggy dependency
    rm ${pkgdir}/usr/share/webapps/${pkgname}/composer.json
    cp ${srcdir}/composer.json ${pkgdir}/usr/share/webapps/${pkgname}/composer.json
    
    # workaround for php. its impossible to provide several ini files.
    cd ${pkgdir}/usr/share/webapps/${pkgname}/
    cat ${srcdir}/${pkgname}.ini > /tmp/composer.ini
    echo >> /tmp/composer.ini
    
    echo "extension=phar.so" >> /tmp/composer.ini
    echo "extension=openssl.so" >> /tmp/composer.ini
    echo "open_basedir=$(which composer):$(pwd):$(realpath $HOME/.composer)" >> /tmp/composer.ini
    mkdir $HOME/.composer

    $(which php) -nc/tmp/composer.ini  $(which composer) config -g disable-tls true
    $(which php) -nc/tmp/composer.ini  $(which composer) install
    rm /tmp/composer.ini
    
    # perform settings
    sed -i -e "s|\(CARDDAV_ROOT_URI', '\)\(.*\)\('.*$\)|\1/carddav\3|" ${pkgdir}/etc/webapps/${pkgname}/config.example.inc.php
    sed -i -e "s|\(ZARAFA_SERVER', '\)\(.*\)\('.*$\)|\1file:///var/run/kopano/server.sock\3|" ${pkgdir}/etc/webapps/${pkgname}/config.example.inc.php    
}
