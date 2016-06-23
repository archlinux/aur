# Maintainer: Nils Czernia <nils[at]czserver[dot]de>
pkgname=librenms
pkgver=201606
pkgrel=1
pkgdesc='LibreNMS is an autodiscovering PHP/MySQL-based network monitoring system.'
arch=('any')
url='http://www.librenms.org/'
license=('GPLv3')
depends=('php' 'php-intl' 'php-gd' 'php-pear' 'net-snmp' 'graphviz' 'php-snmp' 'php-mcrypt' 'fping' 'imagemagick' 'whois' 'nmap' 'rrdtool' 'git' 'mysql-python')
backup=("etc/webapps/${pkgname}/config.php")
source=("https://github.com/librenms/${pkgname}/archive/${pkgver}.tar.gz"
        "apache.example.conf"
        "nginx.example.conf")
install="librenms.install"
sha256sums=('cef3a42d90797c86f26b14cc0879367a970b465c16beeabc43b07d7fefba93f2'
            'aed1a35b2d84f3b40e0d519ccdb56a5929896ae7cfedd3766f5df4b51fac3319'
            'e1722c586e61e320c2382b2322150e176c61523dccb81eeec6c3d4618819110c')
package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps
    install -dm0755 etc/webapps/${pkgname}
    install -dm0755 var/log/${pkgname}
    
    cp -a "$srcdir"/${pkgname}-${pkgver} usr/share/webapps/${pkgname}

    sed -i 's/\/opt\/librenms/\/usr\/share\/webapps\/librenms/g' usr/share/webapps/${pkgname}/librenms.nonroot.cron
    sed -i 's/\/opt\/librenms/\/usr\/share\/webapps\/librenms/g' usr/share/webapps/${pkgname}/librenms.cron

#    sed -i 's/python/python2/g' usr/share/webapps/${pkgname}/poller-service.py
#    sed -i 's/python/python2/g' usr/share/webapps/${pkgname}/poller-wrapper.py

    # copy config in etc and link it
    cp usr/share/webapps/${pkgname}/config.php.default etc/webapps/${pkgname}/config.php
    mv usr/share/webapps/${pkgname}/config.php.default etc/webapps/${pkgname}/config.php.default
    ln -s ../../../../etc/webapps/${pkgname}/config.php usr/share/webapps/${pkgname}/config.php
    ln -s ../../../../etc/webapps/${pkgname}/config.php.default usr/share/webapps/${pkgname}/config.php.default
    rm etc/webapps/${pkgname}/config.php
    
    # move logs to /var/log
    ln -s ../../../../var/log/${pkgname} usr/share/webapps/${pkgname}/logs

    install -dm0775 usr/share/webapps/${pkgname}/rrd

    # php.ini
    install -dm0755 $pkgdir/etc/php/conf.d/
 
   echo 'open_basedir = ${open_basedir}:/usr/share/webapps/librenms:/etc/webapps/librenms:/proc' > etc/php/conf.d/${pkgname}.ini
}
