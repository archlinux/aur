# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Damian Nowak <nowaker@virtkick.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>
# Based on owncloud-git PKGBUILD by Alexander Ovsyannikov

pkgname=owncloud
pkgver=10.5.0
pkgrel=1
pkgdesc="Securely access and share data from everywhere and any device"
arch=('any')
url="https://owncloud.org/"
license=('GPL')
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
conflicts=('owncloud-app-gallery')
replaces=('owncloud-app-gallery')
options=('!strip')
backup=('etc/webapps/owncloud/apache.example.conf')
validpgpkeys=('E3036906AD9F30807351FAC32D5D5E97F6978A26'
              'DDA2C105C4B73A6649AD2BBD47AE7F72479BC94B')
source=("https://download.owncloud.org/community/owncloud-${pkgver}.tar.bz2"{,.asc}
        'apache.example.conf'
	'owncloud.hook'
)
sha256sums=('35232c0564cdb2140134563f339c6404bfb3d6133c54152cfaf207ce31aa1df1'
            'SKIP'
            'e19149bbe2fef90d2d669ca8912104f6cf3c435a6c19610b00c844230190f0fb'
            'fae2a021055a7bcf2ceece645e15a921aecefab088583a3f8c4d7d969578a36e')

package() {
    depends=('php' 'php-gd')

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

#    install -Dm0644 "$srcdir"/owncloud.hook "$pkgdir"/usr/share/libalpm/hooks/owncloud.hook
}
