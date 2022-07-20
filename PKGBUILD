
# Maintainer: Matthias Fulz <mfulz at olznet dot de>

pkgname=kimai2
pkgver=1.21.0
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
sha512sums=('ba8affc0a6de23d217474d71fdf6cf8a21231ca02a30d3b33aa83b90ab2aae8d495fe9ff2a991ec5d267087e737cdfb749ed500ebe82afa5acbfeb1f1b5f4619'
            'dd2d8bea6a454510d36a8509d0e5b87cb49cf87e2def16b947af0f77d1abf26ba72e02f5492453faf27d61c6f288eb083b7ad4cd1f224c7128b82dec59735336'
            'd263b4e310ce7e18a3f53b0b976dff190d70da020506c766df11f210f327dc052db59abc36f44dfada6c963653e7aafd643f33a4eab2ca33f3a032c75137a03a'
            '98bed9e055c9d7265c6fd59514bc33edefe3a6fbe0298f9ed0f00c514f66d5eea19058850d827656d722edf5eccb07f18451791ef7bd017e13efcd102d72fb9a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

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

    cd "${srcdir}/${pkgname}-${pkgver}"
    (cat /etc/php/php.ini ; echo ; cat ${srcdir}/${_phpIni} ; echo ; echo "open_basedir=\${open_basedir}:$(pwd):/usr/share/webapps/kimai2:/etc/webapps/kimai2:/tmp:/var/lib/kimai2:/usr/bin/composer:/srv/http/.composer:/proc/version") > make-php.ini

    install -d -o root -g root -m 755 ${pkgdir}/${_binDir}
    install -d -o root -g root -m 755 ${pkgdir}/etc/php/conf.d
    install -d -o http -g http -m 750 ${pkgdir}/${_confDir}
    install -d -o http -g http -m 750 ${pkgdir}/${_libDir}

    # BIN
    cp -r ${srcdir}/${pkgname}-${pkgver}/. ${pkgdir}/${_binDir}/

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
