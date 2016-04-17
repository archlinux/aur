# Maintainer: MartiMcFly martimcfly@autorisation.de

pkgname=sabre-zarafa
groups=('zarafa')
pkgver=0.23
pkgrel=10
pkgdesc="provide a full CardDav backend for SabreDAV to connect with Zarafa groupware"
arch=('any')
url="https://github.com/1afa/sabre-zarafa"
license=('AGPL3')
depends=('php<7'
	 'php-fpm<7')
makedepends=('php-composer'
	     'git')
optdepends=('nginx'
	    'zarafa-server')
install='install'
backup=('etc/webapps/sabre-zarafa/nginx-location.conf'
	'etc/php/conf.d/sabre-zarafa.ini'
	'etc/php/fpm.d/sabre-zarafa.conf')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/1afa/sabre-zarafa/archive/v${pkgver}.tar.gz"
	"sabre-zarafa.ini"
	"sabre-zarafa.conf"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf"
	"composer.json")

md5sums=('b2e64ec204acf44a72b34ae1cb2f92d0'
         '191c6f53107a53e3b51331282c125e63'
         'b0b98696ff5b11a5f06056686dff82d6'
         'e7fe86eb090b69d503f5cc28e03bf9ce'
         '1bdab5b1e4473c1b0f6ce2e5c8f1da61'
         '7adcf5e023718421a5e8e07e5e9a2480'
         '67fe9a12d3bafc877100bdaea728bbce')

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
    # => replace carddav_root_uri
    sed -i -e "s/\(CARDDAV_ROOT_URI', '\)\(.*\)\('.*$\)/\1\/carddav\3/" ${pkgdir}/etc/webapps/${pkgname}/config.example.inc.php
}
