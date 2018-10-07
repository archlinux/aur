# Maintainer: Nils Czernia <nils[at]czserver[dot]de>
pkgname=librenms
pkgver=1.43
pkgrel=1
pkgdesc='Autodiscovering PHP/MySQL-based network monitoring system.'
arch=('any')
url='https://www.librenms.org/'
license=('GPL3')
depends=(
    'php' 'php-intl' 'php-gd' 'php-net-ipv4' 'php-net-ipv6' 'net-snmp'
    'graphviz' 'php-snmp' 'php-mcrypt' 'fping' 'imagemagick' 'whois' 'nmap'
    'rrdtool' 'git' 'mysql-python'
)
backup=("etc/webapps/${pkgname}/config.php")
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
    "librenms.logrotate"
    "librenms.sysusers"
    "librenms.tmpfile"
    "apache.example.conf"
    "nginx.example.conf"
)
sha256sums=('6f5fc969eae766d894715f703628534b35420ba3b77cc25988abfd522f14cb6c'
            '4189c171e4edb55ff11c80b313fed6ff4226ddb38f1e7c97e741e59e1c83afb8'
            'ee2a2d465e01b65863a603406d2bee8858ec488546cb84d5c4fdb3166cc062a3'
            'ad83d03b8459e87ecd77f9ffebe56ccb9cc2dff1d52ce1151ef79a1e26653361'
            'aed1a35b2d84f3b40e0d519ccdb56a5929896ae7cfedd3766f5df4b51fac3319'
            'e1722c586e61e320c2382b2322150e176c61523dccb81eeec6c3d4618819110c')

prepare() {
    cd "$srcdir"/${pkgname}-${pkgver}

    sed -i 's/\/opt\/librenms/\/usr\/share\/webapps\/librenms/g' librenms.nonroot.cron
    sed -i 's/\/opt\/librenms/\/usr\/share\/webapps\/librenms/g' librenms.cron

    # move logs to /var/log
    rm -rf logs
    ln -sf /var/log/${pkgname} logs
}

package() {
    install -d "$pkgdir"/{{etc,usr/share}/webapps/$pkgname,var/log/$pkgname}
    install -dm0755 "$pkgdir"/etc/logrotate.d

    cp -R ${pkgname}-${pkgver}/. "$pkgdir"/usr/share/webapps/${pkgname}/

    install -Dm644 ${pkgname}-${pkgver}/config.php.default "$pkgdir"/etc/webapps/${pkgname}/config.php
    ln -s /etc/webapps/${pkgname}/config.php "$pkgdir"/usr/share/webapps/${pkgname}/config.php

    install -D -m644 "${srcdir}"/${pkgname}.logrotate "$pkgdir"/etc/logrotate.d/${pkgname}
    install -dm0775 "$pkgdir"/usr/share/webapps/${pkgname}/rrd

    # php.ini
    install -dm0755 "$pkgdir"/etc/php/conf.d/
    echo 'open_basedir = ${open_basedir}:/usr/share/webapps/librenms:/etc/webapps/librenms:/proc' > "$pkgdir"/etc/php/conf.d/${pkgname}.ini

    install -D -m644 "$srcdir"/${pkgname}.sysusers "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
    install -D -m644 "$srcdir"/${pkgname}.tmpfile "$pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf"
}
