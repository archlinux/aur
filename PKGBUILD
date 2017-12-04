# Submitter: Grey Christoforo <first name [at] last name [dot] net>
# Maintainer: Colin Arnott <colin@urandom.co.uk>

srcname=nextcloud
pkgname=${srcname}-testing
pkgver=13.0.0beta1
pkgrel=1
pkgdesc="Testing Release -- A cloud server to store your files centrally on a hardware controlled by you"
arch=('any')
url="https://nextcloud.com"
provides=('nextcloud')
conflicts=('nextcloud' 'owncloud')
license=('AGPL')
depends=('php-gd')
optdepends=('php-apache: to use the Apache web server'
            'php-sqlite: to use the SQLite database backend'
            'php-pgsql: to use the PostgreSQL database backend'
            'php-ldap: LDAP authentication'
            'php-intl'
            'php-apcu'
            'php-xcache'
            'mariadb: to use the MySQL database backend'
            'smbclient: to mount SAMBA shares'
            'php-mcrypt'
            'ffmpeg: file preview'
            'libreoffice: file preview')
options=('!strip')
backup=('etc/webapps/nextcloud/apache.example.conf')
validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A')
source=("https://download.nextcloud.com/server/prereleases/nextcloud-${pkgver}.tar.bz2"{,.asc}
        'apache.example.conf'
        'nextcloud.hook')
sha256sums=('158f7bc66f2ce5ef8f197d4e76053ecc94fd896e9f19fb91f996e8be304542af'
            'SKIP'
            '55b892adb86a67c2fa12d79f0980c6aea75aed5c6f6f78f2c2b5e5575a012067'
            'd084cd6423c03f98087884b3c7b81f9510d1bea6c518860b64787a7f976cf0d3')

package() {
    # install project
    install -d "$pkgdir"/usr/share/webapps/
    cp -R "$srcdir"/${srcname} "$pkgdir"/usr/share/webapps/.

    # install apache config file
    install -d  "$pkgdir"/etc/webapps/${srcname}
    install -m 644 "$srcdir"/apache.example.conf  "$pkgdir"/etc/webapps/${srcname}

    # move config to /etc
    install -d  "$pkgdir"/etc/webapps/${srcname}
    mv "$pkgdir"/usr/share/webapps/${srcname}/config "$pkgdir"/etc/webapps/${srcname}/config
    chown -R http:http "$pkgdir"/etc/webapps/${srcname}
    ln -s /etc/webapps/${srcname}/config "$pkgdir"/usr/share/webapps/${srcname}/config
    chown -R root:http "$pkgdir"/usr/share/webapps/${srcname}

    find "$pkgdir"/usr/share/webapps/${srcname} -type f -exec chmod 0644 {} \;
    find "$pkgdir"/usr/share/webapps/${srcname} -type d -exec chmod 0755 {} \;

    chmod a+x "$pkgdir"/usr/share/webapps/${srcname}/occ

#    install -Dm0644 "$srcdir"/nextcloud.hook "$pkgdir"/usr/share/libalpm/hooks/nextcloud.hook
}
