# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=nextcloud-git
_pkgname=nextcloud
pkgver=13.0.0beta1.r182.gcec236f0af
pkgrel=1
pkgdesc="A cloud server to store your files centrally on a hardware controlled by you"
arch=('any')
url="https://nextcloud.com"
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
provides=('nextcloud')
conflicts=('nextcloud')
backup=('etc/webapps/nextcloud/apache.example.conf')
validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A')
source=('git+https://github.com/nextcloud/server.git'
        'git+https://github.com/nextcloud/activity.git'
        'git+https://github.com/nextcloud/files_pdfviewer.git'
        'git+https://github.com/nextcloud/files_texteditor.git'
        'git+https://github.com/nextcloud/files_videoplayer.git'
        'git+https://github.com/nextcloud/firstrunwizard.git'
        'git+https://github.com/nextcloud/gallery.git'
        'git+https://github.com/nextcloud/logreader.git'
        'git+https://github.com/nextcloud/nextcloud_announcements.git'
        'git+https://github.com/nextcloud/notifications.git'
        'git+https://github.com/nextcloud/password_policy.git'
        'git+https://github.com/nextcloud/serverinfo.git'
        'git+https://github.com/nextcloud/survey_client.git'
        'git+https://github.com/nextcloud/apps.git' # user_external app
        'apache.example.conf'
        'nextcloud.hook')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '55b892adb86a67c2fa12d79f0980c6aea75aed5c6f6f78f2c2b5e5575a012067'
            'd084cd6423c03f98087884b3c7b81f9510d1bea6c518860b64787a7f976cf0d3')

pkgver() {
   cd "server"
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
   cd "${srcdir}/server"
   git submodule update --init
   mv ../activity apps/
   mv ../files_pdfviewer apps/
   mv ../files_texteditor apps/
   mv ../files_videoplayer apps/
   mv ../firstrunwizard apps/
   mv ../gallery apps/
   mv ../logreader apps/
   mv ../nextcloud_announcements apps/
   mv ../notifications apps/
   mv ../password_policy apps/
   mv ../serverinfo apps/
   mv ../survey_client apps/
   mv ../apps/user_external apps/
}

package() {
    # install project
    install -d "$pkgdir"/usr/share/webapps/
    cp -R "$srcdir"/server "$pkgdir"/usr/share/webapps/${_pkgname}

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

    rm -r "${pkgdir}/usr/share/webapps/${_pkgname}/tests"
    rm -r "${pkgdir}/usr/share/webapps/${_pkgname}/.git"

#    install -Dm0644 "$srcdir"/nextcloud.hook "$pkgdir"/usr/share/libalpm/hooks/nextcloud.hook
}
