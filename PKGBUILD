# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Previous Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
pkgname=nextcloud20
_pkgname=nextcloud
pkgver=20.0.11
pkgrel=1
pkgdesc="A cloud server to store your files centrally on a hardware controlled by you"
arch=('any')
url="https://nextcloud.com"
license=('AGPL')
depends=('mariadb<10.6')
optdepends=('php7-apache: to use the Apache web server'
            'php7-sqlite: to use the SQLite database backend'
            'php7-pgsql: to use the PostgreSQL database backend'
            'php7-ldap: LDAP authentication'
            'php7-intl'
            'php7-apcu'
            'mariadb: to use the MySQL database backend'
            'smbclient: to mount SAMBA shares'
            'ffmpeg: file preview'
            'libreoffice: file preview')
options=('!strip')
backup=('etc/webapps/nextcloud/apache.example.conf'
        'etc/webapps/nextcloud/config/config.php')
#validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A') # Nextcloud Security <security@nextcloud.com>
conflicts=('nextcloud')
source=("https://download.nextcloud.com/server/releases/nextcloud-${pkgver}.tar.bz2"
        'apache.example.conf'
        'nextcloud.hook')
sha256sums=('08bac91f978d4e2249ac3cdf0a0fab7b7276aa6c3114e7b5da7514fd082d0fa0'
            '30a8ad62b0dc9523ca7f0387b1f0483d196c1e011ec7e3a5b98e7d33c721d4bf'
            'b8794c6b357c762f6d4e6f099d8073bd465d6cd87d6d07341568d9509720e6e8')

package() {
    depends=('php7>=7.4.0' 'php7<7.5.0' 'php7-gd')

    # install project
    install -d "$pkgdir"/usr/share/webapps/
    cp -R "$srcdir"/${_pkgname} "$pkgdir"/usr/share/webapps/.

    # install apache config file
    install -d  "$pkgdir"/etc/webapps/${_pkgname}
    install -m 644 "$srcdir"/apache.example.conf  "$pkgdir"/etc/webapps/${_pkgname}

    # move config to /etc
    install -d  "$pkgdir"/etc/webapps/${_pkgname}
    mv "$pkgdir"/usr/share/webapps/${_pkgname}/config "$pkgdir"/etc/webapps/${_pkgname}/config
    chown -R 33:33 "$pkgdir"/etc/webapps/${_pkgname}
    ln -s /etc/webapps/${_pkgname}/config "$pkgdir"/usr/share/webapps/${_pkgname}/config
    chown -R root:33 "$pkgdir"/usr/share/webapps/${_pkgname}

    find "$pkgdir"/usr/share/webapps/${_pkgname} -type f -exec chmod 0644 {} \;
    find "$pkgdir"/usr/share/webapps/${_pkgname} -type d -exec chmod 0755 {} \;

    chmod a+x "$pkgdir"/usr/share/webapps/${_pkgname}/occ

	# this was commented out from Nextcloud 20.0.7 release, so retaining for now
#    install -Dm0644 "$srcdir"/nextcloud.hook "$pkgdir"/usr/share/libalpm/hooks/nextcloud.hook
}
