# Maintainer: James An <james@jamesan.ca>

_pkgname=provision
pkgname=aegir-${_pkgname/_/-}
pkgver=7.x_3.4
pkgrel=1
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')

pkgver() {
    drush rl --default-major=7 --fields=version --field-labels=0 $_pkgname | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' '
}

prepare() {
    drush dl --default-major=7 $_pkgname --yes --destination="$srcdir" &>/dev/null

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
}
