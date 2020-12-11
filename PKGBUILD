# Maintainer: Àlex Ramírez <aramirez@posteo.net>
# Based on the PKGBUILD by Sergej Pupykin <pupykin.s+arch@gmail.com>

_appname='nextcloud'
pkgname="${_appname}-stable"
provides=("$_appname")
conflicts=("$_appname")
pkgver=19.0.6
pkgrel=1
pkgdesc="A cloud server to store your files centrally on a hardware controlled by you"
arch=('any')
url="https://nextcloud.com"
license=('AGPL')
depends=()
optdepends=('php-apache: to use the Apache web server'
            'php-sqlite: to use the SQLite database backend'
            'php-pgsql: to use the PostgreSQL database backend'
            'php-ldap: LDAP authentication'
            'php-intl'
            'php-apcu'
            'mariadb: to use the MySQL database backend'
            'smbclient: to mount SAMBA shares'
            'php-mcrypt'
            'ffmpeg: file preview'
            'libreoffice: file preview')
options=('!strip')
backup=('etc/webapps/nextcloud/apache.example.conf')
validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A')
source=("https://download.nextcloud.com/server/releases/nextcloud-${pkgver}.tar.bz2"{,.asc}
        'apache.example.conf'
        'nextcloud-stable.hook')
sha256sums=('a6aa886b21343b24da8a5b5ddb37988be1b500f8effd81eac8ef230a9abb2898'
            'SKIP'
            '30a8ad62b0dc9523ca7f0387b1f0483d196c1e011ec7e3a5b98e7d33c721d4bf'
            '26373084dc42906814ee46e0c4ebceeeae512caf46eb7cde58b5dd972b7691b1')

package() {
    depends=('php>=7.4.0' 'php<7.5.0' 'php-gd')

    # install project
    install -d "$pkgdir"/usr/share/webapps/
    cp -R "$srcdir"/${_appname} "$pkgdir"/usr/share/webapps/.

    # install apache config file
    install -d  "$pkgdir"/etc/webapps/${_appname}
    install -m 644 "$srcdir"/apache.example.conf  "$pkgdir"/etc/webapps/${_appname}

    # move config to /etc
    install -d  "$pkgdir"/etc/webapps/${_appname}
    mv "$pkgdir"/usr/share/webapps/${_appname}/config "$pkgdir"/etc/webapps/${_appname}/config
    chown -R http:http "$pkgdir"/etc/webapps/${_appname}
    ln -s /etc/webapps/${_appname}/config "$pkgdir"/usr/share/webapps/${_appname}/config
    chown -R root:http "$pkgdir"/usr/share/webapps/${_appname}

    find "$pkgdir"/usr/share/webapps/${_appname} -type f -exec chmod 0644 {} \;
    find "$pkgdir"/usr/share/webapps/${_appname} -type d -exec chmod 0755 {} \;

    chmod a+x "$pkgdir"/usr/share/webapps/${_appname}/occ

#    install -Dm0644 "$srcdir"/nextcloud.hook "$pkgdir"/usr/share/libalpm/hooks/nextcloud.hook
}
