# Maintainer: Nils Czernia <nils[at]czserver[dot[de>
pkgname=moodle
pkgver=3.0
pkgrel=1
pkgdesc='Moodle is a open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php' 'php-intl' 'php-gd')
conflicts=('moodle-plus')
options=('!strip')
source=("https://download.moodle.org/stable30/moodle-${pkgver}.tgz")
sha256sums=('bd7b4df293ea04d857093e328a05cc85514dfe6a58614dfac24ac92e1dd55380')

package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps
    install -dm0755 var/lib/${pkgname}
    install -dm0755 etc/webapps/${pkgname}
    cp -a "$srcdir"/$pkgname usr/share/webapps/${pkgname}

    # move data in var
    ln -s ../../../var/lib/${pkgname} usr/share/webapps/moodledata
    
    # mode config to /etc/webapps
    mv usr/share/webapps/moodle/config-dist.php ${pkgdir}/etc/webapps/${pkgname}/config-dist.php
    touch ${pkgdir}/etc/webapps/${pkgname}/config.php
    ln -s ../../../../etc/webapps/${pkgname}/config.php usr/share/webapps/moodle

    # fix rights and ownership
    chown -R http:http usr/share/webapps/${pkgname}
    chown -R http:http var/lib/${pkgname}
    chown -R http:http etc/webapps/${pkgname}

    # php.ini
    install -dm0755 $pkgdir/etc/php/conf.d/
    echo 'open_basedir = ${open_basedir}:/usr/share/webapps/moodle:/usr/share/webapps/moodledata:/var/lib/moodle:/etc/webapps/moodle' > $pkgdir/etc/php/conf.d/moodle.ini
}
