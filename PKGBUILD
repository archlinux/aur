# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-hostmaster
_pkgname=${pkgname#aegir-}
pkgver=7.x_3.9
pkgrel=2
pkgdesc="mass Drupal hosting system - frontend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')
makedepends=('git')
optdepends=('dehydrated')
source=("https://ftp.drupal.org/files/projects/$_pkgname-${pkgver//_/-}-no-core.tar.gz"
        'https://ftp.drupal.org/files/projects/devel_debug_log-7.x-1.2.tar.gz'
        'https://ftp.drupal.org/files/projects/devel-7.x-1.5.tar.gz'
        'https://ftp.drupal.org/files/projects/drupal-7.53.tar.gz'
        'hosting_https'::'git+https://gitlab.com/aegir/hosting_https.git'
        hosting_https-pkg-info.patch
        hosting-hook_hosting_TASK_OBJECT_context_options-2846897-2.patch)
md5sums=('6d27c8b0de71db7c6e2b041da25c5fef'
         '19561aa1a0f2e549acf5c44a8cad8e14'
         'f06c912eb4edbd48fbcc2867516726a3'
         '4230279ecca4f0cde652a219e10327e7'
         'SKIP'
         'da16dba10759dfa59c7d760419f3f042'
         'faa872c26a49c62d841574ae10a43a20')

prepare() {
  patch --directory=hosting_https --strip=1 < hosting_https-pkg-info.patch
  patch --directory="$_pkgname/modules/aegir/hosting" --strip=1 < hosting-hook_hosting_TASK_OBJECT_context_options-2846897-2.patch
}

package() {
  install -d $pkgdir/{var/lib,usr/share/webapps}/$_pkgname

  cp -a drupal-7.53/* "$pkgdir/usr/share/webapps/$_pkgname"
  cp -a $_pkgname "$pkgdir/usr/share/webapps/$_pkgname/profiles/$_pkgname"
  mv "$pkgdir/usr/share/webapps/$_pkgname/sites" "$pkgdir/var/lib/$_pkgname"
  ln -s "/var/lib/$_pkgname/sites" "$pkgdir/usr/share/webapps/$_pkgname"
  cp -a devel devel_debug_log "$pkgdir/var/lib/$_pkgname/sites/all/modules"
  cp -aT hosting_https "$pkgdir/var/lib/$_pkgname/sites/all/modules/hosting_https"
  ln -s /usr/bin/dehydrated "$pkgdir/var/lib/$_pkgname/sites/all/modules/hosting_https/submodules/letsencrypt/drush/bin/letsencrypt"

  install -D <( ) "$pkgdir/var/lib/$_pkgname/sites/all/drush/drushrc.php"
  install -D <( ) "$pkgdir/var/lib/$_pkgname/sites/sites.php"

  find $pkgdir/{var/lib,usr/share/webapps}/$_pkgname -type d -exec chmod 775 {} +
  find $pkgdir/{var/lib,usr/share/webapps}/$_pkgname -type f -exec chmod 664 {} +
  chown -R http:http $pkgdir/{var/lib,usr/share/webapps}/$_pkgname

  #~ # correct file permissions (disabling file execution)
  #~ find "$pkgdir/var/lib/aegir     " -type f -exec chmod 0644 {} +
  #~ find "$pkgdir" -type d -exec chmod 0755 {} +
}
