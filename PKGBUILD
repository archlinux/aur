# Maintainer: James An <james@jamesan.ca>

_pkgname=provision
pkgname=aegir-${_pkgname/_/-}
pkgver=7.x_3.0
pkgrel=2
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')

pkgver() {
    drush rl --fields=version --field-labels=0 hostmaster | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' '
}

prepare() {
    drush dl $_pkgname --yes --destination="$srcdir" &>/dev/null
    echo 'extension=posix.so' >| "$srcdir/posix.ini"

    cd $_pkgname
    rm -r debian
    rm LICENSE.txt
    rm upgrade.sh.txt
    rm release.sh
}

package() {
    cd $_pkgname

    msg2 'Adding doc files'
    for file in example.drushrc.php example.sudoers *.txt; do
      install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
    done
    cp --archive example "$pkgdir/usr/share/doc/$pkgname"

    msg2 'Adding main files'
    for file in provision.api.php provision.info *.inc *.make ; do
      install -Dm644 "$file" "$pkgdir/usr/share/webapps/drush/commands/$_pkgname/$file"
    done
    for dir in Provision Symfony db dns http platform provision-tests; do
      cp --archive "$dir" "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"
    done

    msg2 'Adding .ini file to enable PHP extensions'
    install -Dm644 <(echo 'extension=posix.so') "$pkgdir/etc/php/conf.d/posix.ini"
}
