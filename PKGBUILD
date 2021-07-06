
# Maintainer: Matthias Fulz <mfulz at olznet dot de>

pkgname=kimai2
pkgver=1.14.3
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
sha512sums=('9673423c70b5b768092c4958dc17b44a8917f3bca64c2256d6755bd8e575f7d362d3e14738a69166718aa830c1c5389c72510b937f4fa4bb112989db866168ca'
            'a920190216528a84511c20bff125620910c1e7294445ed6f1a57a94869860ad0400651ea0fac4dc4cfc83b59e35170c9962fa03fb65f863cd9752957b7c6d5a7'
            'd263b4e310ce7e18a3f53b0b976dff190d70da020506c766df11f210f327dc052db59abc36f44dfada6c963653e7aafd643f33a4eab2ca33f3a032c75137a03a'
            '98bed9e055c9d7265c6fd59514bc33edefe3a6fbe0298f9ed0f00c514f66d5eea19058850d827656d722edf5eccb07f18451791ef7bd017e13efcd102d72fb9a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # php for composer and deps
    mkdir -p "${HOME}/.composer/cache"
    (cat /etc/php/php.ini ; echo ; cat ${srcdir}/${_phpIni} ; echo ; echo "open_basedir=\${open_basedir}:$(pwd):/usr/share/webapps/kimai2:/etc/webapps/kimai2:/tmp:/var/lib/kimai2:/usr/bin/composer:${HOME}/.composer:/proc/version") > make-php.ini

    export PHP_INI_SCAN_DIR="$(pwd)"
    composer install --no-dev --optimize-autoloader
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
