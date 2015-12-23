# Maintainer: Nils Czernia <nils[at]czserver[dot]de>
pkgname=moodle-git
_pkgname=moodle
pkgver=3.0
pkgrel=1
pkgdesc='Moodle is a open-source software learning management system'
arch=('any')
url='https://moodle.org/'
license=('GPLv3')
depends=('php' 'php-intl' 'php-gd')
conflicts=('moodle' 'moodle-plus')
options=('!strip')
source=("moodle-git::git+https://github.com/moodle/moodle.git")
md5sums=('SKIP')

package() {
    cd "$pkgdir"
    install -dm0755 usr/share/webapps
    install -dm0755 var/lib/${_pkgname}
    cp -a "$srcdir"/${_pkgname} usr/share/webapps/${_pkgname}

    # move data in var
    ln -s ../../../var/lib/moodle usr/share/webapps/moodledata
    
    # fix rights and ownership
    chown -R http:http usr/share/webapps/${_pkgname}
    chown -R http:http var/lib/${_pkgname}

    # php.ini
    install -dm0755 $pkgdir/etc/php/conf.d/
    echo 'open_basedir = ${open_basedir}:/usr/share/webapps/moodle:/usr/share/webapps/moodledata:/var/lib/moodle' > $pkgdir/etc/php/conf.d/${_pkgname}.ini
}
