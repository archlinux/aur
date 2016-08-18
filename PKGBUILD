# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-hostmaster
_pkgname=${pkgname##*-}
pkgver=7.x_3.7
pkgrel=2
pkgdesc="mass Drupal hosting system - frontend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')
source=("https://ftp.drupal.org/files/projects/$_pkgname-${pkgver//_/-}-core.tar.gz"
        "https://ftp.drupal.org/files/projects/devel-${pkgver%_*}-1.5.tar.gz"
        "https://ftp.drupal.org/files/projects/devel_debug_log-${pkgver%_*}-1.2.tar.gz"
        "https://ftp.drupal.org/files/projects/drupal-7.50.tar.gz")
md5sums=('3e3340a3a09c8e533b6bac242f882bfb'
         'f06c912eb4edbd48fbcc2867516726a3'
         '19561aa1a0f2e549acf5c44a8cad8e14'
         'f23905b0248d76f0fc8316692cd64753')

prepare() {
  drush pm-releases --default-major=7 --no-dev --no-field-labels --pipe $_pkgname | \
    egrep --invert-match ',7\.x-[0-9]+\.x-dev,' | \
    sort --field-separator=, --key=2V | \
    cut --fields=2 --delimiter=, | tr '-' '_'
}

package() {
  install -dm755 "$pkgdir/usr/share/webapps/$_pkgname"
  install -dm755 "$pkgdir/var/lib/$_pkgname"

  cp --archive --no-target-directory drupal-7.50 "$pkgdir/usr/share/webapps/$_pkgname"
  rsync --archive --ignore-existing "$_pkgname-${pkgver//_/-}/" "$pkgdir/usr/share/webapps/$_pkgname"
  mv "$pkgdir/usr/share/webapps/$_pkgname/sites" "$pkgdir/var/lib/$_pkgname"
  ln -s "/var/lib/$_pkgname/sites" "$pkgdir/usr/share/webapps/$_pkgname"
  cp -a devel devel_debug_log "$pkgdir/var/lib/$_pkgname/sites/all/modules"

  install -Dm664 <( ) "$pkgdir/var/lib/$_pkgname/sites/all/drush/drushrc.php"
  install -Dm664 <( ) "$pkgdir/var/lib/$_pkgname/sites/sites.php"

  chown -R http:http "$pkgdir/var/lib/$_pkgname" "$pkgdir/usr/share/webapps/$_pkgname"
  find "$pkgdir/var/lib/$_pkgname" "$pkgdir/usr/share/webapps/$_pkgname" -type d -exec chmod 775 {} +
  find "$pkgdir/var/lib/$_pkgname" "$pkgdir/usr/share/webapps/$_pkgname" -type f -exec chmod 664 {} +
}
