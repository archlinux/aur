# Maintainer: James An <james@jamesan.ca>

_pkgname=provision
pkgname=aegir-$_pkgname
pkgver=7.x_3.0_beta2
pkgrel=1
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')
source=('drush-8.patch')
md5sums=('79573892736baf4e5a0b95f4f20eec15')

pkgver() {
    drush rl --fields=version --field-labels=0 provision | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' '
}

prepare() {
    drush dl $_pkgname --yes --destination="$srcdir" &>/dev/null
    echo 'extension=posix.so' >| "$srcdir/posix.aegir.ini"

    cd $_pkgname
    patch -p1 < ../drush-8.patch
}

build() {
    cd $_pkgname

    msg2 'Purging unwanted files'
    rm -r debian
    rm LICENSE.txt
    rm upgrade.sh.txt
    rm release.sh
}

package() {
    cd $_pkgname

    msg2 'Adding doc files'
    install -m755 -d "$pkgdir/usr/share/doc/$pkgname/examples"
    mv -t "$pkgdir/usr/share/doc/$pkgname/examples" example example.drushrc.php example.sudoers
    mv -t "$pkgdir/usr/share/doc/$pkgname" HACKING_2x.mdwn *.txt
    find "$pkgdir/usr/share/doc/$pkgname" -type f -exec chmod 0644 {} +
    find "$pkgdir/usr/share/doc/$pkgname" -type d -exec chmod 0755 {} +

    msg2 'Adding main files'
    install -m755 -d "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"
    mv * "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"
    find "$pkgdir/usr/share/webapps/drush/commands/$_pkgname" -type f -exec chmod 0644 {} +
    find "$pkgdir/usr/share/webapps/drush/commands/$_pkgname" -type d -exec chmod 0755 {} +

    msg2 'Adding .ini file to enable PHP extensions'
    install -Dm644 "$srcdir/posix.ini" "$pkgdir/etc/php/conf.d/posix.ini"
}
