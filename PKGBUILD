
# Maintainer: Matthias Fulz <mfulz at olznet dot de>

pkgname=kimai2
_pkgbuildname=kimai
pkgver=2.3.0
pkgrel=1
pkgdesc="Kimai the free open source timetracker"
url="http://www.kimai.org/"
_phpIni="${pkgname}.ini"
arch=('any')
license=('GPL')
depends=('php' 'mariadb' 'php-gd' 'php-intl' 'php-xsl' 'php-imap' 'sudo' 'unzip')
makedepends=('git' 'composer' 'php')
source=(
        "https://github.com/kevinpapst/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "kimai2.install"
        "${_phpIni}"
        "kimai2-nginx.conf"
       )
sha512sums=('f24ff0c33bd54e37add2d597778083578bbb9d70b3880b4698d3754634cd8eefa8920a878d3c813aced4bee2bf298afb029c759b0ec01687c2498410c4b7ea40'
            'b9f73e0853d9992502a162be361204a936e9b2a43e2f55379a62c15ffca56d8511061beefd2cc34df5ca5396ae9329e22b650f4299045ccd5cfa1d36ad925ac9'
            'dfc918daa12d7530b3ad0ffa44c9fecf1c0547af1f1881b67156d7f06a71b33ac832738987a1896aa8adaf4757f01319a311a7c42943b6b06fd81e3e04287266'
            '98bed9e055c9d7265c6fd59514bc33edefe3a6fbe0298f9ed0f00c514f66d5eea19058850d827656d722edf5eccb07f18451791ef7bd017e13efcd102d72fb9a')

build() {
    cd "${srcdir}/${_pkgbuildname}-${pkgver}"

    # php for composer and deps
    mkdir -p "${HOME}/.composer/cache"
    (cat /etc/php/php.ini ; echo ; cat ${srcdir}/${_phpIni} ; echo ; echo "open_basedir=\${open_basedir}:$(pwd):/usr/share/webapps/kimai2:/etc/webapps/kimai2:/tmp:/var/lib/kimai2:/usr/bin/composer:${HOME}/.composer:/proc/version") > make-php.ini

    export PHP_INI_SCAN_DIR="$(pwd)"
    composer install --no-dev --optimize-autoloader -n
}

_binDir=usr/share/webapps/${pkgname}
_confDir=etc/webapps/${pkgname}
_libDir=var/lib/${pkgname}
_nginxDir=etc/nginx/sites-available

backup=(
        "${_confDir}/.env"
        "${_confDir}/config/packages/local.yaml"
        "${_nginxDir}/${pkgname}-nginx.conf"
       )

package() {
    install=${pkgname}.install

    cd "${srcdir}/${_pkgbuildname}-${pkgver}"
    (cat /etc/php/php.ini ; echo ; cat ${srcdir}/${_phpIni} ; echo ; echo "open_basedir=\${open_basedir}:$(pwd):/usr/share/webapps/kimai2:/etc/webapps/kimai2:/tmp:/var/lib/kimai2:/usr/bin/composer:/srv/http/.composer:/proc/version") > make-php.ini

    install -d -o root -g root -m 755 ${pkgdir}/${_binDir}
    install -d -o root -g root -m 755 ${pkgdir}/etc/php/conf.d
    install -d -o http -g http -m 750 ${pkgdir}/${_confDir}
    install -d -o http -g http -m 750 ${pkgdir}/${_libDir}

    # BIN
    cp -r ${srcdir}/${_pkgbuildname}-${pkgver}/. ${pkgdir}/${_binDir}/

    # CONF
    mv ${pkgdir}/${_binDir}/config ${pkgdir}/${_confDir}/config
    touch ${pkgdir}/${_confDir}/config/packages/local.yaml
    chown -R http:http ${pkgdir}/${_confDir}/config
    chmod 640 ${pkgdir}/${_confDir}/config/packages/local.yaml

    # NGINX
    install -d -o root -g root -m 755 ${pkgdir}/${_nginxDir}
    cp ${srcdir}/${pkgname}-nginx.conf ${pkgdir}/${_nginxDir}/

    mv ${pkgdir}/${_binDir}/.env ${pkgdir}/${_confDir}/.env
    chown http:http ${pkgdir}/${_confDir}/.env
    chmod 640 ${pkgdir}/${_confDir}/.env

    ln -sf /${_confDir}/config ${pkgdir}/${_binDir}/config
    ln -sf /${_confDir}/.env ${pkgdir}/${_binDir}/.env
    ln -sf /usr/share/webapps/kimai2/src ${pkgdir}/${_confDir}/src

    # LIB
    mv ${pkgdir}/${_binDir}/var/* ${pkgdir}/${_libDir}/
    rm -r ${pkgdir}/${_binDir}/var
    ln -sf /${_libDir} ${pkgdir}/${_binDir}/var

    # PERMISSIONS
    chown -R http: ${pkgdir}/${_libDir}/*
    chown -h http: ${pkgdir}/${_binDir}/var
    chown -h http: ${pkgdir}/${_binDir}/.env
    chown -h http: ${pkgdir}/${_binDir}/config
    chown -R http: ${pkgdir}/${_binDir}/public
    chown -R http: ${pkgdir}/${_binDir}/vendor
    chown -R http: ${pkgdir}/${_binDir}/composer.lock
    chown -R http: ${pkgdir}/${_binDir}/symfony.lock

    # PHP
    cp ${srcdir}/${_phpIni} ${pkgdir}/etc/php/conf.d/
}
