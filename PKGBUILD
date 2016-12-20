# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-hostmaster
_pkgname=${pkgname#aegir-}
pkgver=7.x_3.9_beta1
pkgrel=4
pkgdesc="mass Drupal hosting system - frontend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')
source=("https://ftp.drupal.org/files/projects/$_pkgname-${pkgver//_/-}-no-core.tar.gz"
        'https://ftp.drupal.org/files/projects/devel_debug_log-7.x-1.2.tar.gz'
        'https://ftp.drupal.org/files/projects/devel-7.x-1.5.tar.gz'
        'https://ftp.drupal.org/files/projects/drupal-7.51.tar.gz'
        'https://gitlab.com/aegir/hosting_https/repository/archive.tar.gz?ref=master'
        'https://github.com/lukas2511/dehydrated/archive/master.tar.gz')
md5sums=('ce4c49a5c3325505b266201e0cdc4a48'
         '19561aa1a0f2e549acf5c44a8cad8e14'
         'f06c912eb4edbd48fbcc2867516726a3'
         '49f82c1cac8e4bd4941ca160fcbee93d'
         'e39904682de04c044d518a6f1f173e26'
         '62f0351d36f900884705207922d5c7d5')

package() {
  install -d $pkgdir/{var/lib,usr/share/webapps}/$_pkgname

  cp -a drupal-7.51/* "$pkgdir/usr/share/webapps/$_pkgname"
  cp -a $_pkgname "$pkgdir/usr/share/webapps/$_pkgname/profiles/$_pkgname"
  mv "$pkgdir/usr/share/webapps/$_pkgname/sites" "$pkgdir/var/lib/$_pkgname"
  ln -s "/var/lib/$_pkgname/sites" "$pkgdir/usr/share/webapps/$_pkgname"
  cp -a devel devel_debug_log "$pkgdir/var/lib/$_pkgname/sites/all/modules"
  cp -aT hosting_https-master-* "$pkgdir/var/lib/$_pkgname/sites/all/modules/hosting_https"
  cp -aT dehydrated-master "$pkgdir/var/lib/$_pkgname/sites/all/modules/hosting_https/submodules/letsencrypt/drush/bin/letsencrypt"

  install -D <( ) "$pkgdir/var/lib/$_pkgname/sites/all/drush/drushrc.php"
  install -D <( ) "$pkgdir/var/lib/$_pkgname/sites/sites.php"

  find $pkgdir/{var/lib,usr/share/webapps}/$_pkgname -type d -exec chmod 775 {} +
  find $pkgdir/{var/lib,usr/share/webapps}/$_pkgname -type f -exec chmod 664 {} +
  chown -R http:http $pkgdir/{var/lib,usr/share/webapps}/$_pkgname

  #~ # correct file permissions (disabling file execution)
  #~ find "$pkgdir/var/lib/aegir     " -type f -exec chmod 0644 {} +
  #~ find "$pkgdir" -type d -exec chmod 0755 {} +
}
