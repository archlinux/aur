# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
# Based on owncloud-git PKGBUILD by Alexander Ovsyannikov

pkgname=owncloud
pkgver=9.1.3
pkgrel=2
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
	owncloud-463e2ea-php71-backport.patch
	owncloud-9.1.2-dont_warn_about_php_versions.patch
	owncloud-b129d5d-php71-backport.patch)
sha256sums=('e0a1eb35fffb61dab5ca41f6d3fdb4ddcc3ec09683cd620b8094846785d4f6e9'
            'SKIP'
            '4a2ad4b4ecc6ede355bec9a21cbf8c8c4b9144033bdf0ed3366617bcb4df1144'
            '9a68c60cba0ee12c05467a66b581adad284447f4d22cb56eec55ed8e4ab0a7d6'
            '5821d6b3234967d9cc86c4ccd1778190d2a95930316821455059ab63b417999e'
            '5916b893303a10eaff72f23394ca8fb566af6413460f16d74877ad822f2e8694')

prepare() {
  cd "$srcdir"/${pkgname}
  patch -p1 <"$srcdir"/owncloud-463e2ea-php71-backport.patch
  patch -p1 <"$srcdir"/owncloud-9.1.2-dont_warn_about_php_versions.patch
  patch -p1 <"$srcdir"/owncloud-b129d5d-php71-backport.patch
}

package() {
    # install license
    install -d "$pkgdir"/usr/share/licenses/${pkgname}
    cp "$srcdir"/${pkgname}/COPYING-* "$pkgdir"/usr/share/licenses/${pkgname}

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
