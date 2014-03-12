# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ldapauthmanager
pkgver=1.4.0
pkgrel=1
url=https://projects.jethrocarr.com/p/oss-ldapauthmanager/
pkgdesc="An LDAP user manager and password self-service webaapp."
arch=('any')
license=('AGPL')
depends=('php-ldap')
source=("https://projects.jethrocarr.com/p/oss-ldapauthmanager/downloads/get/ldapauthmanager-1.4.0.tar.bz2"
		'apache.conf')
md5sums=('4b41c3c9deaf2750e3ffcaaf9a0c6c22'
         '68861b3c06fc0db69ab45e7f9d5acfe4')
backup=('etc/webapps/ldapauthmanager/apache.conf'
        'etc/webapps/ldapauthmanager/config-settings.php')

post_install () {
    echo "## You will need to create a database ##"
    echo "$ mysql ­-u root ­-p < /usr/share/webapps/ldapauthmanager/sql/version_LATESTDATE_install.sql"
}

post_upgrade () {
    echo "## You will need to update your database ##"
    echo "$ mysql ­-u root ­-p < /usr/share/webapps/ldapauthmanager/sql/version_LATESTDATE_install.sql"
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    # Change hard coded "Group" to "Groups" in order to match other Arch related docs for setting up
    # system authentication using LDAP. This needs to be fixed to be an option upstream!
    find ./ -type f -print0 | xargs -n1 -0 sed -i 's/ou=Group/ou=Groups/g'

    mkdir -p ${pkgdir}/etc/webapps/ldapauthmanager
    mkdir -p ${pkgdir}/usr/share/webapps/ldapauthmanager

    find ./ -type f -execdir chmod 0644 {} \;
    cp -ra htdocs scripts sql resources ldap radius ${pkgdir}/usr/share/webapps/ldapauthmanager/
    install -Dm0664 htdocs/admin/config.php ${pkgdir}/etc/webapps/ldapauthmanager/config.php
    mv ${pkgdir}/{usr/share/webapps/ldapauthmanager/htdocs/include/sample-config,etc/webapps/ldapauthmanager/config-settings}.php

    install -Dm0664 $srcdir/apache.conf $pkgdir/etc/webapps/ldapauthmanager/apache.conf
}
