# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-provision
_pkgname=${pkgname##*-}
pkgver=7.x_3.9
pkgrel=2
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')
source=("https://ftp.drupal.org/files/projects/$_pkgname-${pkgver//_/-}.tar.gz")
md5sums=('97f5e1e63b121fa2f442b45b5731ce68')

package() {
    cd $_pkgname

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install --directory "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"
    cp --archive --target-directory="$pkgdir/usr/share/webapps/drush/commands/$_pkgname" \
      db http platform Provision Symfony \
      provision.{api.php,{,{context,drush,file,service}.}inc,info} \
      {install,migrate,uninstall}.hostmaster.inc parse.backend.inc

    install --directory "$pkgdir/usr/share/doc/$pkgname"
    for file in example.drushrc.php example.sudoers README.md; do
      cp --archive --target-directory="$pkgdir/usr/share/doc/$pkgname" $file
      ln --relative --symbolic $pkgdir/usr/share/{doc/$pkgname,webapps/drush/commands/$_pkgname}/$file
    done

    install --directory "$pkgdir/usr/share/$pkgname"
    for file in aegir{,-{dev,release}}.make provision-tests scripts upgrade.sh.txt Vagrantfile; do
      cp --archive --target-directory="$pkgdir/usr/share/$pkgname" $file
      ln --relative --symbolic $pkgdir/usr/share/{$pkgname,webapps/drush/commands/$_pkgname}/$file
    done
}
