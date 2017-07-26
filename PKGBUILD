# Maintainer: Damian Nowak <nowaker@virtkick.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>
# Based on owncloud-git PKGBUILD by Alexander Ovsyannikov

pkgname=owncloud
pkgver=10.0.2
pkgrel=1
pkgdesc="A cloud server to store your files centrally on a hardware controlled by you"
arch=('any')
url="https://owncloud.org/"
license=('GPL')
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
conflicts=('owncloud-app-gallery')
replaces=('owncloud-app-gallery')
options=('!strip')
backup=('etc/webapps/owncloud/apache.example.conf')
validpgpkeys=('E3036906AD9F30807351FAC32D5D5E97F6978A26')
source=("https://download.owncloud.org/community/owncloud-${pkgver}.tar.bz2"{,.asc}
        'apache.example.conf'
)
sha256sums=('3645214d6b9527dc218b4cdcbbf1d01809aaba14435d644b545bee0274c88fd0'
            'SKIP'
            '4a2ad4b4ecc6ede355bec9a21cbf8c8c4b9144033bdf0ed3366617bcb4df1144'
)

package() {
    # install license
    install -d "$pkgdir"/usr/share/licenses/${pkgname}
    cp "$srcdir"/${pkgname}/COPYING "$pkgdir"/usr/share/licenses/${pkgname}

    # install project
    install -d "$pkgdir"/usr/share/webapps/
    cp -R "$srcdir"/${pkgname} "$pkgdir"/usr/share/webapps/.

    # install apache config file
    install -d  "$pkgdir"/etc/webapps/${pkgname}
    install -m 644 "$srcdir"/apache.example.conf  "$pkgdir"/etc/webapps/${pkgname}

    # move config to /etc
    install -d  "$pkgdir"/etc/webapps/${pkgname}
    mv "$pkgdir"/usr/share/webapps/${pkgname}/config "$pkgdir"/etc/webapps/${pkgname}/config
    chown -R http:http "$pkgdir"/etc/webapps/${pkgname}
    ln -s /etc/webapps/${pkgname}/config "$pkgdir"/usr/share/webapps/${pkgname}/config
    chown -R root:http "$pkgdir"/usr/share/webapps/${pkgname}

    find "$pkgdir"/usr/share/webapps/${pkgname} -type f -exec chmod 0644 {} \;
    find "$pkgdir"/usr/share/webapps/${pkgname} -type d -exec chmod 0755 {} \;

    chmod a+x "$pkgdir"/usr/share/webapps/${pkgname}/occ
}
