# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=nextcloud-daily
pkgver=1
pkgrel=4
pkgdesc="A cloud server to store your files centrally on a hardware controlled by you"
arch=('any')
url="https://nextcloud.com"
license=('AGPL')
depends=('php' 'php-gd')
conflicts=('nextcloud')
replaces=('nextcloud')
optdepends=('php-apache: to use the Apache web server'
            'php-sqlite: to use the SQLite database backend'
            'php-pgsql: to use the PostgreSQL database backend'
            'php-ldap: LDAP authentication'
            'php-intl'
            'php-apcu'
            'mariadb: to use the MySQL database backend'
            'smbclient: to mount SAMBA shares'
            'ffmpeg: file preview'
            'libreoffice: file preview')
options=('!strip')
backup=('etc/webapps/nextcloud/apache.example.conf'
        'etc/webapps/nextcloud/config/config.php')
validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A')
source=("https://download.nextcloud.com/server/daily/latest.tar.bz2"{,.asc}
        'apache.example.conf'
        'nextcloud.hook')
sha256sums=('b9f361e181648526a8c1f063c7764e4d197365e168afe47adba1fe2f9a008369'
            'SKIP'
            '6b0c7336e23c1ee152978c49de46e298dec6bd8db96cd91ac3159a30bdc3eeea'
            'd084cd6423c03f98087884b3c7b81f9510d1bea6c518860b64787a7f976cf0d3')

package() {
    _pkgname=nextcloud
    # install project
    install -d "$pkgdir"/usr/share/webapps/
    cp -R "$srcdir"/${_pkgname} "$pkgdir"/usr/share/webapps/.

    # install apache config file
    install -d  "$pkgdir"/etc/webapps/${_pkgname}
    install -m 644 "$srcdir"/apache.example.conf  "$pkgdir"/etc/webapps/${_pkgname}

    # move config to /etc
    install -d  "$pkgdir"/etc/webapps/${_pkgname}
    mv "$pkgdir"/usr/share/webapps/${_pkgname}/config "$pkgdir"/etc/webapps/${_pkgname}/config
    chown -R http:http "$pkgdir"/etc/webapps/${_pkgname}
    ln -s /etc/webapps/${_pkgname}/config "$pkgdir"/usr/share/webapps/${_pkgname}/config
    chown -R root:http "$pkgdir"/usr/share/webapps/${_pkgname}

    find "$pkgdir"/usr/share/webapps/${_pkgname} -type f -exec chmod 0644 {} \;
    find "$pkgdir"/usr/share/webapps/${_pkgname} -type d -exec chmod 0755 {} \;

    chmod a+x "$pkgdir"/usr/share/webapps/${_pkgname}/occ

#    install -Dm0644 "$srcdir"/nextcloud.hook "$pkgdir"/usr/share/libalpm/hooks/nextcloud.hook
}

