# Maintainer: Nils Czernia <nils[at]czserver[dot]de>
pkgname=librenms
pkgver=1.37
pkgrel=2
pkgdesc='Autodiscovering PHP/MySQL-based network monitoring system.'
arch=('any')
url='http://www.librenms.org/'
license=('GPLv3')
depends=('php' 'php-intl' 'php-gd' 'php-pear' 'net-snmp' 'graphviz' 'php-snmp' 'php-mcrypt' 'fping' 'imagemagick' 'whois' 'nmap' 'rrdtool' 'git' 'mysql-python')
backup=("etc/webapps/${pkgname}/config.php")
source=("https://github.com/librenms/${pkgname}/archive/${pkgver}.tar.gz"
        "librenms.logrotate"
		"librenms.sysusers"
		"librenms.tmpfile"
        "apache.example.conf"
        "nginx.example.conf")
install="librenms.install"
sha256sums=('86dbcb2875c7bb4df8e042d9fc08e771cb60f6db55ba59259a14c6a8b6eaa281'
            '4189c171e4edb55ff11c80b313fed6ff4226ddb38f1e7c97e741e59e1c83afb8'
            'b70ec2b7950719d6b502da52d983e1661c81da1494d423598f9043ce600f0399'
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
    install -dm0755 "$pkgdir"/usr/share/webapps
    install -dm0750 "$pkgdir"/etc/webapps/${pkgname}
    install -dm0755 "$pkgdir"/etc/logrotate.d
    install -dm0775 "$pkgdir"/var/log/${pkgname}

    cd "$srcdir"/${pkgname}-${pkgver}
    cp config.php.default "$pkgdir"/etc/webapps/${pkgname}/config.php
    cp config.php.default "$pkgdir"/etc/webapps/${pkgname}/config.php.default
    rm config.php.default
    ln -s /etc/webapps/${pkgname}/config.php "$pkgdir"/usr/share/webapps/${pkgname}/config.php
    ln -s /etc/webapps/${pkgname}/config.php.default "$pkgdir"/usr/share/webapps/${pkgname}/config.php.default

    cp -a "$srcdir"/${pkgname}-${pkgver} "$pkgdir"/usr/share/webapps/${pkgname}

    install -D -m644 "${srcdir}"/${pkgname}.logrotate "$pkgdir"/etc/logrotate.d/${pkgname}
    install -dm0775 "$pkgdir"/usr/share/webapps/${pkgname}/rrd

    # php.ini
    install -dm0755 "$pkgdir"/etc/php/conf.d/
    echo 'open_basedir = ${open_basedir}:/usr/share/webapps/librenms:/etc/webapps/librenms:/proc' > "$pkgdir"/etc/php/conf.d/${pkgname}.ini

	install -D -m644 "$srcdir"/${pkgname}.sysusers "$pkgdir/usr/lib/sysusers.d/${pkgname}.conf"
	install -D -m644 "$srcdir"/${pkgname}.tmpfile "$pkgdir/usr/lib/tmpfiles.d/${pkgname}.conf"
}
